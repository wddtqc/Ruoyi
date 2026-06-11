package com.ruoyi.iot.mqtt;

import com.ruoyi.iot.service.IIoTDataProcessService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

    /**
     * 农业传感器数据上报主题
     */
    private static final String TOPIC_SENSOR_UPLOAD = "/agriculture/sensor/upload";

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
     * 1. 解析JSON报文，提取设备编号
     * 2. 查询设备主表（iot_device），获取设备信息
     * 3. 更新设备运行状态表（iot_device_running_status）
     * 4. 检测异常阈值，触发告警（iot_device_alert）
     * </p>
     *
     * @param payload JSON格式的传感器数据
     */
    private void handleSensorUpload(String payload) {
        try {
            // 委托给业务Service层处理
            // 该方法会完成：设备查询 -> 状态更新 -> 告警触发 的完整流程
            ioTDataProcessService.processSensorData(payload);

            log.info("传感器数据处理完成");

        } catch (Exception e) {
            log.error("传感器数据处理失败: {}", payload, e);
            throw e;
        }
    }
}
