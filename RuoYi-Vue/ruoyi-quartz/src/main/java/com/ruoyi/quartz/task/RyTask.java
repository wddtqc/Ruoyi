package com.ruoyi.quartz.task;

import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
            // 如果传入的设备编号为空，使用默认值
            if (serialNumber == null || serialNumber.trim().isEmpty())
            {
                serialNumber = DEFAULT_SERIAL_NUMBER;
            }

            log.info("========== 开始执行农业传感器数据模拟任务 ==========");

            // 生成模拟数据JSON
            JSONObject sensorData = generateMockSensorData(serialNumber);

            // 转换为JSON字符串
            String jsonMessage = sensorData.toJSONString();

            log.info("【模拟数据生成】设备编号: {}", serialNumber);
            log.info("【模拟数据内容】{}", jsonMessage);
            log.info("【数据模拟完成】主题: {}, 消息长度: {} bytes", MQTT_TOPIC, jsonMessage.length());
            log.info("【提示】当前为独立测试模式，数据已输出到日志");
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
}
