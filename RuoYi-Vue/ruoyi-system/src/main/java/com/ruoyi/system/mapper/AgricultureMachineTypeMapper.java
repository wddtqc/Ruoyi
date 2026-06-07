package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureMachineType;

/**
 * 机械类别Mapper接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface AgricultureMachineTypeMapper 
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
     * 删除机械类别
     * 
     * @param machineTypeId 机械类别主键
     * @return 结果
     */
    public int deleteAgricultureMachineTypeByMachineTypeId(String machineTypeId);

    /**
     * 批量删除机械类别
     * 
     * @param machineTypeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureMachineTypeByMachineTypeIds(String[] machineTypeIds);
}
