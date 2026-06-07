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
import com.ruoyi.system.domain.AgricultureMaterialInfo;
import com.ruoyi.system.service.IAgricultureMaterialInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农资信息Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/material")
public class AgricultureMaterialInfoController extends BaseController
{
    @Autowired
    private IAgricultureMaterialInfoService agricultureMaterialInfoService;

    /**
     * 查询农资信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureMaterialInfo agricultureMaterialInfo)
    {
        startPage();
        List<AgricultureMaterialInfo> list = agricultureMaterialInfoService.selectAgricultureMaterialInfoList(agricultureMaterialInfo);
        return getDataTable(list);
    }

    /**
     * 导出农资信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "农资信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureMaterialInfo agricultureMaterialInfo)
    {
        List<AgricultureMaterialInfo> list = agricultureMaterialInfoService.selectAgricultureMaterialInfoList(agricultureMaterialInfo);
        ExcelUtil<AgricultureMaterialInfo> util = new ExcelUtil<AgricultureMaterialInfo>(AgricultureMaterialInfo.class);
        util.exportExcel(response, list, "农资信息数据");
    }

    /**
     * 获取农资信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{materialId}")
    public AjaxResult getInfo(@PathVariable("materialId") String materialId)
    {
        return success(agricultureMaterialInfoService.selectAgricultureMaterialInfoByMaterialId(materialId));
    }

    /**
     * 新增农资信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "农资信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureMaterialInfo agricultureMaterialInfo)
    {
        return toAjax(agricultureMaterialInfoService.insertAgricultureMaterialInfo(agricultureMaterialInfo));
    }

    /**
     * 修改农资信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "农资信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureMaterialInfo agricultureMaterialInfo)
    {
        return toAjax(agricultureMaterialInfoService.updateAgricultureMaterialInfo(agricultureMaterialInfo));
    }

    /**
     * 删除农资信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "农资信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public AjaxResult remove(@PathVariable String[] materialIds)
    {
        return toAjax(agricultureMaterialInfoService.deleteAgricultureMaterialInfoByMaterialIds(materialIds));
    }
}
