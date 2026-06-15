package com.ruoyi.iot.service;

import com.ruoyi.iot.domain.IotWaterQualityData;
import java.util.List;

/**
 * 水质监测数据Service接口
 *
 * @author ruoyi
 * @date 2026-06-15
 */
public interface IIotWaterQualityDataService
{
    /**
     * 查询水质监测数据
     *
     * @param id 水质监测数据主键
     * @return 水质监测数据
     */
    public IotWaterQualityData selectIotWaterQualityDataById(Long id);

    /**
     * 查询水质监测数据列表
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 水质监测数据集合
     */
    public List<IotWaterQualityData> selectIotWaterQualityDataList(IotWaterQualityData iotWaterQualityData);

    /**
     * 新增水质监测数据
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 结果
     */
    public int insertIotWaterQualityData(IotWaterQualityData iotWaterQualityData);

    /**
     * 修改水质监测数据
     *
     * @param iotWaterQualityData 水质监测数据
     * @return 结果
     */
    public int updateIotWaterQualityData(IotWaterQualityData iotWaterQualityData);

    /**
     * 批量删除水质监测数据
     *
     * @param ids 需要删除的水质监测数据主键集合
     * @return 结果
     */
    public int deleteIotWaterQualityDataByIds(Long[] ids);

    /**
     * 删除水质监测数据信息
     *
     * @param id 水质监测数据主键
     * @return 结果
     */
    public int deleteIotWaterQualityDataById(Long id);

    /**
     * 查询设备最新数据
     *
     * @param serialNumber 设备序列号
     * @return 水质监测数据
     */
    public IotWaterQualityData selectLatestDataBySerialNumber(String serialNumber);

    /**
     * 批量插入水质监测数据
     *
     * @param dataList 水质监测数据列表
     * @return 结果
     */
    public int batchInsertIotWaterQualityData(List<IotWaterQualityData> dataList);

    /**
     * 保存MQTT接收到的水质数据
     *
     * @param jsonData JSON格式的水质数据
     * @return 结果
     */
    public int saveWaterQualityDataFromMqtt(String jsonData);
}
