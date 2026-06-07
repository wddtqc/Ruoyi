package com.ruoyi.iot.service.impl;

import com.ruoyi.iot.domain.IotDeviceAlert;
import com.ruoyi.iot.mapper.IotDeviceAlertMapper;
import com.ruoyi.iot.service.IIotDeviceAlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 设备告警Service业务层处理
 */
@Service
public class IotDeviceAlertServiceImpl implements IIotDeviceAlertService {

    @Autowired
    private IotDeviceAlertMapper iotDeviceAlertMapper;

    @Override
    public IotDeviceAlert selectIotDeviceAlertById(Long alertId) {
        return iotDeviceAlertMapper.selectIotDeviceAlertById(alertId);
    }

    @Override
    public List<IotDeviceAlert> selectIotDeviceAlertList(IotDeviceAlert iotDeviceAlert) {
        return iotDeviceAlertMapper.selectIotDeviceAlertList(iotDeviceAlert);
    }

    @Override
    public List<IotDeviceAlert> selectIotDeviceAlertListByDeviceId(Long deviceId) {
        return iotDeviceAlertMapper.selectIotDeviceAlertListByDeviceId(deviceId);
    }

    @Override
    public int insertIotDeviceAlert(IotDeviceAlert iotDeviceAlert) {
        return iotDeviceAlertMapper.insertIotDeviceAlert(iotDeviceAlert);
    }

    @Override
    public int updateIotDeviceAlert(IotDeviceAlert iotDeviceAlert) {
        return iotDeviceAlertMapper.updateIotDeviceAlert(iotDeviceAlert);
    }

    @Override
    public int handleIotDeviceAlert(IotDeviceAlert iotDeviceAlert) {
        iotDeviceAlert.setHandleTime(new Date());
        return iotDeviceAlertMapper.updateIotDeviceAlert(iotDeviceAlert);
    }

    @Override
    public int deleteIotDeviceAlertByIds(Long[] alertIds) {
        return iotDeviceAlertMapper.deleteIotDeviceAlertByIds(alertIds);
    }

    @Override
    public int deleteIotDeviceAlertById(Long alertId) {
        return iotDeviceAlertMapper.deleteIotDeviceAlertById(alertId);
    }
}
