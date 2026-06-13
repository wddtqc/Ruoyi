package com.ruoyi.iot.config;

import org.eclipse.paho.client.mqttv3.IMqttClient;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 纯净的 MQTT 客户端配置
 * 绕过所有 Spring Integration 通道，直接提供底层的 IMqttClient 实例
 */
@Configuration
public class MqttConfig {

    private static final Logger log = LoggerFactory.getLogger(MqttConfig.class);

    @Value("${mqtt.broker-url:tcp://127.0.0.1:1883}")
    private String brokerUrl;

    @Value("${mqtt.client-id:ruoyi-iot-server}")
    private String clientId;

    @Value("${mqtt.username:}")
    private String username;

    @Value("${mqtt.password:}")
    private String password;

    @Bean
    public IMqttClient mqttClient() {
        try {
            // 使用内存持久化，防止多模块并发下的文件锁冲突
            IMqttClient client = new MqttClient(brokerUrl, clientId + "_direct", new MemoryPersistence());

            MqttConnectOptions options = new MqttConnectOptions();
            options.setServerURIs(new String[]{brokerUrl});

            if (username != null && !username.trim().isEmpty()) {
                options.setUserName(username);
            }
            if (password != null && !password.trim().isEmpty()) {
                options.setPassword(password.toCharArray());
            }

            options.setCleanSession(true);
            options.setConnectionTimeout(10);
            options.setKeepAliveInterval(60);
            options.setAutomaticReconnect(true); // 核心：开启底层物理自动重连

            log.info("=== 正在连接 Docker MQTT Broker: {} ===", brokerUrl);
            client.connect(options);
            log.info("=== MQTT 物理连接成功！ ===");

            return client;
        } catch (Exception e) {
            log.error("MQTT 客户端初始化或连接失败，请确认 Docker 容器状态！", e);
            // 这里不抛出异常，防止卡死若依启动，让它在后台默默重连
            return null;
        }
    }
}