package com.ruoyi.iot.mapper;

import com.ruoyi.iot.domain.IotSensorData;

import java.util.List;

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

    /**
     * 查询最新的传感器数据（按设备分组）
     *
     * @return 每个设备的最新传感器数据列表
     */
    List<IotSensorData> selectLatestSensorData();

    /**
     * 查询指定设备的最新传感器数据
     *
     * @param serialNumber 设备序列号
     * @return 最新的传感器数据
     */
    IotSensorData selectLatestBySerialNumber(String serialNumber);
}
