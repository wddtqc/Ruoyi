package com.ruoyi.iot.service.impl;

import com.ruoyi.iot.domain.IotSensorData;
import com.ruoyi.iot.mapper.IotSensorDataMapper;
import com.ruoyi.iot.service.IIotSensorDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 农业传感器数据Service业务层处理
 *
 * @author ruoyi
 */
@Service
public class IotSensorDataServiceImpl implements IIotSensorDataService {

    private static final Logger log = LoggerFactory.getLogger(IotSensorDataServiceImpl.class);

    @Autowired
    private IotSensorDataMapper iotSensorDataMapper;

    @Override
    public int insertIotSensorData(IotSensorData sensorData) {
        try {
            int result = iotSensorDataMapper.insertIotSensorData(sensorData);

            if (result > 0) {
                log.info("传感器数据保存成功 -> 设备序列号: , 设备类型: {}",
                    sensorData.getSerialNumber(), sensorData.getDeviceType());
            } else {
                log.warn("传感器数据保存失败 -> 设备序列号: {}", sensorData.getSerialNumber());
            }

            return result;
        } catch (Exception e) {
            log.error("传感器数据保存异常 -> 设备序列号: {}", sensorData.getSerialNumber(), e);
            throw new RuntimeException("传感器数据保存失败", e);
        }
    }

    @Override
    public List<IotSensorData> selectLatestSensorData() {
        return iotSensorDataMapper.selectLatestSensorData();
    }

    @Override
    public IotSensorData selectLatestBySerialNumber(String serialNumber) {
        return iotSensorDataMapper.selectLatestBySerialNumber(serialNumber);
    }
}
