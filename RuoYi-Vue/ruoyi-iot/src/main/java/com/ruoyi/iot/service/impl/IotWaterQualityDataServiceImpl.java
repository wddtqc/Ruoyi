package com.ruoyi.iot.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.iot.domain.IotWaterQualityData;
import com.ruoyi.iot.mapper.IotWaterQualityDataMapper;
import com.ruoyi.iot.service.IIotWaterQualityDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 水质监测数据Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-15
 */
@Service
public class IotWaterQualityDataServiceImpl implements IIotWaterQualityDataService
{
    private static final Logger log = LoggerFactory.getLogger(IotWaterQualityDataServiceImpl.class);

    @Autowired
    private IotWaterQualityDataMapper iotWaterQualityDataMapper;

    /**
     * 查询水质监测数据
     *
     * @param id 水质监测数据主键
     * @return 水质监测数据
     */
    @Override
    public IotWaterQualityData selectIotWaterQualityDataById(Long id)
    {
        return iotWaterQualityDataMapper.selectIotWaterQualityDataById(id);
    }

    /**
     * 查询水质监测数据列表
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 水质监测数据
     */
    @Override
    public List<IotWaterQualityData> selectIotWaterQualityDataList(IotWaterQualityData iotWaterQualityData)
    {
        return iotWaterQualityDataMapper.selectIotWaterQualityDataList(iotWaterQualityData);
    }

    /**
     * 新增水质监测数据
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 结果
     */
    @Override
    public int insertIotWaterQualityData(IotWaterQualityData iotWaterQualityData)
    {
        return iotWaterQualityDataMapper.insertIotWaterQualityData(iotWaterQualityData);
    }

    /**
     * 修改水质监测数据
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 结果
     */
    @Override
    public int updateIotWaterQualityData(IotWaterQualityData iotWaterQualityData)
    {
        return iotWaterQualityDataMapper.updateIotWaterQualityData(iotWaterQualityData);
    }

    /**
     * 批量删除水质监测数据
     *
     * @param ids 需要删除的水质监测数据主键
     * @return 结果
     */
    @Override
    public int deleteIotWaterQualityDataByIds(Long[] ids)
    {
        return iotWaterQualityDataMapper.deleteIotWaterQualityDataByIds(ids);
    }

    /**
     * 删除水质监测数据信息
     *
     * @param id 水质监测数据主键
     * @return 结果
     */
    @Override
    public int deleteIotWaterQualityDataById(Long id)
    {
        return iotWaterQualityDataMapper.deleteIotWaterQualityDataById(id);
    }

    /**
     * 查询设备最新数据
     *
     * @param serialNumber 设备序列号
     * @return 水质监测数据
     */
    @Override
    public IotWaterQualityData selectLatestDataBySerialNumber(String serialNumber)
    {
        return iotWaterQualityDataMapper.selectLatestDataBySerialNumber(serialNumber);
    }

    /**
     * 批量插入水质监测数据
     *
     * @param dataList 水质监测数据列表
     * @return 结果
     */
    @Override
    public int batchInsertIotWaterQualityData(List<IotWaterQualityData> dataList)
    {
        if (dataList == null || dataList.isEmpty()) {
            return 0;
        }
        return iotWaterQualityDataMapper.batchInsertIotWaterQualityData(dataList);
    }

    @Override
    public List<IotWaterQualityData> selectLatestWaterQualityDataList() {
        return iotWaterQualityDataMapper.selectLatestWaterQualityDataList();
    }

    /**
     * 保存MQTT接收到的水质数据
     *
     * @param jsonData JSON格式的水质数据
     * @return 结果
     */
    @Override
    public int saveWaterQualityDataFromMqtt(String jsonData)
    {
        try {
            log.info("接收到水质数据: {}", jsonData);

            // 解析JSON数据
            JSONObject json = JSON.parseObject(jsonData);

            // 创建数据对象
            IotWaterQualityData data = new IotWaterQualityData();
            data.setSerialNumber(json.getString("serialNumber"));
            data.setDeviceType(json.getString("deviceType"));
            data.setWaterTemperature(json.getDouble("water_temperature"));
            data.setWaterPh(json.getDouble("water_ph"));
            data.setDissolvedOxygen(json.getDouble("dissolved_oxygen"));
            data.setTurbidity(json.getDouble("turbidity"));
            data.setSignalStrength(json.getInteger("signalStrength"));
            data.setBatteryLevel(json.getInteger("batteryLevel"));
            data.setDeviceTimestamp(json.getLong("timestamp"));

            // 插入数据库
            int result = iotWaterQualityDataMapper.insertIotWaterQualityData(data);

            if (result > 0) {
                log.info("水质数据保存成功: 设备={}, 水温={}, pH={}, 溶解氧={}, 浊度={}",
                        data.getSerialNumber(),
                        data.getWaterTemperature(),
                        data.getWaterPh(),
                        data.getDissolvedOxygen(),
                        data.getTurbidity());
            } else {
                log.error("水质数据保存失败");
            }

            return result;

        } catch (Exception e) {
            log.error("保存水质数据失败", e);
            return 0;
        }
    }
}
