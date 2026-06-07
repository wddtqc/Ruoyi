package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureBaseinfoMapper;
import com.ruoyi.system.domain.AgricultureBaseinfo;
import com.ruoyi.system.service.IAgricultureBaseinfoService;

/**
 * 基地信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@Service
public class AgricultureBaseinfoServiceImpl implements IAgricultureBaseinfoService 
{
    @Autowired
    private AgricultureBaseinfoMapper agricultureBaseinfoMapper;

    /**
     * 查询基地信息
     * 
     * @param baseId 基地信息主键
     * @return 基地信息
     */
    @Override
    public AgricultureBaseinfo selectAgricultureBaseinfoByBaseId(String baseId)
    {
        return agricultureBaseinfoMapper.selectAgricultureBaseinfoByBaseId(baseId);
    }

    /**
     * 查询基地信息列表
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 基地信息
     */
    @Override
    public List<AgricultureBaseinfo> selectAgricultureBaseinfoList(AgricultureBaseinfo agricultureBaseinfo)
    {
        return agricultureBaseinfoMapper.selectAgricultureBaseinfoList(agricultureBaseinfo);
    }

    /**
     * 新增基地信息
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 结果
     */
    @Override
    public int insertAgricultureBaseinfo(AgricultureBaseinfo agricultureBaseinfo)
    {
        agricultureBaseinfo.setCreateTime(DateUtils.getNowDate());
        return agricultureBaseinfoMapper.insertAgricultureBaseinfo(agricultureBaseinfo);
    }

    /**
     * 修改基地信息
     * 
     * @param agricultureBaseinfo 基地信息
     * @return 结果
     */
    @Override
    public int updateAgricultureBaseinfo(AgricultureBaseinfo agricultureBaseinfo)
    {
        agricultureBaseinfo.setUpdateTime(DateUtils.getNowDate());
        return agricultureBaseinfoMapper.updateAgricultureBaseinfo(agricultureBaseinfo);
    }

    /**
     * 批量删除基地信息
     * 
     * @param baseIds 需要删除的基地信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureBaseinfoByBaseIds(String[] baseIds)
    {
        return agricultureBaseinfoMapper.deleteAgricultureBaseinfoByBaseIds(baseIds);
    }

    /**
     * 删除基地信息信息
     * 
     * @param baseId 基地信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureBaseinfoByBaseId(String baseId)
    {
        return agricultureBaseinfoMapper.deleteAgricultureBaseinfoByBaseId(baseId);
    }
}
