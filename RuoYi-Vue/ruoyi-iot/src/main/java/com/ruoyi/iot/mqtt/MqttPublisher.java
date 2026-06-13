package com.ruoyi.iot.mqtt;

import org.eclipse.paho.client.mqttv3.IMqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

/**
 * 纯物理 MQTT 消息发送器
 * 核心机制：直连物理客户端，绕过通道，根治 Dispatcher has no subscribers 顽疾
 */
@Component
public class MqttPublisher {

    private static final Logger log = LoggerFactory.getLogger(MqttPublisher.class);

    @Autowired
    @Lazy // 使用懒加载，防止启动时由于 MQTT 未连接导致注入失败
    private IMqttClient mqttClient;

    public void sendToMqtt(String topic, String payload) {
        sendToMqtt(topic, payload, 1);
    }

    public void sendToMqtt(String topic, String payload, int qos) {
        if (mqttClient == null || !mqttClient.isConnected()) {
            log.error("MQTT 物理客户端未连接，无法发送消息！请检查 Docker 容器。主题: {}", topic);
            throw new RuntimeException("MQTT客户端未连接");
        }

        try {
            MqttMessage message = new MqttMessage(payload.getBytes("UTF-8"));
            message.setQos(qos);

            // 直接通过物理连接发送，不经过任何 Spring 通道代理
            mqttClient.publish(topic, message);

            log.info("【MQTT投递成功】主题: {}, 内容: {}", topic, payload);
        } catch (Exception e) {
            log.error("MQTT 发送过程中发生物理异常 -> 主题: {}", topic, e);
            throw new RuntimeException("物理发送失败", e);
        }
    }

    public void sendToMqtt(String topic, byte[] payload, int qos) {
        if (mqttClient == null || !mqttClient.isConnected()) {
            log.error("MQTT 物理客户端未连接，无法发送字节数据！");
            return;
        }
        try {
            MqttMessage message = new MqttMessage(payload);
            message.setQos(qos);
            mqttClient.publish(topic, message);
        } catch (Exception e) {
            log.error("MQTT 字节发送异常", e);
        }
    }
}