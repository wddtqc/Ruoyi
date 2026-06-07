package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgriculturePlantMethodMapper;
import com.ruoyi.system.domain.AgriculturePlantMethod;
import com.ruoyi.system.service.IAgriculturePlantMethodService;

/**
 * 种植方法Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgriculturePlantMethodServiceImpl implements IAgriculturePlantMethodService 
{
    @Autowired
    private AgriculturePlantMethodMapper agriculturePlantMethodMapper;

    /**
     * 查询种植方法
     * 
     * @param methodId 种植方法主键
     * @return 种植方法
     */
    @Override
    public AgriculturePlantMethod selectAgriculturePlantMethodByMethodId(String methodId)
    {
        return agriculturePlantMethodMapper.selectAgriculturePlantMethodByMethodId(methodId);
    }

    /**
     * 查询种植方法列表
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 种植方法
     */
    @Override
    public List<AgriculturePlantMethod> selectAgriculturePlantMethodList(AgriculturePlantMethod agriculturePlantMethod)
    {
        return agriculturePlantMethodMapper.selectAgriculturePlantMethodList(agriculturePlantMethod);
    }

    /**
     * 新增种植方法
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 结果
     */
    @Override
    public int insertAgriculturePlantMethod(AgriculturePlantMethod agriculturePlantMethod)
    {
        agriculturePlantMethod.setCreateTime(DateUtils.getNowDate());
        return agriculturePlantMethodMapper.insertAgriculturePlantMethod(agriculturePlantMethod);
    }

    /**
     * 修改种植方法
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 结果
     */
    @Override
    public int updateAgriculturePlantMethod(AgriculturePlantMethod agriculturePlantMethod)
    {
        agriculturePlantMethod.setUpdateTime(DateUtils.getNowDate());
        return agriculturePlantMethodMapper.updateAgriculturePlantMethod(agriculturePlantMethod);
    }

    /**
     * 批量删除种植方法
     * 
     * @param methodIds 需要删除的种植方法主键
     * @return 结果
     */
    @Override
    public int deleteAgriculturePlantMethodByMethodIds(String[] methodIds)
    {
        return agriculturePlantMethodMapper.deleteAgriculturePlantMethodByMethodIds(methodIds);
    }

    /**
     * 删除种植方法信息
     * 
     * @param methodId 种植方法主键
     * @return 结果
     */
    @Override
    public int deleteAgriculturePlantMethodByMethodId(String methodId)
    {
        return agriculturePlantMethodMapper.deleteAgriculturePlantMethodByMethodId(methodId);
    }
}
