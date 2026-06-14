package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 员工人工成本对象 agriculture_cost_employee
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public class AgricultureCostEmployee extends BaseEntity
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

    /** 员工ID */
    @Excel(name = "员工ID")
    private Long employeeId;

    /** 员工姓名 */
    @Excel(name = "员工姓名")
    private String employeeName;

    /** 工种类型（技术员、操作工、管理人员等） */
    @Excel(name = "工种类型")
    private String workType;

    /** 工作时长（小时） */
    @Excel(name = "工作时长")
    private BigDecimal workHours;

    /** 工作日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "工作日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date workDate;

    /** 小时工资（元/小时） */
    @Excel(name = "小时工资")
    private BigDecimal hourlyWage;

    /** 总成本（元） */
    @Excel(name = "总成本")
    private BigDecimal totalCost;

    /** 补贴金额（元） */
    @Excel(name = "补贴金额")
    private BigDecimal subsidyAmount;

    /** 实际支付（元） */
    @Excel(name = "实际支付")
    private BigDecimal actualPayment;

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

    public void setEmployeeId(Long employeeId)
    {
        this.employeeId = employeeId;
    }

    public Long getEmployeeId()
    {
        return employeeId;
    }

    public void setEmployeeName(String employeeName)
    {
        this.employeeName = employeeName;
    }

    public String getEmployeeName()
    {
        return employeeName;
    }

    public void setWorkType(String workType)
    {
        this.workType = workType;
    }

    public String getWorkType()
    {
        return workType;
    }

    public void setWorkHours(BigDecimal workHours)
    {
        this.workHours = workHours;
    }

    public BigDecimal getWorkHours()
    {
        return workHours;
    }

    public void setWorkDate(Date workDate)
    {
        this.workDate = workDate;
    }

    public Date getWorkDate()
    {
        return workDate;
    }

    public void setHourlyWage(BigDecimal hourlyWage)
    {
        this.hourlyWage = hourlyWage;
    }

    public BigDecimal getHourlyWage()
    {
        return hourlyWage;
    }

    public void setTotalCost(BigDecimal totalCost)
    {
        this.totalCost = totalCost;
    }

    public BigDecimal getTotalCost()
    {
        return totalCost;
    }

    public void setSubsidyAmount(BigDecimal subsidyAmount)
    {
        this.subsidyAmount = subsidyAmount;
    }

    public BigDecimal getSubsidyAmount()
    {
        return subsidyAmount;
    }

    public void setActualPayment(BigDecimal actualPayment)
    {
        this.actualPayment = actualPayment;
    }

    public BigDecimal getActualPayment()
    {
        return actualPayment;
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
            .append("employeeId", getEmployeeId())
            .append("employeeName", getEmployeeName())
            .append("workType", getWorkType())
            .append("workHours", getWorkHours())
            .append("workDate", getWorkDate())
            .append("hourlyWage", getHourlyWage())
            .append("totalCost", getTotalCost())
            .append("subsidyAmount", getSubsidyAmount())
            .append("actualPayment", getActualPayment())
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
