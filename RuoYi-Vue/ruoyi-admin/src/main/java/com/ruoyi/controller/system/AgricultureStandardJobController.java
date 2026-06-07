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
import com.ruoyi.system.domain.AgricultureStandardJob;
import com.ruoyi.system.service.IAgricultureStandardJobService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 标准作业任务Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/job")
public class AgricultureStandardJobController extends BaseController
{
    @Autowired
    private IAgricultureStandardJobService agricultureStandardJobService;

    /**
     * 查询标准作业任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:job:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureStandardJob agricultureStandardJob)
    {
        startPage();
        List<AgricultureStandardJob> list = agricultureStandardJobService.selectAgricultureStandardJobList(agricultureStandardJob);
        return getDataTable(list);
    }

    /**
     * 导出标准作业任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:job:export')")
    @Log(title = "标准作业任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureStandardJob agricultureStandardJob)
    {
        List<AgricultureStandardJob> list = agricultureStandardJobService.selectAgricultureStandardJobList(agricultureStandardJob);
        ExcelUtil<AgricultureStandardJob> util = new ExcelUtil<AgricultureStandardJob>(AgricultureStandardJob.class);
        util.exportExcel(response, list, "标准作业任务数据");
    }

    /**
     * 获取标准作业任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:job:query')")
    @GetMapping(value = "/{jobId}")
    public AjaxResult getInfo(@PathVariable("jobId") String jobId)
    {
        return success(agricultureStandardJobService.selectAgricultureStandardJobByJobId(jobId));
    }

    /**
     * 新增标准作业任务
     */
    @PreAuthorize("@ss.hasPermi('system:job:add')")
    @Log(title = "标准作业任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureStandardJob agricultureStandardJob)
    {
        return toAjax(agricultureStandardJobService.insertAgricultureStandardJob(agricultureStandardJob));
    }

    /**
     * 修改标准作业任务
     */
    @PreAuthorize("@ss.hasPermi('system:job:edit')")
    @Log(title = "标准作业任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureStandardJob agricultureStandardJob)
    {
        return toAjax(agricultureStandardJobService.updateAgricultureStandardJob(agricultureStandardJob));
    }

    /**
     * 删除标准作业任务
     */
    @PreAuthorize("@ss.hasPermi('system:job:remove')")
    @Log(title = "标准作业任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{jobIds}")
    public AjaxResult remove(@PathVariable String[] jobIds)
    {
        return toAjax(agricultureStandardJobService.deleteAgricultureStandardJobByJobIds(jobIds));
    }
}
