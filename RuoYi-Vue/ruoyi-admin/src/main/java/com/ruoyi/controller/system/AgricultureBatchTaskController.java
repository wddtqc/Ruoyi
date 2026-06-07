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
import com.ruoyi.system.domain.AgricultureBatchTask;
import com.ruoyi.system.service.IAgricultureBatchTaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 批次任务Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/task")
public class AgricultureBatchTaskController extends BaseController
{
    @Autowired
    private IAgricultureBatchTaskService agricultureBatchTaskService;

    /**
     * 查询批次任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureBatchTask agricultureBatchTask)
    {
        startPage();
        List<AgricultureBatchTask> list = agricultureBatchTaskService.selectAgricultureBatchTaskList(agricultureBatchTask);
        return getDataTable(list);
    }

    /**
     * 导出批次任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:task:export')")
    @Log(title = "批次任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureBatchTask agricultureBatchTask)
    {
        List<AgricultureBatchTask> list = agricultureBatchTaskService.selectAgricultureBatchTaskList(agricultureBatchTask);
        ExcelUtil<AgricultureBatchTask> util = new ExcelUtil<AgricultureBatchTask>(AgricultureBatchTask.class);
        util.exportExcel(response, list, "批次任务数据");
    }

    /**
     * 获取批次任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:task:query')")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") String taskId)
    {
        return success(agricultureBatchTaskService.selectAgricultureBatchTaskByTaskId(taskId));
    }

    /**
     * 新增批次任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:add')")
    @Log(title = "批次任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureBatchTask agricultureBatchTask)
    {
        return toAjax(agricultureBatchTaskService.insertAgricultureBatchTask(agricultureBatchTask));
    }

    /**
     * 修改批次任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:edit')")
    @Log(title = "批次任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureBatchTask agricultureBatchTask)
    {
        return toAjax(agricultureBatchTaskService.updateAgricultureBatchTask(agricultureBatchTask));
    }

    /**
     * 删除批次任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:remove')")
    @Log(title = "批次任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable String[] taskIds)
    {
        return toAjax(agricultureBatchTaskService.deleteAgricultureBatchTaskByTaskIds(taskIds));
    }
}
