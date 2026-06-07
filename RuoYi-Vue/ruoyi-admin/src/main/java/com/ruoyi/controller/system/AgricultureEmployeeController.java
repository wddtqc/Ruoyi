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
import com.ruoyi.system.domain.AgricultureEmployee;
import com.ruoyi.system.service.IAgricultureEmployeeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 雇员Controller
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@RestController
@RequestMapping("/system/employee")
public class AgricultureEmployeeController extends BaseController
{
    @Autowired
    private IAgricultureEmployeeService agricultureEmployeeService;

    /**
     * 查询雇员列表
     */
    @PreAuthorize("@ss.hasPermi('system:employee:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureEmployee agricultureEmployee)
    {
        startPage();
        List<AgricultureEmployee> list = agricultureEmployeeService.selectAgricultureEmployeeList(agricultureEmployee);
        return getDataTable(list);
    }

    /**
     * 导出雇员列表
     */
    @PreAuthorize("@ss.hasPermi('system:employee:export')")
    @Log(title = "雇员", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureEmployee agricultureEmployee)
    {
        List<AgricultureEmployee> list = agricultureEmployeeService.selectAgricultureEmployeeList(agricultureEmployee);
        ExcelUtil<AgricultureEmployee> util = new ExcelUtil<AgricultureEmployee>(AgricultureEmployee.class);
        util.exportExcel(response, list, "雇员数据");
    }

    /**
     * 获取雇员详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:employee:query')")
    @GetMapping(value = "/{employeeId}")
    public AjaxResult getInfo(@PathVariable("employeeId") String employeeId)
    {
        return success(agricultureEmployeeService.selectAgricultureEmployeeByEmployeeId(employeeId));
    }

    /**
     * 新增雇员
     */
    @PreAuthorize("@ss.hasPermi('system:employee:add')")
    @Log(title = "雇员", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureEmployee agricultureEmployee)
    {
        return toAjax(agricultureEmployeeService.insertAgricultureEmployee(agricultureEmployee));
    }

    /**
     * 修改雇员
     */
    @PreAuthorize("@ss.hasPermi('system:employee:edit')")
    @Log(title = "雇员", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureEmployee agricultureEmployee)
    {
        return toAjax(agricultureEmployeeService.updateAgricultureEmployee(agricultureEmployee));
    }

    /**
     * 删除雇员
     */
    @PreAuthorize("@ss.hasPermi('system:employee:remove')")
    @Log(title = "雇员", businessType = BusinessType.DELETE)
	@DeleteMapping("/{employeeIds}")
    public AjaxResult remove(@PathVariable String[] employeeIds)
    {
        return toAjax(agricultureEmployeeService.deleteAgricultureEmployeeByEmployeeIds(employeeIds));
    }
}
