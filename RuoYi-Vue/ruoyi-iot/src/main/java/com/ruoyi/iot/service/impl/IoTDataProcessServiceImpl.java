package com.ruoyi.iot.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.iot.domain.IotDevice;
import com.ruoyi.iot.domain.IotDeviceAlert;
import com.ruoyi.iot.domain.IotDeviceRunningStatus;
import com.ruoyi.iot.mapper.IotDeviceMapper;
import com.ruoyi.iot.mapper.IotDeviceRunningStatusMapper;
import com.ruoyi.iot.service.IIoTDataProcessService;
import com.ruoyi.iot.service.IIotDeviceAlertService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * IoT数据处理Service实现类
 * <p>
 * 核心业务：
 * 1. 解析MQTT传感器数据
 * 2. 更新设备主表和运行状态表
 * 3. 智能告警触发
 * </p>
 *
 * @author ruoyi
 */
@Service
public class IoTDataProcessServiceImpl implements IIoTDataProcessService {

    private static final Logger log = LoggerFactory.getLogger(IoTDataProcessServiceImpl.class);

    @Autowired
    private IotDeviceMapper iotDeviceMapper;

    @Autowired
    private IotDeviceRunningStatusMapper iotDeviceRunningStatusMapper;

    @Autowired
    private IIotDeviceAlertService iotDeviceAlertService;

    /**
     * 告警阈值配置
     */
    private static final double HUMIDITY_HIGH_THRESHOLD = 80.0;     // 湿度过高阈值（内涝风险）
    private static final double HUMIDITY_LOW_THRESHOLD = 15.0;      // 湿度过低阈值（干旱风险）
    private static final double NITROGEN_LOW_THRESHOLD = 10.0;      // 氮含量过低阈值（缺氮）
    private static final double PHOSPHORUS_LOW_THRESHOLD = 5.0;     // 磷含量过低阈值（缺磷）
    private static final double POTASSIUM_LOW_THRESHOLD = 50.0;     // 钾含量过低阈值（缺钾）

    /**
     * 处理传感器数据的核心方法
     * <p>
     * 事务控制：使用@Transactional确保数据一致性
     * </p>
     *
     * @param sensorDataJson 传感器数据JSON字符串
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void processSensorData(String sensorDataJson) {
        try {
            log.info("========== 开始处理传感器数据 ==========");

            // =====================================================
            // 第一步：解析JSON报文，提取设备编号和传感器数据
            // =====================================================
            JSONObject sensorData = JSON.parseObject(sensorDataJson);
            String serialNumber = sensorData.getString("serialNumber");

            if (serialNumber == null || serialNumber.trim().isEmpty()) {
                log.error("设备编号为空，无法处理数据: {}", sensorDataJson);
                return;
            }

            log.info("【步骤1】解析JSON完成 -> 设备编号: {}", serialNumber);

            // 提取传感器数值（兼容土壤传感器和水质监测设备）
            Double humidity = sensorData.getDouble("humidity");         // 土壤湿度
            Double nitrogen = sensorData.getDouble("nitrogen");         // 氮含量
            Double phosphorus = sensorData.getDouble("phosphorus");     // 磷含量
            Double potassium = sensorData.getDouble("potassium");       // 钾含量
            Double temperature = sensorData.getDouble("temperature");   // 环境温度
            Double soilPH = sensorData.getDouble("soilPH");            // 土壤pH

            // 水质监测设备字段
            Double waterTemperature = sensorData.getDouble("water_temperature");  // 水温
            Double waterPh = sensorData.getDouble("water_ph");                    // 水体pH
            Double dissolvedOxygen = sensorData.getDouble("dissolved_oxygen");    // 溶解氧
            Double turbidity = sensorData.getDouble("turbidity");                 // 浊度

            // 气象检测设备字段
            Integer airHumidity = sensorData.getInteger("air_humidity");          // 空气湿度
            Integer light = sensorData.getInteger("light");                       // 光照强度
            Integer co2 = sensorData.getInteger("co2");                           // CO2浓度
            Double airTemperature = sensorData.getDouble("air_temperature");      // 气温

            Integer signalStrength = sensorData.getInteger("signalStrength"); // 信号强度

            // =====================================================
            // 第二步：查询设备主表（iot_device）
            // =====================================================
            IotDevice queryDevice = new IotDevice();
            queryDevice.setSerialNumber(serialNumber);
            java.util.List<IotDevice> deviceList = iotDeviceMapper.selectIotDeviceList(queryDevice);

            if (deviceList == null || deviceList.isEmpty()) {
                log.warn("设备不存在 -> 设备编号: {}，请先在系统中添加该设备", serialNumber);
                return;
            }

            IotDevice device = deviceList.get(0);
            Long deviceId = device.getDeviceId();
            String deviceName = device.getDeviceName();
            Long productId = device.getProductId();
            String productName = device.getProductName();

            log.info("【步骤2】查询设备成功 -> ID: {}, 名称: {}, 产品: {}", deviceId, deviceName, productName);

            // =====================================================
            // 第三步：更新设备主表状态为在线
            // =====================================================
            IotDevice updateDevice = new IotDevice();
            updateDevice.setDeviceId(deviceId);
            updateDevice.setStatus(3); // 状态：3-在线
            updateDevice.setUpdateTime(new Date());

            int updateDeviceResult = iotDeviceMapper.updateIotDevice(updateDevice);
            log.info("【步骤3】更新设备主表 -> 影响行数: {}, 状态: 在线", updateDeviceResult);

            // =====================================================
            // 第四步：更新设备运行状态表（iot_device_running_status）
            // =====================================================
            // 构造物模型实时值JSON（保留所有传感器数据）
            JSONObject thingsModelValue = new JSONObject();

            // 土壤传感器数据
            if (humidity != null) thingsModelValue.put("humidity", humidity);
            if (nitrogen != null) thingsModelValue.put("nitrogen", nitrogen);
            if (phosphorus != null) thingsModelValue.put("phosphorus", phosphorus);
            if (potassium != null) thingsModelValue.put("potassium", potassium);
            if (temperature != null) thingsModelValue.put("temperature", temperature);
            if (soilPH != null) thingsModelValue.put("soilPH", soilPH);

            // 水质监测数据
            if (waterTemperature != null) thingsModelValue.put("water_temperature", waterTemperature);
            if (waterPh != null) thingsModelValue.put("water_ph", waterPh);
            if (dissolvedOxygen != null) thingsModelValue.put("dissolved_oxygen", dissolvedOxygen);
            if (turbidity != null) thingsModelValue.put("turbidity", turbidity);

            // 气象检测数据
            if (airHumidity != null) thingsModelValue.put("air_humidity", airHumidity);
            if (light != null) thingsModelValue.put("light", light);
            if (co2 != null) thingsModelValue.put("co2", co2);
            if (airTemperature != null) thingsModelValue.put("air_temperature", airTemperature);

            // 查询是否已存在运行状态记录
            IotDeviceRunningStatus existingStatus = iotDeviceRunningStatusMapper.selectIotDeviceRunningStatusByDeviceId(deviceId);

            if (existingStatus == null) {
                // 如果不存在，则新增记录
                IotDeviceRunningStatus newStatus = new IotDeviceRunningStatus();
                newStatus.setDeviceId(deviceId);
                newStatus.setDeviceName(deviceName);
                newStatus.setSerialNumber(serialNumber);
                newStatus.setProductId(productId);
                newStatus.setStatus(3); // 状态：3-在线
                newStatus.setRssi(signalStrength);
                newStatus.setOnlineTime(new Date());
                newStatus.setThingsModelValue(thingsModelValue.toJSONString());
                newStatus.setUpdateTime(new Date());

                iotDeviceRunningStatusMapper.insertIotDeviceRunningStatus(newStatus);
                log.info("【步骤4】新增运行状态记录 -> 设备ID: {}", deviceId);

            } else {
                // 如果已存在，则更新记录
                IotDeviceRunningStatus updateStatus = new IotDeviceRunningStatus();
                updateStatus.setStatusId(existingStatus.getStatusId());
                updateStatus.setStatus(3); // 状态：3-在线
                updateStatus.setRssi(signalStrength);
                updateStatus.setOnlineTime(new Date());
                updateStatus.setThingsModelValue(thingsModelValue.toJSONString());
                updateStatus.setUpdateTime(new Date());

                iotDeviceRunningStatusMapper.updateIotDeviceRunningStatus(updateStatus);
                log.info("【步骤4】更新运行状态记录 -> 状态ID: {}, 物模型值: {}", existingStatus.getStatusId(), thingsModelValue.toJSONString());
            }

            // =====================================================
            // 第五步：智能告警触发（检测异常阈值）
            // =====================================================
            checkAndTriggerAlert(deviceId, deviceName, productId, productName, humidity, nitrogen, phosphorus, potassium);

            log.info("========== 传感器数据处理完成 ==========");

        } catch (Exception e) {
            log.error("传感器数据处理失败", e);
            throw new RuntimeException("传感器数据处理失败: " + e.getMessage(), e);
        }
    }

    /**
     * 检测异常并触发告警
     * <p>
     * 告警规则：
     * 1. 土壤湿度 > 80% -> 严重内涝异常
     * 2. 土壤湿度 < 15% -> 严重干旱异常
     * 3. 氮含量 < 10 mg/kg -> 氮元素缺乏
     * 4. 磷含量 < 5 mg/kg -> 磷元素缺乏
     * 5. 钾含量 < 50 mg/kg -> 钾元素缺乏
     * </p>
     *
     * @param deviceId    设备ID
     * @param deviceName  设备名称
     * @param productId   产品ID
     * @param productName 产品名称
     * @param humidity    土壤湿度
     * @param nitrogen    氮含量
     * @param phosphorus  磷含量
     * @param potassium   钾含量
     */
    private void checkAndTriggerAlert(Long deviceId, String deviceName, Long productId, String productName,
                                      Double humidity, Double nitrogen, Double phosphorus, Double potassium) {

        log.info("【步骤5】开始检测告警阈值...");

        // 检测1：土壤湿度过高（内涝风险）
        if (humidity != null && humidity > HUMIDITY_HIGH_THRESHOLD) {
            IotDeviceAlert alert = new IotDeviceAlert();
            alert.setDeviceId(deviceId);
            alert.setDeviceName(deviceName);
            alert.setProductId(productId);
            alert.setProductName(productName);
            alert.setAlertName("土壤湿度过高异常");
            alert.setAlertLevel(3); // 告警级别：3-严重
            alert.setAlertContent(String.format("监测到设备【%s】土壤湿度达到%.1f%%，超过安全阈值%.1f%%，可能存在内涝风险，请及时排水处理。",
                    deviceName, humidity, HUMIDITY_HIGH_THRESHOLD));
            alert.setAlertTime(new Date());
            alert.setAlertType("环境异常");
            alert.setSource("属性");
            alert.setSourceIdentifier("humidity");
            alert.setStatus(0); // 处理状态：0-未处理

            iotDeviceAlertService.insertIotDeviceAlert(alert);
            log.warn("!!! 触发告警：土壤湿度过高 -> {}%", humidity);
        }

        // 检测2：土壤湿度过低（干旱风险）
        if (humidity != null && humidity < HUMIDITY_LOW_THRESHOLD) {
            IotDeviceAlert alert = new IotDeviceAlert();
            alert.setDeviceId(deviceId);
            alert.setDeviceName(deviceName);
            alert.setProductId(productId);
            alert.setProductName(productName);
            alert.setAlertName("土壤湿度过低异常");
            alert.setAlertLevel(2); // 告警级别：2-一般
            alert.setAlertContent(String.format("监测到设备【%s】土壤湿度仅%.1f%%，低于安全阈值%.1f%%，可能存在干旱风险，请及时灌溉。",
                    deviceName, humidity, HUMIDITY_LOW_THRESHOLD));
            alert.setAlertTime(new Date());
            alert.setAlertType("环境异常");
            alert.setSource("属性");
            alert.setSourceIdentifier("humidity");
            alert.setStatus(0);

            iotDeviceAlertService.insertIotDeviceAlert(alert);
            log.warn("!!! 触发告警：土壤湿度过低 -> {}%", humidity);
        }

        // 检测3：氮元素缺乏
        if (nitrogen != null && nitrogen < NITROGEN_LOW_THRESHOLD) {
            IotDeviceAlert alert = new IotDeviceAlert();
            alert.setDeviceId(deviceId);
            alert.setDeviceName(deviceName);
            alert.setProductId(productId);
            alert.setProductName(productName);
            alert.setAlertName("土壤氮元素缺乏");
            alert.setAlertLevel(3); // 告警级别：3-严重
            alert.setAlertContent(String.format("监测到设备【%s】土壤氮含量仅%.1f mg/kg，严重低于正常范围（%.1f mg/kg以上），作物可能出现缺氮症状，请及时补施氮肥。",
                    deviceName, nitrogen, NITROGEN_LOW_THRESHOLD));
            alert.setAlertTime(new Date());
            alert.setAlertType("营养缺乏");
            alert.setSource("属性");
            alert.setSourceIdentifier("nitrogen");
            alert.setStatus(0);

            iotDeviceAlertService.insertIotDeviceAlert(alert);
            log.warn("!!! 触发告警：氮元素缺乏 -> {} mg/kg", nitrogen);
        }

        // 检测4：磷元素缺乏
        if (phosphorus != null && phosphorus < PHOSPHORUS_LOW_THRESHOLD) {
            IotDeviceAlert alert = new IotDeviceAlert();
            alert.setDeviceId(deviceId);
            alert.setDeviceName(deviceName);
            alert.setProductId(productId);
            alert.setProductName(productName);
            alert.setAlertName("土壤磷元素缺乏");
            alert.setAlertLevel(3); // 告警级别：3-严重
            alert.setAlertContent(String.format("监测到设备【%s】土壤磷含量仅%.1f mg/kg，严重低于正常范围（%.1f mg/kg以上），作物根系发育可能受阻，请及时补施磷肥。",
                    deviceName, phosphorus, PHOSPHORUS_LOW_THRESHOLD));
            alert.setAlertTime(new Date());
            alert.setAlertType("营养缺乏");
            alert.setSource("属性");
            alert.setSourceIdentifier("phosphorus");
            alert.setStatus(0);

            iotDeviceAlertService.insertIotDeviceAlert(alert);
            log.warn("!!! 触发告警：磷元素缺乏 -> {} mg/kg", phosphorus);
        }

        // 检测5：钾元素缺乏
        if (potassium != null && potassium < POTASSIUM_LOW_THRESHOLD) {
            IotDeviceAlert alert = new IotDeviceAlert();
            alert.setDeviceId(deviceId);
            alert.setDeviceName(deviceName);
            alert.setProductId(productId);
            alert.setProductName(productName);
            alert.setAlertName("土壤钾元素缺乏");
            alert.setAlertLevel(2); // 告警级别：2-一般
            alert.setAlertContent(String.format("监测到设备【%s】土壤钾含量仅%.1f mg/kg，低于正常范围（%.1f mg/kg以上），作物抗逆性可能下降，建议补施钾肥。",
                    deviceName, potassium, POTASSIUM_LOW_THRESHOLD));
            alert.setAlertTime(new Date());
            alert.setAlertType("营养缺乏");
            alert.setSource("属性");
            alert.setSourceIdentifier("potassium");
            alert.setStatus(0);

            iotDeviceAlertService.insertIotDeviceAlert(alert);
            log.warn("!!! 触发告警：钾元素缺乏 -> {} mg/kg", potassium);
        }

        log.info("【步骤5】告警检测完成");
    }
}
