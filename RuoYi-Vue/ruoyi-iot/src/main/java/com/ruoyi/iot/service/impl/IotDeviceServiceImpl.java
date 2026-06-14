package com.ruoyi.iot.service.impl;

import com.ruoyi.iot.domain.IotDevice;
import com.ruoyi.iot.mapper.IotDeviceMapper;
import com.ruoyi.iot.mapper.IotDeviceRunningStatusMapper;
import com.ruoyi.iot.service.IIotDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 设备Service业务层处理
 */
@Service
public class IotDeviceServiceImpl implements IIotDeviceService {

    @Autowired
    private IotDeviceMapper iotDeviceMapper;

    @Autowired
    private IotDeviceRunningStatusMapper iotDeviceRunningStatusMapper;

    @Override
    public IotDevice selectIotDeviceById(Long deviceId) {
        return iotDeviceMapper.selectIotDeviceById(deviceId);
    }

    @Override
    public List<IotDevice> selectIotDeviceList(IotDevice iotDevice) {
        return iotDeviceMapper.selectIotDeviceList(iotDevice);
    }

    @Override
    public int insertIotDevice(IotDevice iotDevice) {
        return iotDeviceMapper.insertIotDevice(iotDevice);
    }

    @Override
    public int updateIotDevice(IotDevice iotDevice) {
        return iotDeviceMapper.updateIotDevice(iotDevice);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteIotDeviceByIds(Long[] deviceIds) {
        // 1. 级联删除运行状态
        for (Long deviceId : deviceIds) {
            iotDeviceRunningStatusMapper.deleteIotDeviceRunningStatusByDeviceId(deviceId);
        }
        // 2. 逻辑删除设备主表
        return iotDeviceMapper.deleteIotDeviceByIds(deviceIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteIotDeviceById(Long deviceId) {
        iotDeviceRunningStatusMapper.deleteIotDeviceRunningStatusByDeviceId(deviceId);
        return iotDeviceMapper.deleteIotDeviceById(deviceId);
    }
}
