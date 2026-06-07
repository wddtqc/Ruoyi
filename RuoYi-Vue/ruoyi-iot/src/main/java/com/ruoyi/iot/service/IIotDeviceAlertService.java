package com.ruoyi.iot.service;

import com.ruoyi.iot.domain.IotDeviceAlert;

import java.util.List;

/**
 * 设备告警Service接口
 */
public interface IIotDeviceAlertService {

    /**
     * 查询设备告警
     *
     * @param alertId 告警ID
     * @return 设备告警
     */
    IotDeviceAlert selectIotDeviceAlertById(Long alertId);

    /**
     * 查询设备告警列表
     *
     * @param iotDeviceAlert 设备告警
     * @return 设备告警集合
     */
    List<IotDeviceAlert> selectIotDeviceAlertList(IotDeviceAlert iotDeviceAlert);

    /**
     * 根据设备ID查询告警列表
     *
     * @param deviceId 设备ID
     * @return 设备告警集合
     */
    List<IotDeviceAlert> selectIotDeviceAlertListByDeviceId(Long deviceId);

    /**
     * 新增设备告警
     *
     * @param iotDeviceAlert 设备告警
     * @return 结果
     */
    int insertIotDeviceAlert(IotDeviceAlert iotDeviceAlert);

    /**
     * 修改设备告警
     *
     * @param iotDeviceAlert 设备告警
     * @return 结果
     */
    int updateIotDeviceAlert(IotDeviceAlert iotDeviceAlert);

    /**
     * 处理告警
     *
     * @param iotDeviceAlert 告警（含处理信息）
     * @return 结果
     */
    int handleIotDeviceAlert(IotDeviceAlert iotDeviceAlert);

    /**
     * 批量删除设备告警
     *
     * @param alertIds 需要删除的告警ID
     * @return 结果
     */
    int deleteIotDeviceAlertByIds(Long[] alertIds);

    /**
     * 删除设备告警信息
     *
     * @param alertId 告警ID
     * @return 结果
     */
    int deleteIotDeviceAlertById(Long alertId);
}
