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
import com.ruoyi.system.domain.AgricultureTaskEmployee;
import com.ruoyi.system.service.IAgricultureTaskEmployeeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务分配员工Controller
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@RestController
@RequestMapping("/system/taskEmployee")
public class AgricultureTaskEmployeeController extends BaseController
{
    @Autowired
    private IAgricultureTaskEmployeeService agricultureTaskEmployeeService;

    /**
     * 查询任务分配员工列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureTaskEmployee agricultureTaskEmployee)
    {
        startPage();
        List<AgricultureTaskEmployee> list = agricultureTaskEmployeeService.selectAgricultureTaskEmployeeList(agricultureTaskEmployee);
        return getDataTable(list);
    }

    /**
     * 导出任务分配员工列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:export')")
    @Log(title = "任务分配员工", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureTaskEmployee agricultureTaskEmployee)
    {
        List<AgricultureTaskEmployee> list = agricultureTaskEmployeeService.selectAgricultureTaskEmployeeList(agricultureTaskEmployee);
        ExcelUtil<AgricultureTaskEmployee> util = new ExcelUtil<AgricultureTaskEmployee>(AgricultureTaskEmployee.class);
        util.exportExcel(response, list, "任务分配员工数据");
    }

    /**
     * 获取任务分配员工详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:query')")
    @GetMapping(value = "/{assignId}")
    public AjaxResult getInfo(@PathVariable("assignId") Long assignId)
    {
        return success(agricultureTaskEmployeeService.selectAgricultureTaskEmployeeByAssignId(assignId));
    }

    /**
     * 新增任务分配员工
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:add')")
    @Log(title = "任务分配员工", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureTaskEmployee agricultureTaskEmployee)
    {
        return toAjax(agricultureTaskEmployeeService.insertAgricultureTaskEmployee(agricultureTaskEmployee));
    }

    /**
     * 修改任务分配员工
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:edit')")
    @Log(title = "任务分配员工", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureTaskEmployee agricultureTaskEmployee)
    {
        return toAjax(agricultureTaskEmployeeService.updateAgricultureTaskEmployee(agricultureTaskEmployee));
    }

    /**
     * 删除任务分配员工
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:remove')")
    @Log(title = "任务分配员工", businessType = BusinessType.DELETE)
    @DeleteMapping("/{assignIds}")
    public AjaxResult remove(@PathVariable Long[] assignIds)
    {
        return toAjax(agricultureTaskEmployeeService.deleteAgricultureTaskEmployeeByAssignIds(assignIds));
    }

    /**
     * 根据任务ID和员工ID删除任务分配员工
     */
    @PreAuthorize("@ss.hasPermi('system:taskEmployee:remove')")
    @Log(title = "任务分配员工", businessType = BusinessType.DELETE)
    @DeleteMapping("/{taskId}/{employeeId}")
    public AjaxResult removeByTaskIdAndEmployeeId(@PathVariable Long taskId, @PathVariable Long employeeId)
    {
        return toAjax(agricultureTaskEmployeeService.deleteAgricultureTaskEmployeeByTaskIdAndEmployeeId(taskId, employeeId));
    }
}
