package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureMachineInfo;

/**
 * 机械信息Service接口
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
public interface IAgricultureMachineInfoService 
{
    /**
     * 查询机械信息
     * 
     * @param machineId 机械信息主键
     * @return 机械信息
     */
    public AgricultureMachineInfo selectAgricultureMachineInfoByMachineId(String machineId);

    /**
     * 查询机械信息列表
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 机械信息集合
     */
    public List<AgricultureMachineInfo> selectAgricultureMachineInfoList(AgricultureMachineInfo agricultureMachineInfo);

    /**
     * 新增机械信息
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 结果
     */
    public int insertAgricultureMachineInfo(AgricultureMachineInfo agricultureMachineInfo);

    /**
     * 修改机械信息
     * 
     * @param agricultureMachineInfo 机械信息
     * @return 结果
     */
    public int updateAgricultureMachineInfo(AgricultureMachineInfo agricultureMachineInfo);

    /**
     * 批量删除机械信息
     * 
     * @param machineIds 需要删除的机械信息主键集合
     * @return 结果
     */
    public int deleteAgricultureMachineInfoByMachineIds(String[] machineIds);

    /**
     * 删除机械信息信息
     * 
     * @param machineId 机械信息主键
     * @return 结果
     */
    public int deleteAgricultureMachineInfoByMachineId(String machineId);
}
