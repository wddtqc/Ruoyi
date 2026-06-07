package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureMachineType;

/**
 * 机械类别Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureMachineTypeService 
{
    /**
     * 查询机械类别
     * 
     * @param machineTypeId 机械类别主键
     * @return 机械类别
     */
    public AgricultureMachineType selectAgricultureMachineTypeByMachineTypeId(String machineTypeId);

    /**
     * 查询机械类别列表
     * 
     * @param agricultureMachineType 机械类别
     * @return 机械类别集合
     */
    public List<AgricultureMachineType> selectAgricultureMachineTypeList(AgricultureMachineType agricultureMachineType);

    /**
     * 新增机械类别
     * 
     * @param agricultureMachineType 机械类别
     * @return 结果
     */
    public int insertAgricultureMachineType(AgricultureMachineType agricultureMachineType);

    /**
     * 修改机械类别
     * 
     * @param agricultureMachineType 机械类别
     * @return 结果
     */
    public int updateAgricultureMachineType(AgricultureMachineType agricultureMachineType);

    /**
     * 批量删除机械类别
     * 
     * @param machineTypeIds 需要删除的机械类别主键集合
     * @return 结果
     */
    public int deleteAgricultureMachineTypeByMachineTypeIds(String[] machineTypeIds);

    /**
     * 删除机械类别信息
     * 
     * @param machineTypeId 机械类别主键
     * @return 结果
     */
    public int deleteAgricultureMachineTypeByMachineTypeId(String machineTypeId);
}
