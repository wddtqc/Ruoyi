package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 基地信息对象 agriculture_baseinfo
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
public class AgricultureBaseinfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 基地ID */
    private String baseId;

    /** 基地简称 */
    @Excel(name = "基地简称")
    private String baseShortName;

    /** 基地编号 */
    @Excel(name = "基地编号")
    private String baseCode;

    /** 基地全称 */
    @Excel(name = "基地全称")
    private String baseName;

    /** 基地负责人 */
    @Excel(name = "基地负责人")
    private String baseLeader;

    /** 基地负责人电话 */
    @Excel(name = "基地负责人电话")
    private String leaderTel;

    /** 基地负责人地址 */
    @Excel(name = "基地负责人地址")
    private String baseAddress;

    /** 基地面积 */
    @Excel(name = "基地面积")
    private String baseArea;

    /** 基地海拔 */
    @Excel(name = "基地海拔")
    private Long baseAltitude;

    /** 现场图片 */
    @Excel(name = "现场图片")
    private String baseImg;

    /** 基地描述 */
    @Excel(name = "基地描述")
    private String baseDes;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String baseCoordinate;

    public void setBaseId(String baseId) 
    {
        this.baseId = baseId;
    }

    public String getBaseId() 
    {
        return baseId;
    }

    public void setBaseShortName(String baseShortName) 
    {
        this.baseShortName = baseShortName;
    }

    public String getBaseShortName() 
    {
        return baseShortName;
    }

    public void setBaseCode(String baseCode) 
    {
        this.baseCode = baseCode;
    }

    public String getBaseCode() 
    {
        return baseCode;
    }

    public void setBaseName(String baseName) 
    {
        this.baseName = baseName;
    }

    public String getBaseName() 
    {
        return baseName;
    }

    public void setBaseLeader(String baseLeader) 
    {
        this.baseLeader = baseLeader;
    }

    public String getBaseLeader() 
    {
        return baseLeader;
    }

    public void setLeaderTel(String leaderTel) 
    {
        this.leaderTel = leaderTel;
    }

    public String getLeaderTel() 
    {
        return leaderTel;
    }

    public void setBaseAddress(String baseAddress) 
    {
        this.baseAddress = baseAddress;
    }

    public String getBaseAddress() 
    {
        return baseAddress;
    }

    public void setBaseArea(String baseArea) 
    {
        this.baseArea = baseArea;
    }

    public String getBaseArea() 
    {
        return baseArea;
    }

    public void setBaseAltitude(Long baseAltitude) 
    {
        this.baseAltitude = baseAltitude;
    }

    public Long getBaseAltitude() 
    {
        return baseAltitude;
    }

    public void setBaseImg(String baseImg) 
    {
        this.baseImg = baseImg;
    }

    public String getBaseImg() 
    {
        return baseImg;
    }

    public void setBaseDes(String baseDes) 
    {
        this.baseDes = baseDes;
    }

    public String getBaseDes() 
    {
        return baseDes;
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

    public void setBaseCoordinate(String baseCoordinate) 
    {
        this.baseCoordinate = baseCoordinate;
    }

    public String getBaseCoordinate() 
    {
        return baseCoordinate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("baseId", getBaseId())
            .append("baseShortName", getBaseShortName())
            .append("baseCode", getBaseCode())
            .append("baseName", getBaseName())
            .append("baseLeader", getBaseLeader())
            .append("leaderTel", getLeaderTel())
            .append("baseAddress", getBaseAddress())
            .append("baseArea", getBaseArea())
            .append("baseAltitude", getBaseAltitude())
            .append("baseImg", getBaseImg())
            .append("baseDes", getBaseDes())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .append("baseCoordinate", getBaseCoordinate())
            .toString();
    }
}
