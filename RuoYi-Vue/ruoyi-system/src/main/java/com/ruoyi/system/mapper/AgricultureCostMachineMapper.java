package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureCostMachine;

/**
 * 农事机械成本Mapper接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface AgricultureCostMachineMapper
{
    /**
     * 查询农事机械成本
     *
     * @param costId 农事机械成本主键
     * @return 农事机械成本
     */
    public AgricultureCostMachine selectAgricultureCostMachineByCostId(Long costId);

    /**
     * 查询农事机械成本列表
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 农事机械成本集合
     */
    public List<AgricultureCostMachine> selectAgricultureCostMachineList(AgricultureCostMachine agricultureCostMachine);

    /**
     * 新增农事机械成本
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 结果
     */
    public int insertAgricultureCostMachine(AgricultureCostMachine agricultureCostMachine);

    /**
     * 修改农事机械成本
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 结果
     */
    public int updateAgricultureCostMachine(AgricultureCostMachine agricultureCostMachine);

    /**
     * 删除农事机械成本
     *
     * @param costId 农事机械成本主键
     * @return 结果
     */
    public int deleteAgricultureCostMachineByCostId(Long costId);

    /**
     * 批量删除农事机械成本
     *
     * @param costIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureCostMachineByCostIds(Long[] costIds);
}
