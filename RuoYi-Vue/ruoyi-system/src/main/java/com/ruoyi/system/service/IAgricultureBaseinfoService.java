package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureBaseinfo;

/**
 * 基地信息Service接口
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
public interface IAgricultureBaseinfoService 
{
    /**
     * 查询基地信息
     * 
     * @param baseId 基地信息主键
     * @return 基地信息
     */
    public AgricultureBaseinfo selectAgricultureBaseinfoByBaseId(String baseId);

    /**
     * 查询基地信息列表
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 基地信息集合
     */
    public List<AgricultureBaseinfo> selectAgricultureBaseinfoList(AgricultureBaseinfo agricultureBaseinfo);

    /**
     * 新增基地信息
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 结果
     */
    public int insertAgricultureBaseinfo(AgricultureBaseinfo agricultureBaseinfo);

    /**
     * 修改基地信息
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 结果
     */
    public int updateAgricultureBaseinfo(AgricultureBaseinfo agricultureBaseinfo);

    /**
     * 批量删除基地信息
     * 
     * @param baseIds 需要删除的基地信息主键集合
     * @return 结果
     */
    public int deleteAgricultureBaseinfoByBaseIds(String[] baseIds);

    /**
     * 删除基地信息信息
     * 
     * @param baseId 基地信息主键
     * @return 结果
     */
    public int deleteAgricultureBaseinfoByBaseId(String baseId);
}
