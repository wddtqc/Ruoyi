package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务分配员工对象 agriculture_task_employee
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public class AgricultureTaskEmployee extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分配ID */
    private Long assignId;

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

    /** 任务角色（负责人、协助人员） */
    @Excel(name = "任务角色")
    private String employeeRole;

    /** 分配时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "分配时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date assignTime;

    /** 是否负责人（0否 1是） */
    @Excel(name = "是否负责人")
    private String isLeader;

    /** 工作状态（0待开始 1进行中 2已完成） */
    @Excel(name = "工作状态")
    private String workStatus;

    /** 完成率（百分比） */
    @Excel(name = "完成率")
    private BigDecimal completionRate;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setAssignId(Long assignId)
    {
        this.assignId = assignId;
    }

    public Long getAssignId()
    {
        return assignId;
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

    public void setEmployeeRole(String employeeRole)
    {
        this.employeeRole = employeeRole;
    }

    public String getEmployeeRole()
    {
        return employeeRole;
    }

    public void setAssignTime(Date assignTime)
    {
        this.assignTime = assignTime;
    }

    public Date getAssignTime()
    {
        return assignTime;
    }

    public void setIsLeader(String isLeader)
    {
        this.isLeader = isLeader;
    }

    public String getIsLeader()
    {
        return isLeader;
    }

    public void setWorkStatus(String workStatus)
    {
        this.workStatus = workStatus;
    }

    public String getWorkStatus()
    {
        return workStatus;
    }

    public void setCompletionRate(BigDecimal completionRate)
    {
        this.completionRate = completionRate;
    }

    public BigDecimal getCompletionRate()
    {
        return completionRate;
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
            .append("assignId", getAssignId())
            .append("taskId", getTaskId())
            .append("batchId", getBatchId())
            .append("employeeId", getEmployeeId())
            .append("employeeName", getEmployeeName())
            .append("employeeRole", getEmployeeRole())
            .append("assignTime", getAssignTime())
            .append("isLeader", getIsLeader())
            .append("workStatus", getWorkStatus())
            .append("completionRate", getCompletionRate())
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
