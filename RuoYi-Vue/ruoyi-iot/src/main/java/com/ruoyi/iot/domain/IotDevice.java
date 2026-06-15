package com.ruoyi.iot.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 设备对象 iot_device
 */
public class IotDevice extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 设备ID */
    private Long deviceId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 所属产品ID */
    private Long productId;

    /** 所属产品名称 */
    @Excel(name = "所属产品")
    private String productName;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private String serialNumber;

    /** 状态:1-未激活 2-禁用 3-在线 4-离线 */
    @Excel(name = "设备状态", readConverterExp = "1=未激活,2=禁用,3=在线,4=离线")
    private Integer status;

    /** 设备类型:1-直连 2-网关 3-监控 */
    @Excel(name = "设备类型", readConverterExp = "1=直连,2=网关,3=监控")
    private Integer deviceType;

    /** 固件版本 */
    @Excel(name = "固件版本")
    private String firmwareVersion;

    /** 坐标(经纬度) */
    private String coordinate;

    /** 所在地址 */
    @Excel(name = "所在地址")
    private String networkAddress;

    /** 入网IP */
    @Excel(name = "入网IP")
    private String networkIp;

    /** 定位方式:1-自动 2-手动 */
    private Integer locationWay;

    /** 关联地块ID */
    private Long landId;

    /** 关联地块名称 */
    @Excel(name = "关联地块")
    private String landName;

    /** 设备影子:0-否 1-是 */
    @Excel(name = "设备影子", readConverterExp = "0=否,1=是")
    private Integer isShadow;

    /** 租户ID */
    private Long tenantId;

    /** 租户名称 */
    private String tenantName;

    /** 删除标识 */
    private String delFlag;

    /** 激活时间 */
    private Date activeTime;

    // ========== 运行状态扩展字段（来自iot_device_running_status表） ==========
    /** 信号强度(dBm) */
    private Integer rssi;

    /** 最后上线时间 */
    private Date onlineTime;

    /** 最后离线时间 */
    private Date offlineTime;

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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(Integer deviceType) {
        this.deviceType = deviceType;
    }

    public String getFirmwareVersion() {
        return firmwareVersion;
    }

    public void setFirmwareVersion(String firmwareVersion) {
        this.firmwareVersion = firmwareVersion;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
    }

    public String getNetworkAddress() {
        return networkAddress;
    }

    public void setNetworkAddress(String networkAddress) {
        this.networkAddress = networkAddress;
    }

    public String getNetworkIp() {
        return networkIp;
    }

    public void setNetworkIp(String networkIp) {
        this.networkIp = networkIp;
    }

    public Integer getLocationWay() {
        return locationWay;
    }

    public void setLocationWay(Integer locationWay) {
        this.locationWay = locationWay;
    }

    public Long getLandId() {
        return landId;
    }

    public void setLandId(Long landId) {
        this.landId = landId;
    }

    public String getLandName() {
        return landName;
    }

    public void setLandName(String landName) {
        this.landName = landName;
    }

    public Integer getIsShadow() {
        return isShadow;
    }

    public void setIsShadow(Integer isShadow) {
        this.isShadow = isShadow;
    }

    public Long getTenantId() {
        return tenantId;
    }

    public void setTenantId(Long tenantId) {
        this.tenantId = tenantId;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("deviceId", getDeviceId())
                .append("deviceName", getDeviceName())
                .append("productId", getProductId())
                .append("productName", getProductName())
                .append("serialNumber", getSerialNumber())
                .append("status", getStatus())
                .append("deviceType", getDeviceType())
                .append("firmwareVersion", getFirmwareVersion())
                .append("coordinate", getCoordinate())
                .append("networkAddress", getNetworkAddress())
                .append("networkIp", getNetworkIp())
                .append("locationWay", getLocationWay())
                .append("landId", getLandId())
                .append("landName", getLandName())
                .append("isShadow", getIsShadow())
                .append("tenantId", getTenantId())
                .append("tenantName", getTenantName())
                .append("activeTime", getActiveTime())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
