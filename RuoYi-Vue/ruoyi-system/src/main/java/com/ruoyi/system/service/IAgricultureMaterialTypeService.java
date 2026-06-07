package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureMaterialType;

/**
 * 农资类别Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureMaterialTypeService 
{
    /**
     * 查询农资类别
     * 
     * @param materialTypeId 农资类别主键
     * @return 农资类别
     */
    public AgricultureMaterialType selectAgricultureMaterialTypeByMaterialTypeId(String materialTypeId);

    /**
     * 查询农资类别列表
     * 
     * @param agricultureMaterialType 农资类别
     * @return 农资类别集合
     */
    public List<AgricultureMaterialType> selectAgricultureMaterialTypeList(AgricultureMaterialType agricultureMaterialType);

    /**
     * 新增农资类别
     * 
     * @param agricultureMaterialType 农资类别
     * @return 结果
     */
    public int insertAgricultureMaterialType(AgricultureMaterialType agricultureMaterialType);

    /**
     * 修改农资类别
     * 
     * @param agricultureMaterialType 农资类别
     * @return 结果
     */
    public int updateAgricultureMaterialType(AgricultureMaterialType agricultureMaterialType);

    /**
     * 批量删除农资类别
     * 
     * @param materialTypeIds 需要删除的农资类别主键集合
     * @return 结果
     */
    public int deleteAgricultureMaterialTypeByMaterialTypeIds(String[] materialTypeIds);

    /**
     * 删除农资类别信息
     * 
     * @param materialTypeId 农资类别主键
     * @return 结果
     */
    public int deleteAgricultureMaterialTypeByMaterialTypeId(String materialTypeId);
}
