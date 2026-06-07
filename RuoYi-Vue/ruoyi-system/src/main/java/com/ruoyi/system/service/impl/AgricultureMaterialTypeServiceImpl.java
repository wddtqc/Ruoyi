package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureMaterialTypeMapper;
import com.ruoyi.system.domain.AgricultureMaterialType;
import com.ruoyi.system.service.IAgricultureMaterialTypeService;

/**
 * 农资类别Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureMaterialTypeServiceImpl implements IAgricultureMaterialTypeService 
{
    @Autowired
    private AgricultureMaterialTypeMapper agricultureMaterialTypeMapper;

    /**
     * 查询农资类别
     * 
     * @param materialTypeId 农资类别主键
     * @return 农资类别
     */
    @Override
    public AgricultureMaterialType selectAgricultureMaterialTypeByMaterialTypeId(String materialTypeId)
    {
        return agricultureMaterialTypeMapper.selectAgricultureMaterialTypeByMaterialTypeId(materialTypeId);
    }

    /**
     * 查询农资类别列表
     * 
     * @param agricultureMaterialType 农资类别
     * @return 农资类别
     */
    @Override
    public List<AgricultureMaterialType> selectAgricultureMaterialTypeList(AgricultureMaterialType agricultureMaterialType)
    {
        return agricultureMaterialTypeMapper.selectAgricultureMaterialTypeList(agricultureMaterialType);
    }

    /**
     * 新增农资类别
     * 
     * @param agricultureMaterialType 农资类别
     * @return 结果
     */
    @Override
    public int insertAgricultureMaterialType(AgricultureMaterialType agricultureMaterialType)
    {
        agricultureMaterialType.setCreateTime(DateUtils.getNowDate());
        return agricultureMaterialTypeMapper.insertAgricultureMaterialType(agricultureMaterialType);
    }

    /**
     * 修改农资类别
     * 
     * @param agricultureMaterialType 农资类别
     * @return 结果
     */
    @Override
    public int updateAgricultureMaterialType(AgricultureMaterialType agricultureMaterialType)
    {
        agricultureMaterialType.setUpdateTime(DateUtils.getNowDate());
        return agricultureMaterialTypeMapper.updateAgricultureMaterialType(agricultureMaterialType);
    }

    /**
     * 批量删除农资类别
     * 
     * @param materialTypeIds 需要删除的农资类别主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMaterialTypeByMaterialTypeIds(String[] materialTypeIds)
    {
        return agricultureMaterialTypeMapper.deleteAgricultureMaterialTypeByMaterialTypeIds(materialTypeIds);
    }

    /**
     * 删除农资类别信息
     * 
     * @param materialTypeId 农资类别主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMaterialTypeByMaterialTypeId(String materialTypeId)
    {
        return agricultureMaterialTypeMapper.deleteAgricultureMaterialTypeByMaterialTypeId(materialTypeId);
    }
}
