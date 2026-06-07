package com.ruoyi.iot.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 设备告警对象 iot_device_alert
 */
public class IotDeviceAlert extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 告警ID */
    private Long alertId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long deviceId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 告警名称 */
    @Excel(name = "告警名称")
    private String alertName;

    /** 告警级别:1-提示 2-一般 3-严重 4-紧急 */
    @Excel(name = "告警级别", readConverterExp = "1=提示,2=一般,3=严重,4=紧急")
    private Integer alertLevel;

    /** 告警内容 */
    @Excel(name = "告警内容")
    private String alertContent;

    /** 告警时间 */
    @Excel(name = "告警时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date alertTime;

    /** 告警类型 */
    @Excel(name = "告警类型")
    private String alertType;

    /** 告警来源(属性/功能/事件) */
    @Excel(name = "告警来源")
    private String source;

    /** 告警来源标识符 */
    @Excel(name = "告警来源标识符")
    private String sourceIdentifier;

    /** 产品ID */
    private Long productId;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    /** 处理状态:0-未处理 1-已确认 2-已处理 */
    @Excel(name = "处理状态", readConverterExp = "0=未处理,1=已确认,2=已处理")
    private Integer status;

    /** 处理人 */
    @Excel(name = "处理人")
    private String handler;

    /** 处理时间 */
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    /** 处理备注 */
    @Excel(name = "处理备注")
    private String delFlag;

    private String handleRemark;

    public Long getAlertId() {
        return alertId;
    }

    public void setAlertId(Long alertId) {
        this.alertId = alertId;
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

    public String getAlertName() {
        return alertName;
    }

    public void setAlertName(String alertName) {
        this.alertName = alertName;
    }

    public Integer getAlertLevel() {
        return alertLevel;
    }

    public void setAlertLevel(Integer alertLevel) {
        this.alertLevel = alertLevel;
    }

    public String getAlertContent() {
        return alertContent;
    }

    public void setAlertContent(String alertContent) {
        this.alertContent = alertContent;
    }

    public Date getAlertTime() {
        return alertTime;
    }

    public void setAlertTime(Date alertTime) {
        this.alertTime = alertTime;
    }

    public String getAlertType() {
        return alertType;
    }

    public void setAlertType(String alertType) {
        this.alertType = alertType;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSourceIdentifier() {
        return sourceIdentifier;
    }

    public void setSourceIdentifier(String sourceIdentifier) {
        this.sourceIdentifier = sourceIdentifier;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getHandleRemark() {
        return handleRemark;
    }

    public void setHandleRemark(String handleRemark) {
        this.handleRemark = handleRemark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("alertId", getAlertId())
                .append("deviceId", getDeviceId())
                .append("deviceName", getDeviceName())
                .append("alertName", getAlertName())
                .append("alertLevel", getAlertLevel())
                .append("alertContent", getAlertContent())
                .append("alertTime", getAlertTime())
                .append("alertType", getAlertType())
                .append("source", getSource())
                .append("sourceIdentifier", getSourceIdentifier())
                .append("productId", getProductId())
                .append("productName", getProductName())
                .append("status", getStatus())
                .append("handler", getHandler())
                .append("handleTime", getHandleTime())
                .append("handleRemark", getHandleRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
