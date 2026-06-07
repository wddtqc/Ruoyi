package com.ruoyi.iot.config;

import com.ruoyi.iot.processor.IotDataProcessor;
import org.eclipse.paho.client.mqttv3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {

    private static final Logger log = LoggerFactory.getLogger(MqttConfig.class);

    @Value("${iot.mqtt.url}")
    private String hostUrl;

    @Value("${iot.mqtt.clientId}")
    private String clientId;

    @Value("${iot.mqtt.username:admin}")
    private String username;

    @Value("${iot.mqtt.password:public}")
    private String password;

    @Value("${iot.mqtt.defaultTopic}")
    private String defaultTopic;

    @Bean
    public MqttClient mqttClient() {
        // 声明为 final，确保匿名内部类中可以安全稳定地引用当前正在创建的这个对象
        final MqttClient client;
        try {
            // 1. 初始化客户端
            client = new MqttClient(hostUrl, clientId);

            // 2. 配置连接认证参数
            MqttConnectOptions options = new MqttConnectOptions();
            options.setCleanSession(true);
            options.setAutomaticReconnect(true); // 启用断线自动重连
            options.setUserName(username);
            options.setPassword(password.toCharArray());
            options.setConnectionTimeout(10);    // 超时时间
            options.setKeepAliveInterval(20);    // 心跳间隔

            // 3. 配置消息到达后的回调监听
            client.setCallback(new MqttCallbackExtended() {
                @Override
                public void connectComplete(boolean reconnect, String serverURI) {
                    log.info("🟢 [IoT] 成功连接至 EMQX 消息服务器 ({})", serverURI);
                    try {
                        // 🌟 修正：直接用当前初始化的 client 实例进行订阅，拒绝死循环调用！
                        client.subscribe(defaultTopic, 1);
                        log.info("🛰️ [IoT] 已成功订阅物联网专属主题: {}", defaultTopic);
                    } catch (MqttException e) {
                        log.error("❌ [IoT] 订阅主题失败: {}", e.getMessage());
                    }
                }

                @Override
                public void connectionLost(Throwable cause) {
                    log.warn("🔴 [IoT] 与 EMQX 断开连接，系统正在自动尝试重连...");
                }

                @Override
                public void messageArrived(String topic, MqttMessage message) {
                    String payload = new String(message.getPayload());
                    log.info("📥 [IoT] 收到上报数据 -> 主题: [{}], 字节大小: {}", topic, message.getPayload().length);
                    IotDataProcessor.handleMessage(topic, payload);
                }

                @Override
                public void deliveryComplete(IMqttDeliveryToken token) {
                }
            });

            // 4. 同步发起连接
            client.connect(options);
            return client;

        } catch (MqttException e) {
            log.error("💥 [IoT] 初始化 MQTT 客户端时发生严重异常: ", e);
        }
        return null;
    }
}