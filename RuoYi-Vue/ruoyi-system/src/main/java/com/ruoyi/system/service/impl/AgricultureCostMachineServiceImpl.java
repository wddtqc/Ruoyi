package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureCostMachineMapper;
import com.ruoyi.system.mapper.AgricultureMachineInfoMapper;
import com.ruoyi.system.domain.AgricultureCostMachine;
import com.ruoyi.system.domain.AgricultureMachineInfo;
import com.ruoyi.system.service.IAgricultureCostMachineService;

/**
 * 农事机械成本Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@Service
public class AgricultureCostMachineServiceImpl implements IAgricultureCostMachineService
{
    @Autowired
    private AgricultureCostMachineMapper agricultureCostMachineMapper;

    @Autowired
    private AgricultureMachineInfoMapper agricultureMachineInfoMapper;

    /**
     * 查询农事机械成本
     *
     * @param costId 农事机械成本主键
     * @return 农事机械成本
     */
    @Override
    public AgricultureCostMachine selectAgricultureCostMachineByCostId(Long costId)
    {
        return agricultureCostMachineMapper.selectAgricultureCostMachineByCostId(costId);
    }

    /**
     * 查询农事机械成本列表
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 农事机械成本
     */
    @Override
    public List<AgricultureCostMachine> selectAgricultureCostMachineList(AgricultureCostMachine agricultureCostMachine)
    {
        return agricultureCostMachineMapper.selectAgricultureCostMachineList(agricultureCostMachine);
    }

    /**
     * 新增农事机械成本
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 结果
     */
    @Override
    public int insertAgricultureCostMachine(AgricultureCostMachine agricultureCostMachine)
    {
        // 自动填充机械名称
        if (agricultureCostMachine.getMachineId() != null &&
            (agricultureCostMachine.getMachineName() == null || agricultureCostMachine.getMachineName().isEmpty()))
        {
            AgricultureMachineInfo machineInfo = agricultureMachineInfoMapper.selectAgricultureMachineInfoByMachineId(String.valueOf(agricultureCostMachine.getMachineId()));
            if (machineInfo != null)
            {
                agricultureCostMachine.setMachineName(machineInfo.getMachineName());
            }
        }
        agricultureCostMachine.setCreateTime(DateUtils.getNowDate());
        return agricultureCostMachineMapper.insertAgricultureCostMachine(agricultureCostMachine);
    }

    /**
     * 修改农事机械成本
     *
     * @param agricultureCostMachine 农事机械成本
     * @return 结果
     */
    @Override
    public int updateAgricultureCostMachine(AgricultureCostMachine agricultureCostMachine)
    {
        agricultureCostMachine.setUpdateTime(DateUtils.getNowDate());
        return agricultureCostMachineMapper.updateAgricultureCostMachine(agricultureCostMachine);
    }

    /**
     * 批量删除农事机械成本
     *
     * @param costIds 需要删除的农事机械成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostMachineByCostIds(Long[] costIds)
    {
        return agricultureCostMachineMapper.deleteAgricultureCostMachineByCostIds(costIds);
    }

    /**
     * 删除农事机械成本信息
     *
     * @param costId 农事机械成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostMachineByCostId(Long costId)
    {
        return agricultureCostMachineMapper.deleteAgricultureCostMachineByCostId(costId);
    }
}
