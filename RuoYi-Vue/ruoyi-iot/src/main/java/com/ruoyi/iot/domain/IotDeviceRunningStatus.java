package com.ruoyi.iot.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 设备运行状态对象 iot_device_running_status
 */
public class IotDeviceRunningStatus extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 状态ID */
    private Long statusId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long deviceId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private String serialNumber;

    /** 产品ID */
    private Long productId;

    /** 运行状态:3-在线 4-离线 */
    @Excel(name = "运行状态", readConverterExp = "3=在线,4=离线")
    private Integer status;

    /** 信号强度(dBm) */
    @Excel(name = "信号强度")
    private Integer rssi;

    /** 最后上线时间 */
    @Excel(name = "最后上线时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date onlineTime;

    /** 最后离线时间 */
    @Excel(name = "最后离线时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date offlineTime;

    /** 设备影子 */
    @Excel(name = "设备影子", readConverterExp = "0=否,1=是")
    private Integer isShadow;

    /** 物模型实时值(JSON) */
    private String delFlag;

    private String thingsModelValue;

    /** 最后更新时间 */
    @Excel(name = "最后更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRssi() {
        return rssi;
    }

    public void setRssi(Integer rssi) {
        this.rssi = rssi;
    }

    public Date getOnlineTime() {
        return onlineTime;
    }

    public void setOnlineTime(Date onlineTime) {
        this.onlineTime = onlineTime;
    }

    public Date getOfflineTime() {
        return offlineTime;
    }

    public void setOfflineTime(Date offlineTime) {
        this.offlineTime = offlineTime;
    }

    public Integer getIsShadow() {
        return isShadow;
    }

    public void setIsShadow(Integer isShadow) {
        this.isShadow = isShadow;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getThingsModelValue() {
        return thingsModelValue;
    }

    public void setThingsModelValue(String thingsModelValue) {
        this.thingsModelValue = thingsModelValue;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("statusId", getStatusId())
                .append("deviceId", getDeviceId())
                .append("deviceName", getDeviceName())
                .append("serialNumber", getSerialNumber())
                .append("productId", getProductId())
                .append("status", getStatus())
                .append("rssi", getRssi())
                .append("onlineTime", getOnlineTime())
                .append("offlineTime", getOfflineTime())
                .append("isShadow", getIsShadow())
                .append("thingsModelValue", getThingsModelValue())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
