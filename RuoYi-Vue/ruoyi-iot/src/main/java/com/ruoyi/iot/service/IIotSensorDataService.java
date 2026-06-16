package com.ruoyi.iot.service;

import com.ruoyi.iot.domain.IotSensorData;

import java.util.List;

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

    /**
     * 查询最近24小时温湿度趋势数据（按小时聚合）
     *
     * @return 每小时的温度、湿度平均值列表
     */
    List<java.util.Map<String, Object>> selectTrendData();
}
