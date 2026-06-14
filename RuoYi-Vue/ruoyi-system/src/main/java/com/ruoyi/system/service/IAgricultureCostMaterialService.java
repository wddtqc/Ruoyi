package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureCostMaterial;

/**
 * 农资物料成本Service接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface IAgricultureCostMaterialService
{
    /**
     * 查询农资物料成本
     *
     * @param costId 农资物料成本主键
     * @return 农资物料成本
     */
    public AgricultureCostMaterial selectAgricultureCostMaterialByCostId(Long costId);

    /**
     * 查询农资物料成本列表
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 农资物料成本集合
     */
    public List<AgricultureCostMaterial> selectAgricultureCostMaterialList(AgricultureCostMaterial agricultureCostMaterial);

    /**
     * 新增农资物料成本
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 结果
     */
    public int insertAgricultureCostMaterial(AgricultureCostMaterial agricultureCostMaterial);

    /**
     * 修改农资物料成本
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 结果
     */
    public int updateAgricultureCostMaterial(AgricultureCostMaterial agricultureCostMaterial);

    /**
     * 批量删除农资物料成本
     *
     * @param costIds 需要删除的农资物料成本主键集合
     * @return 结果
     */
    public int deleteAgricultureCostMaterialByCostIds(Long[] costIds);

    /**
     * 删除农资物料成本信息
     *
     * @param costId 农资物料成本主键
     * @return 结果
     */
    public int deleteAgricultureCostMaterialByCostId(Long costId);
}
