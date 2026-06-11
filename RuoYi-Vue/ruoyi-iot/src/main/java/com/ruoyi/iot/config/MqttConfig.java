package com.ruoyi.iot.config;

import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHandler;

/**
 * MQTT配置类
 * <p>
 * 功能说明：
 * 1. 配置MQTT客户端连接参数（Broker地址、端口、用户名、密码等）
 * 2. 配置消息发布通道（mqttOutboundChannel）
 * 3. 配置消息发布Handler（MqttPahoMessageHandler）
 * </p>
 *
 * 配置说明：
 * 在application.yml中配置以下参数：
 * <pre>
 * mqtt:
 *   broker-url: tcp://127.0.0.1:1883       # MQTT Broker地址
 *   client-id: ruoyi-iot-server            # 客户端ID（唯一标识）
 *   username:                               # 用户名（可选，如不需要认证留空）
 *   password:                               # 密码（可选，如不需要认证留空）
 *   qos: 1                                  # 消息质量等级（0/1/2）
 * </pre>
 *
 * @author ruoyi
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

    @Value("${mqtt.qos:1}")
    private int qos;

    /**
     * MQTT客户端工厂
     * <p>
     * 配置MQTT连接参数，包括：
     * - 自动重连
     * - 清除会话标志
     * - 连接超时时间
     * - 心跳间隔
     * </p>
     */
    @Bean
    public MqttPahoClientFactory mqttClientFactory() {
        DefaultMqttPahoClientFactory factory = new DefaultMqttPahoClientFactory();
        MqttConnectOptions options = new MqttConnectOptions();

        // Broker地址（支持tcp://和ssl://）
        options.setServerURIs(new String[]{brokerUrl});

        // 用户名密码（如果Broker需要认证）
        if (username != null && !username.trim().isEmpty()) {
            options.setUserName(username);
        }
        if (password != null && !password.trim().isEmpty()) {
            options.setPassword(password.toCharArray());
        }

        // 连接参数
        options.setCleanSession(true);        // 清除会话（true表示不保留历史消息）
        options.setConnectionTimeout(30);      // 连接超时时间（秒）
        options.setKeepAliveInterval(60);      // 心跳间隔（秒）
        options.setAutomaticReconnect(true);   // 自动重连

        factory.setConnectionOptions(options);

        log.info("=== MQTT客户端工厂初始化完成 ===");
        log.info("Broker地址: {}", brokerUrl);
        log.info("客户端ID: {}", clientId);

        return factory;
    }

    /**
     * MQTT消息输出通道（核心Bean - 解决注入失败问题）
     * <p>
     * 这个Bean是 MqttPublisher 注入的关键！
     * DirectChannel：同步直接通道，消息立即传递给订阅者
     * </p>
     */
    @Bean
    public MessageChannel mqttOutboundChannel() {
        log.info("=== 创建MQTT输出通道Bean ===");
        return new DirectChannel();
    }

    /**
     * MQTT消息发布Handler（消息生产者）
     * <p>
     * 功能：
     * 1. 从mqttOutboundChannel接收消息
     * 2. 将消息发布到MQTT Broker的指定主题
     * </p>
     *
     * @ServiceActivator：将此Handler绑定到mqttOutboundChannel通道
     */
    @Bean
    @ServiceActivator(inputChannel = "mqttOutboundChannel")
    public MessageHandler mqttOutbound() {
        MqttPahoMessageHandler messageHandler =
                new MqttPahoMessageHandler(
                        clientId + "_outbound",  // 发布客户端ID（必须唯一）
                        mqttClientFactory()
                );

        // 设置异步发送
        messageHandler.setAsync(true);

        // 设置默认主题（如果消息头中没有指定topic，则使用默认主题）
        messageHandler.setDefaultTopic("/agriculture/sensor/upload");

        // 设置默认QoS
        messageHandler.setDefaultQos(qos);

        log.info("=== MQTT发布者配置完成 ===");
        log.info("默认主题: /agriculture/sensor/upload");
        log.info("默认QoS: {}", qos);

        return messageHandler;
    }
}