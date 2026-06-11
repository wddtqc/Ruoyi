package com.ruoyi.iot.service;

/**
 * IoT数据处理Service接口
 * <p>
 * 功能说明：
 * 1. 处理MQTT订阅的传感器数据
 * 2. 完成设备状态更新和告警触发
 * </p>
 *
 * @author ruoyi
 */
public interface IIoTDataProcessService {

    /**
     * 处理传感器数据
     * <p>
     * 完整业务流程：
     * 1. 解析JSON报文，提取设备编号和传感器数据
     * 2. 根据serial_number查询iot_device表，获取设备信息
     * 3. 更新iot_device表的status为3（在线）和update_time
     * 4. 更新iot_device_running_status表的状态和things_model_value
     * 5. 检测异常阈值，触发告警并写入iot_device_alert表
     * </p>
     *
     * @param sensorDataJson 传感器数据JSON字符串
     */
    void processSensorData(String sensorDataJson);
}
