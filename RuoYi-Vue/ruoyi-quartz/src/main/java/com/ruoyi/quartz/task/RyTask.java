package com.ruoyi.quartz.task;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.iot.mqtt.MqttPublisher;
import com.ruoyi.iot.service.IIotWaterQualityDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ruoyi.common.utils.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Random;

/**
 * 定时任务调度测试
 *
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask
{
    private static final Logger log = LoggerFactory.getLogger(RyTask.class);

    @Autowired
    private MqttPublisher mqttPublisher;

    @Autowired
    private IIotWaterQualityDataService waterQualityDataService;

    private static final String MQTT_TOPIC = "/agriculture/sensor/upload";
    private static final String DEFAULT_SERIAL_NUMBER = "NPK-TEST-001";
    private static final double ABNORMAL_PROBABILITY = 0.05;

    private final Random random = new Random();

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }

    // ==================== 农业传感器数据模拟方法（独立版本） ====================

    /**
     * 模拟传感器数据推送（无参数版本）
     * <p>
     * 若依后台调用目标字符串：ryTask.mockSensorData()
     * </p>
     */
    public void mockSensorData()
    {
        mockSensorData(DEFAULT_SERIAL_NUMBER);
    }

    /**
     * 模拟传感器数据推送（带设备编号参数）
     * <p>
     * 若依后台调用目标字符串：ryTask.mockSensorData('NPK-TEST-001')
     * <p>
     * 注意：这是独立版本，不依赖IoT模块
     * 数据会生成并输出到日志，可用于测试定时任务功能
     * </p>
     *
     * @param serialNumber 设备编号
     */
    public void mockSensorData(String serialNumber)
    {
        try
        {
            if (serialNumber == null || serialNumber.trim().isEmpty())
            {
                serialNumber = DEFAULT_SERIAL_NUMBER;
            }

            log.info("========== 开始执行农业传感器数据模拟任务 ==========");

            JSONObject sensorData = generateMockSensorData(serialNumber);
            String jsonMessage = sensorData.toJSONString();

            log.info("【模拟数据生成】设备编号: {}", serialNumber);
            log.info("【模拟数据内容】{}", jsonMessage);

            mqttPublisher.sendToMqtt(MQTT_TOPIC, jsonMessage, 1);

            log.info("【数据发送完成】主题: {}, QoS: 1, 消息长度: {} bytes", MQTT_TOPIC, jsonMessage.length());
            log.info("========== 农业传感器数据模拟任务执行完成 ==========");
        }
        catch (Exception e)
        {
            log.error("【任务执行失败】农业传感器数据模拟任务异常", e);
            throw new RuntimeException("模拟传感器数据推送失败: " + e.getMessage(), e);
        }
    }

    /**
     * 批量模拟多个设备的数据推送
     * <p>
     * 若依后台调用目标字符串：ryTask.mockMultiDeviceSensorData('NPK-TEST-001,NPK-TEST-002,NPK-TEST-003')
     * </p>
     *
     * @param serialNumbers 设备编号列表（逗号分隔）
     */
    public void mockMultiDeviceSensorData(String serialNumbers)
    {
        if (serialNumbers == null || serialNumbers.trim().isEmpty())
        {
            log.warn("设备编号列表为空，跳过批量模拟");
            return;
        }

        String[] deviceArray = serialNumbers.split(",");
        log.info("========== 开始批量模拟 {} 个设备的数据 ==========", deviceArray.length);

        for (String serialNumber : deviceArray)
        {
            mockSensorData(serialNumber.trim());
        }

        log.info("========== 批量模拟完成，共处理 {} 个设备 ==========", deviceArray.length);
    }

    /**
     * 生成模拟传感器数据（JSON格式）
     * <p>
     * 正常数据范围：
     * - 土壤湿度：20% - 40%
     * - 氮含量(N)：30 - 60 mg/kg
     * - 磷含量(P)：10 - 25 mg/kg
     * - 钾含量(K)：70 - 100 mg/kg
     *
     * 异常数据（5%概率）：
     * - 严重内涝：湿度 > 80%
     * - 严重缺氮：氮 < 5 mg/kg
     * - 严重缺磷：磷 < 3 mg/kg
     * </p>
     *
     * @param serialNumber 设备编号
     * @return 模拟数据的JSON对象
     */
    private JSONObject generateMockSensorData(String serialNumber)
    {
        JSONObject data = new JSONObject();

        // 设备基本信息
        data.put("serialNumber", serialNumber);
        data.put("timestamp", System.currentTimeMillis());
        data.put("deviceType", "NPK_SENSOR");

        // 判断是否生成异常数据（5%概率）
        boolean isAbnormal = random.nextDouble() < ABNORMAL_PROBABILITY;

        double humidity;  // 土壤湿度 (%)
        double nitrogen;  // 氮含量 (mg/kg)
        double phosphorus; // 磷含量 (mg/kg)
        double potassium;  // 钾含量 (mg/kg)

        if (isAbnormal)
        {
            // 生成异常数据（用于触发告警测试）
            int abnormalType = random.nextInt(3);

            switch (abnormalType)
            {
                case 0: // 严重内涝异常（湿度过高）
                    humidity = randomDouble(80.0, 95.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("【异常数据生成】严重内涝风险 -> 湿度={}%", round(humidity, 1));
                    break;

                case 1: // 严重缺氮异常
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(1.0, 5.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("【异常数据生成】严重缺氮 -> 氮={}mg/kg", round(nitrogen, 1));
                    break;

                case 2: // 严重缺磷异常
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(0.5, 3.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("【异常数据生成】严重缺磷 -> 磷={}mg/kg", round(phosphorus, 1));
                    break;

                default:
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
            }
        }
        else
        {
            // 生成正常范围内的数据
            humidity = randomDouble(20.0, 40.0);      // 正常湿度
            nitrogen = randomDouble(30.0, 60.0);      // 正常氮含量
            phosphorus = randomDouble(10.0, 25.0);    // 正常磷含量
            potassium = randomDouble(70.0, 100.0);    // 正常钾含量
        }

        // 保留一位小数并放入JSON
        data.put("humidity", round(humidity, 1));
        data.put("nitrogen", round(nitrogen, 1));
        data.put("phosphorus", round(phosphorus, 1));
        data.put("potassium", round(potassium, 1));

        // 附加信息
        data.put("temperature", round(randomDouble(18.0, 28.0), 1)); // 环境温度
        data.put("soilPH", round(randomDouble(6.0, 7.5), 1));        // 土壤pH值
        data.put("signalStrength", random.nextInt(20) - 90);         // 信号强度 -90 ~ -70 dBm

        return data;
    }

    /**
     * 生成指定范围内的随机浮点数
     *
     * @param min 最小值
     * @param max 最大值
     * @return 随机浮点数
     */
    private double randomDouble(double min, double max)
    {
        return min + (max - min) * random.nextDouble();
    }

    /**
     * 对浮点数进行四舍五入，保留指定小数位数
     *
     * @param value 原始值
     * @param scale 保留小数位数
     * @return 四舍五入后的值
     */
    private double round(double value, int scale)
    {
        BigDecimal bd = new BigDecimal(Double.toString(value));
        bd = bd.setScale(scale, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }

    // ==================== 水质监测设备数据模拟方法 ====================

    private static final String WATER_MQTT_TOPIC = "/agriculture/water/upload";
    private static final String DEFAULT_WATER_DEVICE = "DEV17814946377282952";

    /**
     * 模拟水质监测数据推送（无参数版本）
     * <p>
     * 若依后台调用目标字符串：ryTask.mockWaterQualityData()
     * </p>
     */
    public void mockWaterQualityData()
    {
        mockWaterQualityData(DEFAULT_WATER_DEVICE);
    }

    /**
     * 模拟水质监测数据推送（带设备编号参数）
     * <p>
     * 若依后台调用目标字符串：ryTask.mockWaterQualityData('DEV17814946377282952')
     * <p>
     * 模拟水质监测四个核心参数：
     * - 水温：0-50℃
     * - pH值：0-14
     * - 溶解氧：0-20 mg/L
     * - 浊度：0-1000 NTU
     * </p>
     *
     * @param serialNumber 设备编号
     */
    public void mockWaterQualityData(String serialNumber)
    {
        try
        {
            if (serialNumber == null || serialNumber.trim().isEmpty())
            {
                serialNumber = DEFAULT_WATER_DEVICE;
            }

            log.info("========== 开始执行水质监测数据模拟任务 ==========");

            JSONObject waterData = generateMockWaterQualityData(serialNumber);
            String jsonMessage = waterData.toJSONString();

            log.info("【模拟数据生成】设备编号: {}", serialNumber);
            log.info("【模拟数据内容】{}", jsonMessage);

            // 1. 发送到MQTT
            mqttPublisher.sendToMqtt(WATER_MQTT_TOPIC, jsonMessage, 1);
            log.info("【数据发送完成】主题: {}, QoS: 1, 消息长度: {} bytes", WATER_MQTT_TOPIC, jsonMessage.length());

            // 2. 保存到数据库
            int saveResult = waterQualityDataService.saveWaterQualityDataFromMqtt(jsonMessage);
            if (saveResult > 0) {
                log.info("【数据入库成功】设备: {}, 水温: {}℃, pH: {}, 溶解氧: {}mg/L, 浊度: {}NTU",
                        serialNumber,
                        waterData.getDouble("water_temperature"),
                        waterData.getDouble("water_ph"),
                        waterData.getDouble("dissolved_oxygen"),
                        waterData.getDouble("turbidity"));
            } else {
                log.warn("【数据入库失败】设备: {}", serialNumber);
            }

            log.info("========== 水质监测数据模拟任务执行完成 ==========");
        }
        catch (Exception e)
        {
            log.error("【任务执行失败】水质监测数据模拟任务异常", e);
            throw new RuntimeException("模拟水质监测数据推送失败: " + e.getMessage(), e);
        }
    }

    /**
     * 批量模拟多个水质监测设备的数据推送
     * <p>
     * 若依后台调用目标字符串：ryTask.mockMultiWaterDeviceData('DEV001,DEV002,DEV003')
     * </p>
     *
     * @param serialNumbers 设备编号列表（逗号分隔）
     */
    public void mockMultiWaterDeviceData(String serialNumbers)
    {
        if (serialNumbers == null || serialNumbers.trim().isEmpty())
        {
            log.warn("设备编号列表为空，跳过批量模拟");
            return;
        }

        String[] deviceArray = serialNumbers.split(",");
        log.info("========== 开始批量模拟 {} 个水质设备的数据 ==========", deviceArray.length);

        for (String serialNumber : deviceArray)
        {
            mockWaterQualityData(serialNumber.trim());
        }

        log.info("========== 批量模拟完成，共处理 {} 个水质设备 ==========", deviceArray.length);
    }

    /**
     * 生成模拟水质监测数据（JSON格式）
     * <p>
     * 正常水质数据范围：
     * - 水温：15-25℃（适宜养殖温度）
     * - pH值：6.5-8.5（适宜pH范围）
     * - 溶解氧：5-10 mg/L（正常溶氧水平）
     * - 浊度：0-50 NTU（清澈水质）
     *
     * 异常数据（8%概率）：
     * - 高温异常：水温 > 35℃
     * - pH异常：pH < 5.5 或 pH > 9.5
     * - 缺氧异常：溶解氧 < 3 mg/L
     * - 浑浊异常：浊度 > 200 NTU
     * </p>
     *
     * @param serialNumber 设备编号
     * @return 模拟数据的JSON对象
     */
    private JSONObject generateMockWaterQualityData(String serialNumber)
    {
        JSONObject data = new JSONObject();

        // 设备基本信息
        data.put("serialNumber", serialNumber);
        data.put("timestamp", System.currentTimeMillis());
        data.put("deviceType", "WATER_QUALITY_MONITOR");

        // 判断是否生成异常数据（8%概率）
        boolean isAbnormal = random.nextDouble() < 0.08;

        double waterTemperature;  // 水温 (℃)
        double waterPH;           // pH值
        double dissolvedOxygen;   // 溶解氧 (mg/L)
        double turbidity;         // 浊度 (NTU)

        if (isAbnormal)
        {
            // 生成异常数据（用于触发告警测试）
            int abnormalType = random.nextInt(4);

            switch (abnormalType)
            {
                case 0: // 高温异常
                    waterTemperature = randomDouble(35.0, 45.0);
                    waterPH = randomDouble(6.5, 8.5);
                    dissolvedOxygen = randomDouble(5.0, 10.0);
                    turbidity = randomDouble(0.0, 50.0);
                    log.warn("【异常数据生成】水温过高 -> 水温={}℃", round(waterTemperature, 1));
                    break;

                case 1: // pH异常
                    waterTemperature = randomDouble(15.0, 25.0);
                    waterPH = random.nextBoolean() ? randomDouble(3.0, 5.5) : randomDouble(9.5, 11.0);
                    dissolvedOxygen = randomDouble(5.0, 10.0);
                    turbidity = randomDouble(0.0, 50.0);
                    log.warn("【异常数据生成】pH值异常 -> pH={}", round(waterPH, 1));
                    break;

                case 2: // 缺氧异常
                    waterTemperature = randomDouble(15.0, 25.0);
                    waterPH = randomDouble(6.5, 8.5);
                    dissolvedOxygen = randomDouble(0.5, 3.0);
                    turbidity = randomDouble(0.0, 50.0);
                    log.warn("【异常数据生成】溶解氧不足 -> 溶解氧={}mg/L", round(dissolvedOxygen, 1));
                    break;

                case 3: // 浑浊异常
                    waterTemperature = randomDouble(15.0, 25.0);
                    waterPH = randomDouble(6.5, 8.5);
                    dissolvedOxygen = randomDouble(5.0, 10.0);
                    turbidity = randomDouble(200.0, 500.0);
                    log.warn("【异常数据生成】水体浑浊 -> 浊度={}NTU", round(turbidity, 1));
                    break;

                default:
                    waterTemperature = randomDouble(15.0, 25.0);
                    waterPH = randomDouble(6.5, 8.5);
                    dissolvedOxygen = randomDouble(5.0, 10.0);
                    turbidity = randomDouble(0.0, 50.0);
            }
        }
        else
        {
            // 生成正常范围内的数据
            waterTemperature = randomDouble(15.0, 25.0);    // 正常水温
            waterPH = randomDouble(6.5, 8.5);               // 正常pH值
            dissolvedOxygen = randomDouble(5.0, 10.0);      // 正常溶解氧
            turbidity = randomDouble(0.0, 50.0);            // 正常浊度
        }

        // 保留一位小数并放入JSON
        data.put("water_temperature", round(waterTemperature, 1));
        data.put("water_ph", round(waterPH, 1));
        data.put("dissolved_oxygen", round(dissolvedOxygen, 1));
        data.put("turbidity", round(turbidity, 1));

        // 附加信息
        data.put("signalStrength", random.nextInt(20) - 90);  // 信号强度 -90 ~ -70 dBm
        data.put("batteryLevel", random.nextInt(30) + 70);    // 电池电量 70% ~ 100%

        return data;
    }
}
