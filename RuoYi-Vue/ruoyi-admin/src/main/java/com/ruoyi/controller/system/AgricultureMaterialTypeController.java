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
import com.ruoyi.system.domain.AgricultureMaterialType;
import com.ruoyi.system.service.IAgricultureMaterialTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农资类别Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/material/type")
public class AgricultureMaterialTypeController extends BaseController
{
    @Autowired
    private IAgricultureMaterialTypeService agricultureMaterialTypeService;

    /**
     * 查询农资类别列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureMaterialType agricultureMaterialType)
    {
        startPage();
        List<AgricultureMaterialType> list = agricultureMaterialTypeService.selectAgricultureMaterialTypeList(agricultureMaterialType);
        return getDataTable(list);
    }

    /**
     * 导出农资类别列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:export')")
    @Log(title = "农资类别", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureMaterialType agricultureMaterialType)
    {
        List<AgricultureMaterialType> list = agricultureMaterialTypeService.selectAgricultureMaterialTypeList(agricultureMaterialType);
        ExcelUtil<AgricultureMaterialType> util = new ExcelUtil<AgricultureMaterialType>(AgricultureMaterialType.class);
        util.exportExcel(response, list, "农资类别数据");
    }

    /**
     * 获取农资类别详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:type:query')")
    @GetMapping(value = "/{materialTypeId}")
    public AjaxResult getInfo(@PathVariable("materialTypeId") String materialTypeId)
    {
        return success(agricultureMaterialTypeService.selectAgricultureMaterialTypeByMaterialTypeId(materialTypeId));
    }

    /**
     * 新增农资类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:add')")
    @Log(title = "农资类别", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureMaterialType agricultureMaterialType)
    {
        return toAjax(agricultureMaterialTypeService.insertAgricultureMaterialType(agricultureMaterialType));
    }

    /**
     * 修改农资类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:edit')")
    @Log(title = "农资类别", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureMaterialType agricultureMaterialType)
    {
        return toAjax(agricultureMaterialTypeService.updateAgricultureMaterialType(agricultureMaterialType));
    }

    /**
     * 删除农资类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:remove')")
    @Log(title = "农资类别", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialTypeIds}")
    public AjaxResult remove(@PathVariable String[] materialTypeIds)
    {
        return toAjax(agricultureMaterialTypeService.deleteAgricultureMaterialTypeByMaterialTypeIds(materialTypeIds));
    }
}
