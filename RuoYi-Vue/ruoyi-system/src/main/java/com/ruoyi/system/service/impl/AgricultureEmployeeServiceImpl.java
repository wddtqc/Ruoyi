package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureEmployeeMapper;
import com.ruoyi.system.domain.AgricultureEmployee;
import com.ruoyi.system.service.IAgricultureEmployeeService;

/**
 * 雇员Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@Service
public class AgricultureEmployeeServiceImpl implements IAgricultureEmployeeService 
{
    @Autowired
    private AgricultureEmployeeMapper agricultureEmployeeMapper;

    /**
     * 查询雇员
     * 
     * @param employeeId 雇员主键
     * @return 雇员
     */
    @Override
    public AgricultureEmployee selectAgricultureEmployeeByEmployeeId(String employeeId)
    {
        return agricultureEmployeeMapper.selectAgricultureEmployeeByEmployeeId(employeeId);
    }

    /**
     * 查询雇员列表
     * 
     * @param agricultureEmployee 雇员
     * @return 雇员
     */
    @Override
    public List<AgricultureEmployee> selectAgricultureEmployeeList(AgricultureEmployee agricultureEmployee)
    {
        return agricultureEmployeeMapper.selectAgricultureEmployeeList(agricultureEmployee);
    }

    /**
     * 新增雇员
     * 
     * @param agricultureEmployee 雇员
     * @return 结果
     */
    @Override
    public int insertAgricultureEmployee(AgricultureEmployee agricultureEmployee)
    {
        agricultureEmployee.setCreateTime(DateUtils.getNowDate());
        return agricultureEmployeeMapper.insertAgricultureEmployee(agricultureEmployee);
    }

    /**
     * 修改雇员
     * 
     * @param agricultureEmployee 雇员
     * @return 结果
     */
    @Override
    public int updateAgricultureEmployee(AgricultureEmployee agricultureEmployee)
    {
        agricultureEmployee.setUpdateTime(DateUtils.getNowDate());
        return agricultureEmployeeMapper.updateAgricultureEmployee(agricultureEmployee);
    }

    /**
     * 批量删除雇员
     * 
     * @param employeeIds 需要删除的雇员主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureEmployeeByEmployeeIds(String[] employeeIds)
    {
        return agricultureEmployeeMapper.deleteAgricultureEmployeeByEmployeeIds(employeeIds);
    }

    /**
     * 删除雇员信息
     * 
     * @param employeeId 雇员主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureEmployeeByEmployeeId(String employeeId)
    {
        return agricultureEmployeeMapper.deleteAgricultureEmployeeByEmployeeId(employeeId);
    }
}
