package com.ruoyi.iot.service.impl;

import com.ruoyi.iot.domain.IotDeviceRunningStatus;
import com.ruoyi.iot.mapper.IotDeviceRunningStatusMapper;
import com.ruoyi.iot.service.IIotDeviceRunningStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备运行状态Service业务层处理
 */
@Service
public class IotDeviceRunningStatusServiceImpl implements IIotDeviceRunningStatusService {

    @Autowired
    private IotDeviceRunningStatusMapper iotDeviceRunningStatusMapper;

    @Override
    public IotDeviceRunningStatus selectIotDeviceRunningStatusById(Long statusId) {
        return iotDeviceRunningStatusMapper.selectIotDeviceRunningStatusById(statusId);
    }

    @Override
    public IotDeviceRunningStatus selectIotDeviceRunningStatusByDeviceId(Long deviceId) {
        return iotDeviceRunningStatusMapper.selectIotDeviceRunningStatusByDeviceId(deviceId);
    }

    @Override
    public List<IotDeviceRunningStatus> selectIotDeviceRunningStatusList(IotDeviceRunningStatus iotDeviceRunningStatus) {
        return iotDeviceRunningStatusMapper.selectIotDeviceRunningStatusList(iotDeviceRunningStatus);
    }

    @Override
    public int insertIotDeviceRunningStatus(IotDeviceRunningStatus iotDeviceRunningStatus) {
        return iotDeviceRunningStatusMapper.insertIotDeviceRunningStatus(iotDeviceRunningStatus);
    }

    @Override
    public int updateIotDeviceRunningStatus(IotDeviceRunningStatus iotDeviceRunningStatus) {
        return iotDeviceRunningStatusMapper.updateIotDeviceRunningStatus(iotDeviceRunningStatus);
    }

    @Override
    public int deleteIotDeviceRunningStatusById(Long statusId) {
        return iotDeviceRunningStatusMapper.deleteIotDeviceRunningStatusById(statusId);
    }

    @Override
    public int deleteIotDeviceRunningStatusByDeviceId(Long deviceId) {
        return iotDeviceRunningStatusMapper.deleteIotDeviceRunningStatusByDeviceId(deviceId);
    }

    @Override
    public int deleteIotDeviceRunningStatusByIds(Long[] statusIds) {
        return iotDeviceRunningStatusMapper.deleteIotDeviceRunningStatusByIds(statusIds);
    }
}
