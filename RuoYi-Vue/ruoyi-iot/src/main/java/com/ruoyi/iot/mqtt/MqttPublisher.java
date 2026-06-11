package com.ruoyi.iot.mqtt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.integration.mqtt.support.MqttHeaders;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.stereotype.Component;

/**
 * MQTT消息发布工具类
 * <p>
 * 功能说明：
 * 1. 封装MQTT消息发布逻辑
 * 2. 提供简洁的API供业务层调用
 * 3. 支持指定主题和QoS等级
 * </p>
 *
 * 使用示例：
 * <pre>
 * {@code
 * @Autowired
 * private MqttPublisher mqttPublisher;
 *
 * // 发布消息到指定主题
 * mqttPublisher.sendToMqtt("/agriculture/sensor/upload", "{\"data\":\"test\"}");
 *
 * // 发布消息并指定QoS等级
 * mqttPublisher.sendToMqtt("/agriculture/sensor/upload", "{\"data\":\"test\"}", 2);
 * }
 * </pre>
 *
 * @author ruoyi
 */
@Component
public class MqttPublisher {

    private static final Logger log = LoggerFactory.getLogger(MqttPublisher.class);

    /**
     * MQTT消息输出通道（由MqttConfig配置类提供）
     * 这个Bean现在已经在MqttConfig中显式声明，不会再报错！
     */
    @Autowired
    private MessageChannel mqttOutboundChannel;

    /**
     * 发送MQTT消息（使用默认QoS = 1）
     * <p>
     * 这是最常用的方法，供定时任务和业务代码调用
     * </p>
     *
     * @param topic   主题（如：/agriculture/sensor/upload）
     * @param payload 消息内容（JSON字符串）
     */
    public void sendToMqtt(String topic, String payload) {
        sendToMqtt(topic, payload, 1);
    }

    /**
     * 发送MQTT消息（指定QoS等级）
     *
     * @param topic   主题
     * @param payload 消息内容（JSON字符串）
     * @param qos     消息质量等级
     *                0 - 至多一次（可能丢失，最快）
     *                1 - 至少一次（可能重复，推荐）
     *                2 - 恰好一次（保证送达且不重复，最慢）
     */
    public void sendToMqtt(String topic, String payload, int qos) {
        try {
            // 构建Spring Integration消息
            // 消息头中包含MQTT主题和QoS信息
            Message<String> message = MessageBuilder
                    .withPayload(payload)
                    .setHeader(MqttHeaders.TOPIC, topic)
                    .setHeader(MqttHeaders.QOS, qos)
                    .build();

            // 发送到MQTT输出通道（由MqttPahoMessageHandler处理）
            boolean success = mqttOutboundChannel.send(message);

            if (success) {
                log.debug("MQTT消息发送成功 -> 主题: {}, QoS: {}, 长度: {} bytes", topic, qos, payload.length());
            } else {
                log.error("MQTT消息发送失败 -> 主题: {}, 通道返回false", topic);
            }

        } catch (Exception e) {
            log.error("MQTT消息发送异常 -> 主题: {}, 错误: {}", topic, e.getMessage(), e);
            throw new RuntimeException("MQTT消息发送失败: " + e.getMessage(), e);
        }
    }

    /**
     * 发送MQTT消息（字节数组格式）
     * <p>
     * 适用于发送二进制数据（如图片、文件等）
     * </p>
     *
     * @param topic   主题
     * @param payload 消息内容（字节数组）
     * @param qos     消息质量等级
     */
    public void sendToMqtt(String topic, byte[] payload, int qos) {
        try {
            Message<byte[]> message = MessageBuilder
                    .withPayload(payload)
                    .setHeader(MqttHeaders.TOPIC, topic)
                    .setHeader(MqttHeaders.QOS, qos)
                    .build();

            boolean success = mqttOutboundChannel.send(message);

            if (success) {
                log.debug("MQTT消息发送成功（字节数组） -> 主题: {}, QoS: {}, 长度: {} bytes", topic, qos, payload.length);
            } else {
                log.error("MQTT消息发送失败（字节数组） -> 主题: {}", topic);
            }

        } catch (Exception e) {
            log.error("MQTT消息发送异常（字节数组） -> 主题: {}", topic, e);
            throw new RuntimeException("MQTT消息发送失败: " + e.getMessage(), e);
        }
    }

    /**
     * 批量发送MQTT消息
     * <p>
     * 适用于一次性发送多条消息到同一主题
     * </p>
     *
     * @param topic    主题
     * @param payloads 消息内容列表
     */
    public void sendBatch(String topic, java.util.List<String> payloads) {
        for (String payload : payloads) {
            sendToMqtt(topic, payload);
        }
        log.info("批量发送完成 -> 主题: {}, 消息数量: {}", topic, payloads.size());
    }
}
