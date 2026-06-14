package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureCostMaterial;

/**
 * 农资物料成本Mapper接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface AgricultureCostMaterialMapper
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
     * 删除农资物料成本
     *
     * @param costId 农资物料成本主键
     * @return 结果
     */
    public int deleteAgricultureCostMaterialByCostId(Long costId);

    /**
     * 批量删除农资物料成本
     *
     * @param costIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureCostMaterialByCostIds(Long[] costIds);
}
