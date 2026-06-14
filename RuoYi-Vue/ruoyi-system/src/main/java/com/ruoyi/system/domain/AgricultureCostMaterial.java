package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 农资物料成本对象 agriculture_cost_material
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public class AgricultureCostMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成本ID */
    private Long costId;

    /** 任务ID */
    @Excel(name = "任务ID")
    private Long taskId;

    /** 批次ID */
    @Excel(name = "批次ID")
    private Long batchId;

    /** 物料ID */
    @Excel(name = "物料ID")
    private Long materialId;

    /** 物料名称 */
    @Excel(name = "物料名称")
    private String materialName;

    /** 物料类型（种子、肥料、农药、薄膜等） */
    @Excel(name = "物料类型")
    private String materialType;

    /** 物料规格 */
    @Excel(name = "物料规格")
    private String materialSpec;

    /** 计量单位（公斤、袋、瓶等） */
    @Excel(name = "计量单位")
    private String materialUnit;

    /** 使用数量 */
    @Excel(name = "使用数量")
    private BigDecimal useQuantity;

    /** 使用日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "使用日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date useDate;

    /** 单价（元） */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 总成本（元） */
    @Excel(name = "总成本")
    private BigDecimal totalCost;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 支付状态（0未支付 1已支付） */
    @Excel(name = "支付状态")
    private String paymentStatus;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setCostId(Long costId)
    {
        this.costId = costId;
    }

    public Long getCostId()
    {
        return costId;
    }

    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }

    public void setBatchId(Long batchId)
    {
        this.batchId = batchId;
    }

    public Long getBatchId()
    {
        return batchId;
    }

    public void setMaterialId(Long materialId)
    {
        this.materialId = materialId;
    }

    public Long getMaterialId()
    {
        return materialId;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialType(String materialType)
    {
        this.materialType = materialType;
    }

    public String getMaterialType()
    {
        return materialType;
    }

    public void setMaterialSpec(String materialSpec)
    {
        this.materialSpec = materialSpec;
    }

    public String getMaterialSpec()
    {
        return materialSpec;
    }

    public void setMaterialUnit(String materialUnit)
    {
        this.materialUnit = materialUnit;
    }

    public String getMaterialUnit()
    {
        return materialUnit;
    }

    public void setUseQuantity(BigDecimal useQuantity)
    {
        this.useQuantity = useQuantity;
    }

    public BigDecimal getUseQuantity()
    {
        return useQuantity;
    }

    public void setUseDate(Date useDate)
    {
        this.useDate = useDate;
    }

    public Date getUseDate()
    {
        return useDate;
    }

    public void setUnitPrice(BigDecimal unitPrice)
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice()
    {
        return unitPrice;
    }

    public void setTotalCost(BigDecimal totalCost)
    {
        this.totalCost = totalCost;
    }

    public BigDecimal getTotalCost()
    {
        return totalCost;
    }

    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }

    public String getSupplierName()
    {
        return supplierName;
    }

    public void setPaymentStatus(String paymentStatus)
    {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentStatus()
    {
        return paymentStatus;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("costId", getCostId())
            .append("taskId", getTaskId())
            .append("batchId", getBatchId())
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("materialType", getMaterialType())
            .append("materialSpec", getMaterialSpec())
            .append("materialUnit", getMaterialUnit())
            .append("useQuantity", getUseQuantity())
            .append("useDate", getUseDate())
            .append("unitPrice", getUnitPrice())
            .append("totalCost", getTotalCost())
            .append("supplierName", getSupplierName())
            .append("paymentStatus", getPaymentStatus())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
