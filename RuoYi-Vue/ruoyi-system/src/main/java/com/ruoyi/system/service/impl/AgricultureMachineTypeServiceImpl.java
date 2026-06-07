package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureMachineTypeMapper;
import com.ruoyi.system.domain.AgricultureMachineType;
import com.ruoyi.system.service.IAgricultureMachineTypeService;

/**
 * 机械类别Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureMachineTypeServiceImpl implements IAgricultureMachineTypeService 
{
    @Autowired
    private AgricultureMachineTypeMapper agricultureMachineTypeMapper;

    /**
     * 查询机械类别
     * 
     * @param machineTypeId 机械类别主键
     * @return 机械类别
     */
    @Override
    public AgricultureMachineType selectAgricultureMachineTypeByMachineTypeId(String machineTypeId)
    {
        return agricultureMachineTypeMapper.selectAgricultureMachineTypeByMachineTypeId(machineTypeId);
    }

    /**
     * 查询机械类别列表
     * 
     * @param agricultureMachineType 机械类别
     * @return 机械类别
     */
    @Override
    public List<AgricultureMachineType> selectAgricultureMachineTypeList(AgricultureMachineType agricultureMachineType)
    {
        return agricultureMachineTypeMapper.selectAgricultureMachineTypeList(agricultureMachineType);
    }

    /**
     * 新增机械类别
     * 
     * @param agricultureMachineType 机械类别
     * @return 结果
     */
    @Override
    public int insertAgricultureMachineType(AgricultureMachineType agricultureMachineType)
    {
        agricultureMachineType.setCreateTime(DateUtils.getNowDate());
        return agricultureMachineTypeMapper.insertAgricultureMachineType(agricultureMachineType);
    }

    /**
     * 修改机械类别
     * 
     * @param agricultureMachineType 机械类别
     * @return 结果
     */
    @Override
    public int updateAgricultureMachineType(AgricultureMachineType agricultureMachineType)
    {
        agricultureMachineType.setUpdateTime(DateUtils.getNowDate());
        return agricultureMachineTypeMapper.updateAgricultureMachineType(agricultureMachineType);
    }

    /**
     * 批量删除机械类别
     * 
     * @param machineTypeIds 需要删除的机械类别主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMachineTypeByMachineTypeIds(String[] machineTypeIds)
    {
        return agricultureMachineTypeMapper.deleteAgricultureMachineTypeByMachineTypeIds(machineTypeIds);
    }

    /**
     * 删除机械类别信息
     * 
     * @param machineTypeId 机械类别主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMachineTypeByMachineTypeId(String machineTypeId)
    {
        return agricultureMachineTypeMapper.deleteAgricultureMachineTypeByMachineTypeId(machineTypeId);
    }
}
