package com.ruoyi.iot.service;

import com.ruoyi.iot.domain.IotSensorData;

/**
 * 农业传感器数据Service接口
 *
 * @author ruoyi
 */
public interface IIotSensorDataService {

    /**
     * 保存传感器数据
     *
     * @param sensorData 传感器数据实体
     * @return 插入结果（受影响行数）
     */
    int insertIotSensorData(IotSensorData sensorData);
}
