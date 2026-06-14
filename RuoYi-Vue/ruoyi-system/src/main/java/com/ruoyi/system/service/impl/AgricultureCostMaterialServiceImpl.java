package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureCostMaterialMapper;
import com.ruoyi.system.mapper.AgricultureMaterialInfoMapper;
import com.ruoyi.system.domain.AgricultureCostMaterial;
import com.ruoyi.system.domain.AgricultureMaterialInfo;
import com.ruoyi.system.service.IAgricultureCostMaterialService;

/**
 * 农资物料成本Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@Service
public class AgricultureCostMaterialServiceImpl implements IAgricultureCostMaterialService
{
    @Autowired
    private AgricultureCostMaterialMapper agricultureCostMaterialMapper;

    @Autowired
    private AgricultureMaterialInfoMapper agricultureMaterialInfoMapper;

    /**
     * 查询农资物料成本
     *
     * @param costId 农资物料成本主键
     * @return 农资物料成本
     */
    @Override
    public AgricultureCostMaterial selectAgricultureCostMaterialByCostId(Long costId)
    {
        return agricultureCostMaterialMapper.selectAgricultureCostMaterialByCostId(costId);
    }

    /**
     * 查询农资物料成本列表
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 农资物料成本
     */
    @Override
    public List<AgricultureCostMaterial> selectAgricultureCostMaterialList(AgricultureCostMaterial agricultureCostMaterial)
    {
        return agricultureCostMaterialMapper.selectAgricultureCostMaterialList(agricultureCostMaterial);
    }

    /**
     * 新增农资物料成本
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 结果
     */
    @Override
    public int insertAgricultureCostMaterial(AgricultureCostMaterial agricultureCostMaterial)
    {
        // 自动填充物料名称
        if (agricultureCostMaterial.getMaterialId() != null &&
            (agricultureCostMaterial.getMaterialName() == null || agricultureCostMaterial.getMaterialName().isEmpty()))
        {
            AgricultureMaterialInfo materialInfo = agricultureMaterialInfoMapper.selectAgricultureMaterialInfoByMaterialId(String.valueOf(agricultureCostMaterial.getMaterialId()));
            if (materialInfo != null)
            {
                agricultureCostMaterial.setMaterialName(materialInfo.getMaterialName());
            }
        }
        agricultureCostMaterial.setCreateTime(DateUtils.getNowDate());
        return agricultureCostMaterialMapper.insertAgricultureCostMaterial(agricultureCostMaterial);
    }

    /**
     * 修改农资物料成本
     *
     * @param agricultureCostMaterial 农资物料成本
     * @return 结果
     */
    @Override
    public int updateAgricultureCostMaterial(AgricultureCostMaterial agricultureCostMaterial)
    {
        agricultureCostMaterial.setUpdateTime(DateUtils.getNowDate());
        return agricultureCostMaterialMapper.updateAgricultureCostMaterial(agricultureCostMaterial);
    }

    /**
     * 批量删除农资物料成本
     *
     * @param costIds 需要删除的农资物料成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostMaterialByCostIds(Long[] costIds)
    {
        return agricultureCostMaterialMapper.deleteAgricultureCostMaterialByCostIds(costIds);
    }

    /**
     * 删除农资物料成本信息
     *
     * @param costId 农资物料成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostMaterialByCostId(Long costId)
    {
        return agricultureCostMaterialMapper.deleteAgricultureCostMaterialByCostId(costId);
    }
}
