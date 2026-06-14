package com.ruoyi.controller.system;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.AgricultureCostEmployee;
import com.ruoyi.system.service.IAgricultureCostEmployeeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 员工人工成本Controller
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@RestController
@RequestMapping("/system/costEmployee")
public class AgricultureCostEmployeeController extends BaseController
{
    @Autowired
    private IAgricultureCostEmployeeService agricultureCostEmployeeService;

    /**
     * 查询员工人工成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureCostEmployee agricultureCostEmployee)
    {
        startPage();
        List<AgricultureCostEmployee> list = agricultureCostEmployeeService.selectAgricultureCostEmployeeList(agricultureCostEmployee);
        return getDataTable(list);
    }

    /**
     * 导出员工人工成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:export')")
    @Log(title = "员工人工成本", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureCostEmployee agricultureCostEmployee)
    {
        List<AgricultureCostEmployee> list = agricultureCostEmployeeService.selectAgricultureCostEmployeeList(agricultureCostEmployee);
        ExcelUtil<AgricultureCostEmployee> util = new ExcelUtil<AgricultureCostEmployee>(AgricultureCostEmployee.class);
        util.exportExcel(response, list, "员工人工成本数据");
    }

    /**
     * 获取员工人工成本详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:query')")
    @GetMapping(value = "/{costId}")
    public AjaxResult getInfo(@PathVariable("costId") Long costId)
    {
        return success(agricultureCostEmployeeService.selectAgricultureCostEmployeeByCostId(costId));
    }

    /**
     * 新增员工人工成本
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:add')")
    @Log(title = "员工人工成本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureCostEmployee agricultureCostEmployee)
    {
        return toAjax(agricultureCostEmployeeService.insertAgricultureCostEmployee(agricultureCostEmployee));
    }

    /**
     * 修改员工人工成本
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:edit')")
    @Log(title = "员工人工成本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureCostEmployee agricultureCostEmployee)
    {
        return toAjax(agricultureCostEmployeeService.updateAgricultureCostEmployee(agricultureCostEmployee));
    }

    /**
     * 删除员工人工成本
     */
    @PreAuthorize("@ss.hasPermi('system:costEmployee:remove')")
    @Log(title = "员工人工成本", businessType = BusinessType.DELETE)
    @DeleteMapping("/{costIds}")
    public AjaxResult remove(@PathVariable Long[] costIds)
    {
        return toAjax(agricultureCostEmployeeService.deleteAgricultureCostEmployeeByCostIds(costIds));
    }
}
