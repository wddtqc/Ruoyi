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
import com.ruoyi.system.domain.AgricultureCropBatch;
import com.ruoyi.system.service.IAgricultureCropBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作物批次Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/batch")
public class AgricultureCropBatchController extends BaseController
{
    @Autowired
    private IAgricultureCropBatchService agricultureCropBatchService;

    /**
     * 查询作物批次列表
     */
    @PreAuthorize("@ss.hasPermi('system:batch:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureCropBatch agricultureCropBatch)
    {
        startPage();
        List<AgricultureCropBatch> list = agricultureCropBatchService.selectAgricultureCropBatchList(agricultureCropBatch);
        return getDataTable(list);
    }

    /**
     * 导出作物批次列表
     */
    @PreAuthorize("@ss.hasPermi('system:batch:export')")
    @Log(title = "作物批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureCropBatch agricultureCropBatch)
    {
        List<AgricultureCropBatch> list = agricultureCropBatchService.selectAgricultureCropBatchList(agricultureCropBatch);
        ExcelUtil<AgricultureCropBatch> util = new ExcelUtil<AgricultureCropBatch>(AgricultureCropBatch.class);
        util.exportExcel(response, list, "作物批次数据");
    }

    /**
     * 获取作物批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:batch:query')")
    @GetMapping(value = "/{batchId}")
    public AjaxResult getInfo(@PathVariable("batchId") String batchId)
    {
        return success(agricultureCropBatchService.selectAgricultureCropBatchByBatchId(batchId));
    }

    /**
     * 新增作物批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:add')")
    @Log(title = "作物批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureCropBatch agricultureCropBatch)
    {
        return toAjax(agricultureCropBatchService.insertAgricultureCropBatch(agricultureCropBatch));
    }

    /**
     * 修改作物批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:edit')")
    @Log(title = "作物批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureCropBatch agricultureCropBatch)
    {
        return toAjax(agricultureCropBatchService.updateAgricultureCropBatch(agricultureCropBatch));
    }

    /**
     * 删除作物批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:remove')")
    @Log(title = "作物批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{batchIds}")
    public AjaxResult remove(@PathVariable String[] batchIds)
    {
        return toAjax(agricultureCropBatchService.deleteAgricultureCropBatchByBatchIds(batchIds));
    }
}
