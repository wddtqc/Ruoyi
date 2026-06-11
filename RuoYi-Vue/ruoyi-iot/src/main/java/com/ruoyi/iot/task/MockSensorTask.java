package com.ruoyi.iot.task;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.iot.mqtt.MqttPublisher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Random;

/**
 * 模拟传感器数据定时任务
 * <p>
 * 功能说明：
 * 1. 模拟土壤氮磷钾传感器数据生成
 * 2. 在正常范围内随机生成农业监测数据
 * 3. 5%的概率生成异常数据用于触发告警
 * 4. 通过MQTT协议发布数据到指定主题
 * </p>
 *
 * 使用方法：
 * 在若依系统的定时任务管理中配置：
 * - Bean名称：mockSensorTask
 * - 方法名称：pushMockData
 * - 执行参数：无（可选配置设备编号）
 *
 * @author ruoyi
 */
@Component("mockSensorTask")
public class MockSensorTask {

    private static final Logger log = LoggerFactory.getLogger(MockSensorTask.class);

    @Autowired
    private MqttPublisher mqttPublisher;

    /**
     * MQTT发布主题
     */
    private static final String MQTT_TOPIC = "/agriculture/sensor/upload";

    /**
     * 默认设备编号
     */
    private static final String DEFAULT_SERIAL_NUMBER = "NPK-TEST-001";

    /**
     * 异常数据触发概率（5%）
     */
    private static final double ABNORMAL_PROBABILITY = 0.05;

    private final Random random = new Random();

    /**
     * 推送模拟数据的主方法（供若依定时任务调用）
     * <p>
     * 该方法会生成一组模拟的土壤传感器数据，并通过MQTT发布到指定主题。
     * 数据包含：设备编号、土壤湿度、氮含量、磷含量、钾含量、时间戳等。
     * 有5%的概率会生成异常数据（内涝或缺肥），用于测试告警功能。
     * </p>
     */
    public void pushMockData() {
        pushMockData(DEFAULT_SERIAL_NUMBER);
    }

    /**
     * 推送模拟数据（支持自定义设备编号）
     *
     * @param serialNumber 设备编号（可选参数）
     */
    public void pushMockData(String serialNumber) {
        try {
            // 如果传入的设备编号为空，使用默认值
            if (serialNumber == null || serialNumber.trim().isEmpty()) {
                serialNumber = DEFAULT_SERIAL_NUMBER;
            }

            // 生成模拟数据JSON
            JSONObject sensorData = generateMockSensorData(serialNumber);

            // 转换为JSON字符串
            String jsonMessage = sensorData.toJSONString();

            log.info("=== 模拟传感器数据生成 ===");
            log.info("设备编号: {}", serialNumber);
            log.info("数据内容: {}", jsonMessage);

            // =====================================================
            // 通过MQTT发布消息到指定主题
            // 调用MqttPublisher的sendToMqtt方法
            // =====================================================
            mqttPublisher.sendToMqtt(MQTT_TOPIC, jsonMessage);

            log.info("MQTT消息发布成功 -> 主题: {}", MQTT_TOPIC);

        } catch (Exception e) {
            log.error("模拟传感器数据推送失败", e);
        }
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
    private JSONObject generateMockSensorData(String serialNumber) {
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

        if (isAbnormal) {
            // 生成异常数据（用于触发告警测试）
            int abnormalType = random.nextInt(3);

            switch (abnormalType) {
                case 0: // 严重内涝异常（湿度过高）
                    humidity = randomDouble(80.0, 95.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("!!! 生成异常数据：严重内涝（湿度={}%）", round(humidity, 1));
                    break;

                case 1: // 严重缺氮异常
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(1.0, 5.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("!!! 生成异常数据：严重缺氮（氮={}mg/kg）", round(nitrogen, 1));
                    break;

                case 2: // 严重缺磷异常
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(0.5, 3.0);
                    potassium = randomDouble(70.0, 100.0);
                    log.warn("!!! 生成异常数据：严重缺磷（磷={}mg/kg）", round(phosphorus, 1));
                    break;

                default:
                    humidity = randomDouble(20.0, 40.0);
                    nitrogen = randomDouble(30.0, 60.0);
                    phosphorus = randomDouble(10.0, 25.0);
                    potassium = randomDouble(70.0, 100.0);
            }
        } else {
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
    private double randomDouble(double min, double max) {
        return min + (max - min) * random.nextDouble();
    }

    /**
     * 对浮点数进行四舍五入，保留指定小数位数
     *
     * @param value 原始值
     * @param scale 保留小数位数
     * @return 四舍五入后的值
     */
    private double round(double value, int scale) {
        BigDecimal bd = new BigDecimal(Double.toString(value));
        bd = bd.setScale(scale, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}
