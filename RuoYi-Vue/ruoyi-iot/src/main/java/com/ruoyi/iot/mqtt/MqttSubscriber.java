package com.ruoyi.iot.mqtt;

import org.eclipse.paho.client.mqttv3.IMqttClient;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

/**
 * MQTT 消息订阅器
 * <p>
 * 功能说明：
 * 1. 在应用启动时自动订阅指定的 MQTT 主题
 * 2. 接收到消息后委托给 MqttMessageListener 处理
 * 3. 处理连接断开和消息送达回调
 * </p>
 *
 * @author ruoyi
 */
@Component
public class MqttSubscriber implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(MqttSubscriber.class);

    @Autowired
    @Lazy
    private IMqttClient mqttClient;

    @Autowired
    private MqttMessageListener messageListener;

    /**
     * 订阅的主题列表
     */
    private static final String[] SUBSCRIBE_TOPICS = {
        "/agriculture/sensor/upload",  // 农业传感器数据上报主题
        "/agriculture/water/upload",   // 水质监测数据上报主题
        "/agriculture/weather/upload"  // 气象检测数据上报主题
    };

    /**
     * QoS 等级（0=最多一次，1=至少一次，2=恰好一次）
     */
    private static final int QOS = 1;

    /**
     * 应用启动后自动执行订阅
     * 实现 CommandLineRunner 接口，在 Spring Boot 启动完成后自动执行
     */
    @Override
    public void run(String... args) {
        // 延迟执行，确保 MQTT 客户端已完全初始化
        new Thread(() -> {
            try {
                Thread.sleep(2000); // 等待2秒，确保连接稳定

                if (mqttClient == null || !mqttClient.isConnected()) {
                    log.error("MQTT 客户端未连接，无法订阅主题！请检查 Docker MQTT Broker 是否正常运行。");
                    return;
                }

                // 设置回调处理器
                mqttClient.setCallback(new MqttCallback() {
                    @Override
                    public void connectionLost(Throwable cause) {
                        log.error("MQTT 连接丢失！", cause);
                        // 自动重连由 MqttConfig 的 setAutomaticReconnect(true) 处理
                    }

                    @Override
                    public void messageArrived(String topic, MqttMessage message) throws Exception {
                        try {
                            String payload = new String(message.getPayload(), StandardCharsets.UTF_8);
                            log.info("=== MQTT 订阅器收到消息 ===");
                            log.info("主题: {}", topic);
                            log.info("Payload: {}", payload);

                            // 委托给 MqttMessageListener 处理业务逻辑
                            messageListener.handleMessage(topic, payload);

                        } catch (Exception e) {
                            log.error("MQTT 消息处理异常 -> 主题: {}", topic, e);
                        }
                    }

                    @Override
                    public void deliveryComplete(IMqttDeliveryToken token) {
                        // 消息发送完成回调（订阅器通常不需要处理此事件）
                    }
                });

                // 订阅所有主题
                for (String topic : SUBSCRIBE_TOPICS) {
                    mqttClient.subscribe(topic, QOS);
                    log.info("=== MQTT 主题订阅成功 -> {} (QoS={}) ===", topic, QOS);
                }

            } catch (InterruptedException e) {
                log.error("订阅线程被中断", e);
                Thread.currentThread().interrupt();
            } catch (Exception e) {
                log.error("MQTT 主题订阅失败", e);
            }
        }).start();
    }
}
