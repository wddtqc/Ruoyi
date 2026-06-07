package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 批次任务对象 agriculture_batch_task
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public class AgricultureBatchTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务ID */
    private String taskId;

    /** 批次ID */
    @Excel(name = "批次ID")
    private String batchId;

    /** 任务负责人 */
    @Excel(name = "任务负责人")
    private String taskHead;

    /** 任务名称 */
    @Excel(name = "任务名称")
    private String taskName;

    /** 计划开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planStart;

    /** 计划结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planFinish;

    /** 实际开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date actualStart;

    /** 实际结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date actualFinish;

    /** 任务详情 */
    @Excel(name = "任务详情")
    private String taskDetail;

    /** 图片资料 */
    @Excel(name = "图片资料")
    private String taskImages;

    /** 视频资料 */
    @Excel(name = "视频资料")
    private String taskVideos;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setTaskId(String taskId) 
    {
        this.taskId = taskId;
    }

    public String getTaskId() 
    {
        return taskId;
    }

    public void setBatchId(String batchId) 
    {
        this.batchId = batchId;
    }

    public String getBatchId() 
    {
        return batchId;
    }

    public void setTaskHead(String taskHead) 
    {
        this.taskHead = taskHead;
    }

    public String getTaskHead() 
    {
        return taskHead;
    }

    public void setTaskName(String taskName) 
    {
        this.taskName = taskName;
    }

    public String getTaskName() 
    {
        return taskName;
    }

    public void setPlanStart(Date planStart) 
    {
        this.planStart = planStart;
    }

    public Date getPlanStart() 
    {
        return planStart;
    }

    public void setPlanFinish(Date planFinish) 
    {
        this.planFinish = planFinish;
    }

    public Date getPlanFinish() 
    {
        return planFinish;
    }

    public void setActualStart(Date actualStart) 
    {
        this.actualStart = actualStart;
    }

    public Date getActualStart() 
    {
        return actualStart;
    }

    public void setActualFinish(Date actualFinish) 
    {
        this.actualFinish = actualFinish;
    }

    public Date getActualFinish() 
    {
        return actualFinish;
    }

    public void setTaskDetail(String taskDetail) 
    {
        this.taskDetail = taskDetail;
    }

    public String getTaskDetail() 
    {
        return taskDetail;
    }

    public void setTaskImages(String taskImages) 
    {
        this.taskImages = taskImages;
    }

    public String getTaskImages() 
    {
        return taskImages;
    }

    public void setTaskVideos(String taskVideos) 
    {
        this.taskVideos = taskVideos;
    }

    public String getTaskVideos() 
    {
        return taskVideos;
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
            .append("taskId", getTaskId())
            .append("batchId", getBatchId())
            .append("taskHead", getTaskHead())
            .append("taskName", getTaskName())
            .append("planStart", getPlanStart())
            .append("planFinish", getPlanFinish())
            .append("actualStart", getActualStart())
            .append("actualFinish", getActualFinish())
            .append("taskDetail", getTaskDetail())
            .append("taskImages", getTaskImages())
            .append("taskVideos", getTaskVideos())
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
