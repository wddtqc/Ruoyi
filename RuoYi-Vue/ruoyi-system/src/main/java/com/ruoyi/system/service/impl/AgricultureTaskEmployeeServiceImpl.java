package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureTaskEmployeeMapper;
import com.ruoyi.system.mapper.AgricultureEmployeeMapper;
import com.ruoyi.system.domain.AgricultureTaskEmployee;
import com.ruoyi.system.domain.AgricultureEmployee;
import com.ruoyi.system.service.IAgricultureTaskEmployeeService;

/**
 * 任务分配员工Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@Service
public class AgricultureTaskEmployeeServiceImpl implements IAgricultureTaskEmployeeService
{
    @Autowired
    private AgricultureTaskEmployeeMapper agricultureTaskEmployeeMapper;

    @Autowired
    private AgricultureEmployeeMapper agricultureEmployeeMapper;

    /**
     * 查询任务分配员工
     *
     * @param assignId 任务分配员工主键
     * @return 任务分配员工
     */
    @Override
    public AgricultureTaskEmployee selectAgricultureTaskEmployeeByAssignId(Long assignId)
    {
        return agricultureTaskEmployeeMapper.selectAgricultureTaskEmployeeByAssignId(assignId);
    }

    /**
     * 查询任务分配员工列表
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 任务分配员工
     */
    @Override
    public List<AgricultureTaskEmployee> selectAgricultureTaskEmployeeList(AgricultureTaskEmployee agricultureTaskEmployee)
    {
        return agricultureTaskEmployeeMapper.selectAgricultureTaskEmployeeList(agricultureTaskEmployee);
    }

    /**
     * 新增任务分配员工
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 结果
     */
    @Override
    public int insertAgricultureTaskEmployee(AgricultureTaskEmployee agricultureTaskEmployee)
    {
        // 自动填充员工姓名
        if (agricultureTaskEmployee.getEmployeeId() != null &&
            (agricultureTaskEmployee.getEmployeeName() == null || agricultureTaskEmployee.getEmployeeName().isEmpty()))
        {
            AgricultureEmployee employee = agricultureEmployeeMapper.selectAgricultureEmployeeByEmployeeId(String.valueOf(agricultureTaskEmployee.getEmployeeId()));
            if (employee != null)
            {
                agricultureTaskEmployee.setEmployeeName(employee.getEmployeeName());
            }
        }
        agricultureTaskEmployee.setCreateTime(DateUtils.getNowDate());
        return agricultureTaskEmployeeMapper.insertAgricultureTaskEmployee(agricultureTaskEmployee);
    }

    /**
     * 修改任务分配员工
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 结果
     */
    @Override
    public int updateAgricultureTaskEmployee(AgricultureTaskEmployee agricultureTaskEmployee)
    {
        agricultureTaskEmployee.setUpdateTime(DateUtils.getNowDate());
        return agricultureTaskEmployeeMapper.updateAgricultureTaskEmployee(agricultureTaskEmployee);
    }

    /**
     * 批量删除任务分配员工
     *
     * @param assignIds 需要删除的任务分配员工主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureTaskEmployeeByAssignIds(Long[] assignIds)
    {
        return agricultureTaskEmployeeMapper.deleteAgricultureTaskEmployeeByAssignIds(assignIds);
    }

    /**
     * 删除任务分配员工信息
     *
     * @param assignId 任务分配员工主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureTaskEmployeeByAssignId(Long assignId)
    {
        return agricultureTaskEmployeeMapper.deleteAgricultureTaskEmployeeByAssignId(assignId);
    }

    /**
     * 根据任务ID和员工ID删除任务分配员工
     *
     * @param taskId 任务ID
     * @param employeeId 员工ID
     * @return 结果
     */
    @Override
    public int deleteAgricultureTaskEmployeeByTaskIdAndEmployeeId(Long taskId, Long employeeId)
    {
        return agricultureTaskEmployeeMapper.deleteAgricultureTaskEmployeeByTaskIdAndEmployeeId(taskId, employeeId);
    }
}
