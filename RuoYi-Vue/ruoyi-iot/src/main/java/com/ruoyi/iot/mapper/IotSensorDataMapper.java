package com.ruoyi.iot.mapper;

import com.ruoyi.iot.domain.IotSensorData;

/**
 * 农业传感器数据Mapper接口
 *
 * @author ruoyi
 */
public interface IotSensorDataMapper {

    /**
     * 插入传感器数据
     *
     * @param sensorData 传感器数据实体
     * @return 插入结果（受影响行数）
     */
    int insertIotSensorData(IotSensorData sensorData);
}
