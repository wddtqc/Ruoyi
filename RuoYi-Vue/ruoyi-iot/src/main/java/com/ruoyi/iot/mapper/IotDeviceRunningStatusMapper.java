package com.ruoyi.iot.mapper;

import com.ruoyi.iot.domain.IotDeviceRunningStatus;

import java.util.List;

/**
 * 设备运行状态Mapper接口
 */
public interface IotDeviceRunningStatusMapper {

    /**
     * 查询设备运行状态
     *
     * @param statusId 状态ID
     * @return 设备运行状态
     */
    IotDeviceRunningStatus selectIotDeviceRunningStatusById(Long statusId);

    /**
     * 根据设备ID查询运行状态
     *
     * @param deviceId 设备ID
     * @return 设备运行状态
     */
    IotDeviceRunningStatus selectIotDeviceRunningStatusByDeviceId(Long deviceId);

    /**
     * 查询设备运行状态列表
     *
     * @param iotDeviceRunningStatus 设备运行状态
     * @return 设备运行状态集合
     */
    List<IotDeviceRunningStatus> selectIotDeviceRunningStatusList(IotDeviceRunningStatus iotDeviceRunningStatus);

    /**
     * 新增设备运行状态
     *
     * @param iotDeviceRunningStatus 设备运行状态
     * @return 结果
     */
    int insertIotDeviceRunningStatus(IotDeviceRunningStatus iotDeviceRunningStatus);

    /**
     * 修改设备运行状态
     *
     * @param iotDeviceRunningStatus 设备运行状态
     * @return 结果
     */
    int updateIotDeviceRunningStatus(IotDeviceRunningStatus iotDeviceRunningStatus);

    /**
     * 批量删除设备运行状态
     *
     * @param statusIds 需要删除的数据ID
     * @return 结果
     */
    int deleteIotDeviceRunningStatusByIds(Long[] statusIds);

    /**
     * 删除设备运行状态
     *
     * @param statusId 状态ID
     * @return 结果
     */
    int deleteIotDeviceRunningStatusById(Long statusId);

    /**
     * 根据设备ID删除运行状态
     *
     * @param deviceId 设备ID
     * @return 结果
     */
    int deleteIotDeviceRunningStatusByDeviceId(Long deviceId);
}
