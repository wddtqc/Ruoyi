package com.ruoyi.iot.mqtt;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.iot.domain.IotSensorData;
import com.ruoyi.iot.service.IIoTDataProcessService;
import com.ruoyi.iot.service.IIotSensorDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * MQTT消息监听器
 * <p>
 * 功能说明：
 * 1. 接收从MQTT Broker订阅的消息
 * 2. 根据主题分发消息到不同的处理器
 * 3. 委托给业务Service层进行数据处理
 * </p>
 *
 * 监听主题：
 * - /agriculture/sensor/upload  农业传感器数据上报
 *
 * @author ruoyi
 */
@Component
public class MqttMessageListener {

    private static final Logger log = LoggerFactory.getLogger(MqttMessageListener.class);

    @Autowired
    private IIoTDataProcessService ioTDataProcessService;

    @Autowired
    private IIotSensorDataService iotSensorDataService;

    /**
     * 农业传感器数据上报主题
     */
    private static final String TOPIC_SENSOR_UPLOAD = "/agriculture/sensor/upload";

    /**
     * 水质监测数据上报主题
     */
    private static final String TOPIC_WATER_UPLOAD = "/agriculture/water/upload";

    /**
     * 处理MQTT消息的核心方法
     * <p>
     * 该方法由MqttConfig中的MessageHandler调用，
     * 接收从MQTT Broker订阅的所有消息。
     * </p>
     *
     * @param topic   消息主题
     * @param payload 消息载荷（JSON字符串）
     */
    public void handleMessage(String topic, String payload) {
        try {
            log.info("=== MQTT消息监听器收到消息 ===");
            log.info("主题: {}", topic);
            log.info("内容: {}", payload);

            // 根据主题分发消息到不同的处理器
            if (topic.equals(TOPIC_SENSOR_UPLOAD)) {
                // 处理农业传感器数据上报
                handleSensorUpload(payload);
            } else if (topic.equals(TOPIC_WATER_UPLOAD)) {
                // 处理水质监测数据上报
                handleWaterQualityUpload(payload);
            } else {
                log.warn("未知的MQTT主题: {}", topic);
            }

        } catch (Exception e) {
            log.error("MQTT消息处理失败 -> 主题: {}, 内容: {}", topic, payload, e);
        }
    }

    /**
     * 处理农业传感器数据上报
     * <p>
     * 业务流程：
     * 1. 使用 Fastjson2 解析 JSON 报文
     * 2. 将 JSON 字段映射到 IotSensorData 实体类
     * 3. 调用 Service 层持久化到数据库（iot_sensor_data 表）
     * 4. 委托给原有的业务处理流程（设备状态更新、告警触发等）
     * </p>
     *
     * @param payload JSON格式的传感器数据
     */
    private void handleSensorUpload(String payload) {
        try {
            log.info("开始处理农业传感器数据上报");

            // ========== 步骤1：使用 Fastjson2 解析 JSON 数据 ==========
            JSONObject jsonObject = JSON.parseObject(payload);

            // ========== 步骤2：组装 IotSensorData 实体对象 ==========
            IotSensorData sensorData = new IotSensorData();

            // 设备基础信息
            sensorData.setSerialNumber(jsonObject.getString("serialNumber"));
            sensorData.setDeviceType(jsonObject.getString("deviceType"));
            sensorData.setDeviceTimestamp(jsonObject.getLong("timestamp"));

            // 环境参数
            sensorData.setHumidity(jsonObject.getDouble("humidity"));
            sensorData.setTemperature(jsonObject.getDouble("temperature"));
            sensorData.setSoilPh(jsonObject.getDouble("soilPH"));

            // NPK 营养元素
            sensorData.setNitrogen(jsonObject.getDouble("nitrogen"));
            sensorData.setPhosphorus(jsonObject.getDouble("phosphorus"));
            sensorData.setPotassium(jsonObject.getDouble("potassium"));

            // 信号强度
            sensorData.setSignalStrength(jsonObject.getInteger("signalStrength"));

            // 系统入库时间（由数据库自动填充，这里也可以手动设置）
            sensorData.setCreateTime(new Date());

            // ========== 步骤3：调用 Service 层保存到数据库 ==========
            int saveResult = iotSensorDataService.insertIotSensorData(sensorData);

            if (saveResult <= 0) {
                log.error("传感器数据持久化失败 -> 设备序列号: {}", sensorData.getSerialNumber());
            }

            // ========== 步骤4：委托给原有业务Service处理（设备状态、告警等） ==========
            // 该方法会完成：设备查询 -> 状态更新 -> 告警触发 的完整流程
            ioTDataProcessService.processSensorData(payload);

            log.info("传感器数据处理完成 -> 设备序列号: {}, 数据已持久化", sensorData.getSerialNumber());

        } catch (com.alibaba.fastjson2.JSONException e) {
            log.error("JSON 解析失败，请检查 payload 格式是否正确 -> 原始数据: {}", payload, e);
            // JSON 解析异常不向上抛出，防止整个 MQTT 监听器崩溃
        } catch (NullPointerException e) {
            log.error("数据字段缺失或为空，无法完成映射 -> payload: {}", payload, e);
        } catch (Exception e) {
            log.error("传感器数据处理失败，发生未知异常 -> payload: {}", payload, e);
            // 这里可以根据业务需要决定是否重新抛出异常
            // throw e; // 如果需要让上层感知异常，可以取消注释
        }
    }

    /**
     * 处理水质监测数据上报
     * <p>
     * 业务流程：
     * 1. 解析水质监测数据JSON
     * 2. 更新设备运行状态（在线状态、信号强度等）
     * 3. 保存水质数据到数据库
     * </p>
     *
     * @param payload JSON格式的水质监测数据
     */
    private void handleWaterQualityUpload(String payload) {
        try {
            log.info("开始处理水质监测数据上报");

            // 解析JSON数据
            JSONObject jsonObject = JSON.parseObject(payload);
            String serialNumber = jsonObject.getString("serialNumber");

            if (serialNumber == null || serialNumber.trim().isEmpty()) {
                log.error("设备编号为空，无法处理水质数据: {}", payload);
                return;
            }

            // 调用通用的IoT数据处理服务更新设备状态
            // 该方法会完成：设备查询 -> 状态更新 -> 告警触发
            ioTDataProcessService.processSensorData(payload);

            log.info("水质监测数据处理完成 -> 设备序列号: {}", serialNumber);

        } catch (com.alibaba.fastjson2.JSONException e) {
            log.error("JSON 解析失败，请检查 payload 格式是否正确 -> 原始数据: {}", payload, e);
        } catch (NullPointerException e) {
            log.error("数据字段缺失或为空，无法完成映射 -> payload: {}", payload, e);
        } catch (Exception e) {
            log.error("水质监测数据处理失败，发生未知异常 -> payload: {}", payload, e);
        }
    }
}
