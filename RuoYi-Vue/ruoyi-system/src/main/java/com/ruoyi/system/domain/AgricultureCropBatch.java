package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作物批次对象 agriculture_crop_batch
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public class AgricultureCropBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批次ID */
    private String batchId;

    /** 批次名称 */
    @Excel(name = "批次名称")
    private String batchName;

    /** 种质ID */
    @Excel(name = "种质ID")
    private Long germplasmId;

    /** 地块ID */
    @Excel(name = "地块ID")
    private Long landId;

    /** 种植面积（亩） */
    @Excel(name = "种植面积", readConverterExp = "亩=")
    private BigDecimal cropArea;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 负责人Id */
    @Excel(name = "负责人Id")
    private Long batchHead;

    public void setBatchId(String batchId) 
    {
        this.batchId = batchId;
    }

    public String getBatchId() 
    {
        return batchId;
    }

    public void setBatchName(String batchName) 
    {
        this.batchName = batchName;
    }

    public String getBatchName() 
    {
        return batchName;
    }

    public void setGermplasmId(Long germplasmId) 
    {
        this.germplasmId = germplasmId;
    }

    public Long getGermplasmId() 
    {
        return germplasmId;
    }

    public void setLandId(Long landId) 
    {
        this.landId = landId;
    }

    public Long getLandId() 
    {
        return landId;
    }

    public void setCropArea(BigDecimal cropArea) 
    {
        this.cropArea = cropArea;
    }

    public BigDecimal getCropArea() 
    {
        return cropArea;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
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

    public void setBatchHead(Long batchHead) 
    {
        this.batchHead = batchHead;
    }

    public Long getBatchHead() 
    {
        return batchHead;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("batchId", getBatchId())
            .append("batchName", getBatchName())
            .append("germplasmId", getGermplasmId())
            .append("landId", getLandId())
            .append("cropArea", getCropArea())
            .append("startTime", getStartTime())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .append("batchHead", getBatchHead())
            .toString();
    }
}
