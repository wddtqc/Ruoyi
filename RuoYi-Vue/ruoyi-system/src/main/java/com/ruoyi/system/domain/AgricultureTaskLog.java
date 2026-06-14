package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务执行日志对象 agriculture_task_log
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public class AgricultureTaskLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日志ID */
    private Long logId;

    /** 任务ID */
    @Excel(name = "任务ID")
    private Long taskId;

    /** 批次ID */
    @Excel(name = "批次ID")
    private Long batchId;

    /** 日志类型（开始、暂停、继续、完成、异常） */
    @Excel(name = "日志类型")
    private String logType;

    /** 日志内容 */
    @Excel(name = "日志内容")
    private String logContent;

    /** 执行人ID */
    @Excel(name = "执行人ID")
    private Long executePerson;

    /** 执行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "执行时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date executeTime;

    /** 执行结果 */
    @Excel(name = "执行结果")
    private String executeResult;

    /** 执行状态（0正常 1异常） */
    @Excel(name = "执行状态")
    private String executeStatus;

    /** 日志图片 */
    @Excel(name = "日志图片")
    private String logImages;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 操作人员姓名 */
    @Excel(name = "操作人员姓名")
    private String operName;

    /** 操作描述 */
    @Excel(name = "操作描述")
    private String operDes;

    public void setOperName(String operName)
    {
        this.operName = operName;
    }

    public String getOperName()
    {
        return operName;
    }

    public void setOperDes(String operDes)
    {
        this.operDes = operDes;
    }

    public String getOperDes()
    {
        return operDes;
    }

    public void setLogId(Long logId)
    {
        this.logId = logId;
    }

    public Long getLogId()
    {
        return logId;
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

    public void setLogType(String logType)
    {
        this.logType = logType;
    }

    public String getLogType()
    {
        return logType;
    }

    public void setLogContent(String logContent)
    {
        this.logContent = logContent;
    }

    public String getLogContent()
    {
        return logContent;
    }

    public void setExecutePerson(Long executePerson)
    {
        this.executePerson = executePerson;
    }

    public Long getExecutePerson()
    {
        return executePerson;
    }

    public void setExecuteTime(Date executeTime)
    {
        this.executeTime = executeTime;
    }

    public Date getExecuteTime()
    {
        return executeTime;
    }

    public void setExecuteResult(String executeResult)
    {
        this.executeResult = executeResult;
    }

    public String getExecuteResult()
    {
        return executeResult;
    }

    public void setExecuteStatus(String executeStatus)
    {
        this.executeStatus = executeStatus;
    }

    public String getExecuteStatus()
    {
        return executeStatus;
    }

    public void setLogImages(String logImages)
    {
        this.logImages = logImages;
    }

    public String getLogImages()
    {
        return logImages;
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
            .append("logId", getLogId())
            .append("taskId", getTaskId())
            .append("batchId", getBatchId())
            .append("logType", getLogType())
            .append("logContent", getLogContent())
            .append("executePerson", getExecutePerson())
            .append("executeTime", getExecuteTime())
            .append("executeResult", getExecuteResult())
            .append("executeStatus", getExecuteStatus())
            .append("logImages", getLogImages())
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
