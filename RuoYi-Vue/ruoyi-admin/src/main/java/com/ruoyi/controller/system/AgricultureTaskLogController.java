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
import com.ruoyi.system.domain.AgricultureTaskLog;
import com.ruoyi.system.service.IAgricultureTaskLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务执行日志Controller
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@RestController
@RequestMapping("/system/taskLog")
public class AgricultureTaskLogController extends BaseController
{
    @Autowired
    private IAgricultureTaskLogService agricultureTaskLogService;

    /**
     * 查询任务执行日志列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureTaskLog agricultureTaskLog)
    {
        startPage();
        List<AgricultureTaskLog> list = agricultureTaskLogService.selectAgricultureTaskLogList(agricultureTaskLog);
        return getDataTable(list);
    }

    /**
     * 导出任务执行日志列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:export')")
    @Log(title = "任务执行日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureTaskLog agricultureTaskLog)
    {
        List<AgricultureTaskLog> list = agricultureTaskLogService.selectAgricultureTaskLogList(agricultureTaskLog);
        ExcelUtil<AgricultureTaskLog> util = new ExcelUtil<AgricultureTaskLog>(AgricultureTaskLog.class);
        util.exportExcel(response, list, "任务执行日志数据");
    }

    /**
     * 获取任务执行日志详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:query')")
    @GetMapping(value = "/{logId}")
    public AjaxResult getInfo(@PathVariable("logId") Long logId)
    {
        return success(agricultureTaskLogService.selectAgricultureTaskLogByLogId(logId));
    }

    /**
     * 新增任务执行日志
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:add')")
    @Log(title = "任务执行日志", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureTaskLog agricultureTaskLog)
    {
        return toAjax(agricultureTaskLogService.insertAgricultureTaskLog(agricultureTaskLog));
    }

    /**
     * 修改任务执行日志
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:edit')")
    @Log(title = "任务执行日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureTaskLog agricultureTaskLog)
    {
        return toAjax(agricultureTaskLogService.updateAgricultureTaskLog(agricultureTaskLog));
    }

    /**
     * 删除任务执行日志
     */
    @PreAuthorize("@ss.hasPermi('system:taskLog:remove')")
    @Log(title = "任务执行日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{logIds}")
    public AjaxResult remove(@PathVariable Long[] logIds)
    {
        return toAjax(agricultureTaskLogService.deleteAgricultureTaskLogByLogIds(logIds));
    }
}
