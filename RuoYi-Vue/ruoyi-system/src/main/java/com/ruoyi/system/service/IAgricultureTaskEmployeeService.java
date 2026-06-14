package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureTaskEmployee;

/**
 * 任务分配员工Service接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface IAgricultureTaskEmployeeService
{
    /**
     * 查询任务分配员工
     *
     * @param assignId 任务分配员工主键
     * @return 任务分配员工
     */
    public AgricultureTaskEmployee selectAgricultureTaskEmployeeByAssignId(Long assignId);

    /**
     * 查询任务分配员工列表
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 任务分配员工集合
     */
    public List<AgricultureTaskEmployee> selectAgricultureTaskEmployeeList(AgricultureTaskEmployee agricultureTaskEmployee);

    /**
     * 新增任务分配员工
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 结果
     */
    public int insertAgricultureTaskEmployee(AgricultureTaskEmployee agricultureTaskEmployee);

    /**
     * 修改任务分配员工
     *
     * @param agricultureTaskEmployee 任务分配员工
     * @return 结果
     */
    public int updateAgricultureTaskEmployee(AgricultureTaskEmployee agricultureTaskEmployee);

    /**
     * 批量删除任务分配员工
     *
     * @param assignIds 需要删除的任务分配员工主键集合
     * @return 结果
     */
    public int deleteAgricultureTaskEmployeeByAssignIds(Long[] assignIds);

    /**
     * 删除任务分配员工信息
     *
     * @param assignId 任务分配员工主键
     * @return 结果
     */
    public int deleteAgricultureTaskEmployeeByAssignId(Long assignId);

    /**
     * 根据任务ID和员工ID删除任务分配员工
     *
     * @param taskId 任务ID
     * @param employeeId 员工ID
     * @return 结果
     */
    public int deleteAgricultureTaskEmployeeByTaskIdAndEmployeeId(Long taskId, Long employeeId);
}
