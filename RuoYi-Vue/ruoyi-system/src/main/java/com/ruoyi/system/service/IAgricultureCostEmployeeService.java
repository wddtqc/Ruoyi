package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureCostEmployee;

/**
 * 员工人工成本Service接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface IAgricultureCostEmployeeService
{
    /**
     * 查询员工人工成本
     *
     * @param costId 员工人工成本主键
     * @return 员工人工成本
     */
    public AgricultureCostEmployee selectAgricultureCostEmployeeByCostId(Long costId);

    /**
     * 查询员工人工成本列表
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 员工人工成本集合
     */
    public List<AgricultureCostEmployee> selectAgricultureCostEmployeeList(AgricultureCostEmployee agricultureCostEmployee);

    /**
     * 新增员工人工成本
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 结果
     */
    public int insertAgricultureCostEmployee(AgricultureCostEmployee agricultureCostEmployee);

    /**
     * 修改员工人工成本
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 结果
     */
    public int updateAgricultureCostEmployee(AgricultureCostEmployee agricultureCostEmployee);

    /**
     * 批量删除员工人工成本
     *
     * @param costIds 需要删除的员工人工成本主键集合
     * @return 结果
     */
    public int deleteAgricultureCostEmployeeByCostIds(Long[] costIds);

    /**
     * 删除员工人工成本信息
     *
     * @param costId 员工人工成本主键
     * @return 结果
     */
    public int deleteAgricultureCostEmployeeByCostId(Long costId);
}
