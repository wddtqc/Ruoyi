package com.ruoyi.iot.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 水质监测数据对象 iot_water_quality_data
 *
 * @author ruoyi
 * @date 2026-06-15
 */
public class IotWaterQualityData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 设备序列号 */
    @Excel(name = "设备序列号")
    private String serialNumber;

    /** 设备类型 */
    @Excel(name = "设备类型")
    private String deviceType;

    /** 水温(℃) */
    @Excel(name = "水温", suffix = "℃")
    private Double waterTemperature;

    /** pH值 */
    @Excel(name = "pH值")
    private Double waterPh;

    /** 溶解氧(mg/L) */
    @Excel(name = "溶解氧", suffix = "mg/L")
    private Double dissolvedOxygen;

    /** 浊度(NTU) */
    @Excel(name = "浊度", suffix = "NTU")
    private Double turbidity;

    /** 信号强度(dBm) */
    @Excel(name = "信号强度", suffix = "dBm")
    private Integer signalStrength;

    /** 电池电量(%) */
    @Excel(name = "电池电量", suffix = "%")
    private Integer batteryLevel;

    /** 设备时间戳(毫秒) */
    private Long deviceTimestamp;

    // Getter and Setter methods

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public Double getWaterTemperature() {
        return waterTemperature;
    }

    public void setWaterTemperature(Double waterTemperature) {
        this.waterTemperature = waterTemperature;
    }

    public Double getWaterPh() {
        return waterPh;
    }

    public void setWaterPh(Double waterPh) {
        this.waterPh = waterPh;
    }

    public Double getDissolvedOxygen() {
        return dissolvedOxygen;
    }

    public void setDissolvedOxygen(Double dissolvedOxygen) {
        this.dissolvedOxygen = dissolvedOxygen;
    }

    public Double getTurbidity() {
        return turbidity;
    }

    public void setTurbidity(Double turbidity) {
        this.turbidity = turbidity;
    }

    public Integer getSignalStrength() {
        return signalStrength;
    }

    public void setSignalStrength(Integer signalStrength) {
        this.signalStrength = signalStrength;
    }

    public Integer getBatteryLevel() {
        return batteryLevel;
    }

    public void setBatteryLevel(Integer batteryLevel) {
        this.batteryLevel = batteryLevel;
    }

    public Long getDeviceTimestamp() {
        return deviceTimestamp;
    }

    public void setDeviceTimestamp(Long deviceTimestamp) {
        this.deviceTimestamp = deviceTimestamp;
    }

    @Override
    public String toString() {
        return "IotWaterQualityData{" +
                "id=" + id +
                ", serialNumber='" + serialNumber + '\'' +
                ", deviceType='" + deviceType + '\'' +
                ", waterTemperature=" + waterTemperature +
                ", waterPh=" + waterPh +
                ", dissolvedOxygen=" + dissolvedOxygen +
                ", turbidity=" + turbidity +
                ", signalStrength=" + signalStrength +
                ", batteryLevel=" + batteryLevel +
                ", deviceTimestamp=" + deviceTimestamp +
                ", createTime=" + getCreateTime() +
                '}';
    }
}
