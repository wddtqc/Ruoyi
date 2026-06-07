package com.ruoyi.iot.mapper;

import com.ruoyi.iot.domain.IotDevice;

import java.util.List;

/**
 * 设备Mapper接口
 */
public interface IotDeviceMapper {

    /**
     * 查询设备
     *
     * @param deviceId 设备ID
     * @return 设备
     */
    IotDevice selectIotDeviceById(Long deviceId);

    /**
     * 查询设备列表
     *
     * @param iotDevice 设备
     * @return 设备集合
     */
    List<IotDevice> selectIotDeviceList(IotDevice iotDevice);

    /**
     * 新增设备
     *
     * @param iotDevice 设备
     * @return 结果
     */
    int insertIotDevice(IotDevice iotDevice);

    /**
     * 修改设备
     *
     * @param iotDevice 设备
     * @return 结果
     */
    int updateIotDevice(IotDevice iotDevice);

    /**
     * 批量删除设备
     *
     * @param deviceIds 需要删除的数据ID
     * @return 结果
     */
    int deleteIotDeviceByIds(Long[] deviceIds);

    /**
     * 删除设备信息
     *
     * @param deviceId 设备ID
     * @return 结果
     */
    int deleteIotDeviceById(Long deviceId);
}
