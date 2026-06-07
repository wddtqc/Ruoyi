package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureMachineInfoMapper;
import com.ruoyi.system.domain.AgricultureMachineInfo;
import com.ruoyi.system.service.IAgricultureMachineInfoService;

/**
 * 机械信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@Service
public class AgricultureMachineInfoServiceImpl implements IAgricultureMachineInfoService 
{
    @Autowired
    private AgricultureMachineInfoMapper agricultureMachineInfoMapper;

    /**
     * 查询机械信息
     * 
     * @param machineId 机械信息主键
     * @return 机械信息
     */
    @Override
    public AgricultureMachineInfo selectAgricultureMachineInfoByMachineId(String machineId)
    {
        return agricultureMachineInfoMapper.selectAgricultureMachineInfoByMachineId(machineId);
    }

    /**
     * 查询机械信息列表
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 机械信息
     */
    @Override
    public List<AgricultureMachineInfo> selectAgricultureMachineInfoList(AgricultureMachineInfo agricultureMachineInfo)
    {
        return agricultureMachineInfoMapper.selectAgricultureMachineInfoList(agricultureMachineInfo);
    }

    /**
     * 新增机械信息
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 结果
     */
    @Override
    public int insertAgricultureMachineInfo(AgricultureMachineInfo agricultureMachineInfo)
    {
        agricultureMachineInfo.setCreateTime(DateUtils.getNowDate());
        return agricultureMachineInfoMapper.insertAgricultureMachineInfo(agricultureMachineInfo);
    }

    /**
     * 修改机械信息
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 结果
     */
    @Override
    public int updateAgricultureMachineInfo(AgricultureMachineInfo agricultureMachineInfo)
    {
        agricultureMachineInfo.setUpdateTime(DateUtils.getNowDate());
        return agricultureMachineInfoMapper.updateAgricultureMachineInfo(agricultureMachineInfo);
    }

    /**
     * 批量删除机械信息
     * 
     * @param machineIds 需要删除的机械信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMachineInfoByMachineIds(String[] machineIds)
    {
        return agricultureMachineInfoMapper.deleteAgricultureMachineInfoByMachineIds(machineIds);
    }

    /**
     * 删除机械信息信息
     * 
     * @param machineId 机械信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMachineInfoByMachineId(String machineId)
    {
        return agricultureMachineInfoMapper.deleteAgricultureMachineInfoByMachineId(machineId);
    }
}
