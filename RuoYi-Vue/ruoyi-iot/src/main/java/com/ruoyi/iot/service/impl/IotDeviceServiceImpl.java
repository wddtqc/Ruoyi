package com.ruoyi.iot.service.impl;

import com.ruoyi.iot.domain.IotDevice;
import com.ruoyi.iot.mapper.IotDeviceMapper;
import com.ruoyi.iot.service.IIotDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备Service业务层处理
 */
@Service
public class IotDeviceServiceImpl implements IIotDeviceService {

    @Autowired
    private IotDeviceMapper iotDeviceMapper;

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
    public int deleteIotDeviceByIds(Long[] deviceIds) {
        return iotDeviceMapper.deleteIotDeviceByIds(deviceIds);
    }

    @Override
    public int deleteIotDeviceById(Long deviceId) {
        return iotDeviceMapper.deleteIotDeviceById(deviceId);
    }
}
