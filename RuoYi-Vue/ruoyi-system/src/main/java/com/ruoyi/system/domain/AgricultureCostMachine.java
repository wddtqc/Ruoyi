package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 农事机械成本对象 agriculture_cost_machine
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public class AgricultureCostMachine extends BaseEntity
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

    /** 机械ID */
    @Excel(name = "机械ID")
    private Long machineId;

    /** 机械名称 */
    @Excel(name = "机械名称")
    private String machineName;

    /** 机械类型（拖拉机、收割机、播种机、灌溉设备等） */
    @Excel(name = "机械类型")
    private String machineType;

    /** 机械型号 */
    @Excel(name = "机械型号")
    private String machineModel;

    /** 使用时长（小时） */
    @Excel(name = "使用时长")
    private BigDecimal useHours;

    /** 使用日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "使用日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date useDate;

    /** 小时成本（元/小时） */
    @Excel(name = "小时成本")
    private BigDecimal hourlyCost;

    /** 燃油费用（元） */
    @Excel(name = "燃油费用")
    private BigDecimal fuelCost;

    /** 维护费用（元） */
    @Excel(name = "维护费用")
    private BigDecimal maintenanceCost;

    /** 总成本（元） */
    @Excel(name = "总成本")
    private BigDecimal totalCost;

    /** 操作人员姓名 */
    @Excel(name = "操作人员姓名")
    private String operatorName;

    /** 是否租赁（0自有 1租赁） */
    @Excel(name = "是否租赁")
    private String isRental;

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

    public void setMachineId(Long machineId)
    {
        this.machineId = machineId;
    }

    public Long getMachineId()
    {
        return machineId;
    }

    public void setMachineName(String machineName)
    {
        this.machineName = machineName;
    }

    public String getMachineName()
    {
        return machineName;
    }

    public void setMachineType(String machineType)
    {
        this.machineType = machineType;
    }

    public String getMachineType()
    {
        return machineType;
    }

    public void setMachineModel(String machineModel)
    {
        this.machineModel = machineModel;
    }

    public String getMachineModel()
    {
        return machineModel;
    }

    public void setUseHours(BigDecimal useHours)
    {
        this.useHours = useHours;
    }

    public BigDecimal getUseHours()
    {
        return useHours;
    }

    public void setUseDate(Date useDate)
    {
        this.useDate = useDate;
    }

    public Date getUseDate()
    {
        return useDate;
    }

    public void setHourlyCost(BigDecimal hourlyCost)
    {
        this.hourlyCost = hourlyCost;
    }

    public BigDecimal getHourlyCost()
    {
        return hourlyCost;
    }

    public void setFuelCost(BigDecimal fuelCost)
    {
        this.fuelCost = fuelCost;
    }

    public BigDecimal getFuelCost()
    {
        return fuelCost;
    }

    public void setMaintenanceCost(BigDecimal maintenanceCost)
    {
        this.maintenanceCost = maintenanceCost;
    }

    public BigDecimal getMaintenanceCost()
    {
        return maintenanceCost;
    }

    public void setTotalCost(BigDecimal totalCost)
    {
        this.totalCost = totalCost;
    }

    public BigDecimal getTotalCost()
    {
        return totalCost;
    }

    public void setOperatorName(String operatorName)
    {
        this.operatorName = operatorName;
    }

    public String getOperatorName()
    {
        return operatorName;
    }

    public void setIsRental(String isRental)
    {
        this.isRental = isRental;
    }

    public String getIsRental()
    {
        return isRental;
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
            .append("machineId", getMachineId())
            .append("machineName", getMachineName())
            .append("machineType", getMachineType())
            .append("machineModel", getMachineModel())
            .append("useHours", getUseHours())
            .append("useDate", getUseDate())
            .append("hourlyCost", getHourlyCost())
            .append("fuelCost", getFuelCost())
            .append("maintenanceCost", getMaintenanceCost())
            .append("totalCost", getTotalCost())
            .append("operatorName", getOperatorName())
            .append("isRental", getIsRental())
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
