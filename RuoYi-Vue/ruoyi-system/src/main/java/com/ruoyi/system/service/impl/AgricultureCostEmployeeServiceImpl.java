package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureCostEmployeeMapper;
import com.ruoyi.system.mapper.AgricultureEmployeeMapper;
import com.ruoyi.system.domain.AgricultureCostEmployee;
import com.ruoyi.system.domain.AgricultureEmployee;
import com.ruoyi.system.service.IAgricultureCostEmployeeService;

/**
 * 员工人工成本Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@Service
public class AgricultureCostEmployeeServiceImpl implements IAgricultureCostEmployeeService
{
    @Autowired
    private AgricultureCostEmployeeMapper agricultureCostEmployeeMapper;

    @Autowired
    private AgricultureEmployeeMapper agricultureEmployeeMapper;

    /**
     * 查询员工人工成本
     *
     * @param costId 员工人工成本主键
     * @return 员工人工成本
     */
    @Override
    public AgricultureCostEmployee selectAgricultureCostEmployeeByCostId(Long costId)
    {
        return agricultureCostEmployeeMapper.selectAgricultureCostEmployeeByCostId(costId);
    }

    /**
     * 查询员工人工成本列表
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 员工人工成本
     */
    @Override
    public List<AgricultureCostEmployee> selectAgricultureCostEmployeeList(AgricultureCostEmployee agricultureCostEmployee)
    {
        return agricultureCostEmployeeMapper.selectAgricultureCostEmployeeList(agricultureCostEmployee);
    }

    /**
     * 新增员工人工成本
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 结果
     */
    @Override
    public int insertAgricultureCostEmployee(AgricultureCostEmployee agricultureCostEmployee)
    {
        // 自动填充员工姓名
        if (agricultureCostEmployee.getEmployeeId() != null &&
            (agricultureCostEmployee.getEmployeeName() == null || agricultureCostEmployee.getEmployeeName().isEmpty()))
        {
            AgricultureEmployee employee = agricultureEmployeeMapper.selectAgricultureEmployeeByEmployeeId(String.valueOf(agricultureCostEmployee.getEmployeeId()));
            if (employee != null)
            {
                agricultureCostEmployee.setEmployeeName(employee.getEmployeeName());
            }
        }
        agricultureCostEmployee.setCreateTime(DateUtils.getNowDate());
        return agricultureCostEmployeeMapper.insertAgricultureCostEmployee(agricultureCostEmployee);
    }

    /**
     * 修改员工人工成本
     *
     * @param agricultureCostEmployee 员工人工成本
     * @return 结果
     */
    @Override
    public int updateAgricultureCostEmployee(AgricultureCostEmployee agricultureCostEmployee)
    {
        agricultureCostEmployee.setUpdateTime(DateUtils.getNowDate());
        return agricultureCostEmployeeMapper.updateAgricultureCostEmployee(agricultureCostEmployee);
    }

    /**
     * 批量删除员工人工成本
     *
     * @param costIds 需要删除的员工人工成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostEmployeeByCostIds(Long[] costIds)
    {
        return agricultureCostEmployeeMapper.deleteAgricultureCostEmployeeByCostIds(costIds);
    }

    /**
     * 删除员工人工成本信息
     *
     * @param costId 员工人工成本主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCostEmployeeByCostId(Long costId)
    {
        return agricultureCostEmployeeMapper.deleteAgricultureCostEmployeeByCostId(costId);
    }
}
