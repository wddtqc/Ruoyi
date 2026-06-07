package com.ruoyi.iot.processor;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IotDataProcessor {

    private static final Logger log = LoggerFactory.getLogger(IotDataProcessor.class);

    /**
     * 解析并处理从 EMQX 转发过来的设备数据
     *
     * @param topic   设备上报的主题，形如: new_agriculture/DEV-001/telemetry
     * @param payload 设备上报的原始文本数据，通常是 JSON 字符串
     */
    public static void handleMessage(String topic, String payload) {
        try {
            // 1. 从主题路径中解析出动态的设备编码（Device ID）
            String[] split = topic.split("/");
            if (split.length < 3) {
                log.warn("⚠️ [IoT] 收到异常格式的主题，拒绝解析: {}", topic);
                return;
            }
            String deviceSn = split[1]; // 获取 + 位置对应的真实设备号

            // 2. 使用新版若依自带的 fastjson2 安全地解析报文
            if (!JSON.isValid(payload)) {
                log.warn("⚠️ [IoT] 设备 [{}] 上报的非标准 JSON 报文: {}", deviceSn, payload);
                return;
            }
            JSONObject dataJson = JSON.parseObject(payload);

            log.info("💡 [IoT] 数据解析成功 -> 设备: [{}], 报文详情: {}", deviceSn, dataJson.toJSONString());

            // 🛠️ 下一步拓展方向：
            // Double temperature = dataJson.getDouble("temperature"); // 提取温度
            // Double humidity = dataJson.getDouble("humidity");       // 提取湿度

            // TODO: 通过 Spring 容器拿到你的 Service，直接存入本地数据库
            // SpringUtils.getBean(IIotDeviceDataService.class).saveData(deviceSn, temperature, humidity);

        } catch (Exception e) {
            log.error("❌ [IoT] 处理设备原始报文时发生系统异常: ", e);
        }
    }
}