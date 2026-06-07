package com.ruoyi.iot.controller;

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
import com.ruoyi.iot.domain.IotCategory;
import com.ruoyi.iot.service.IIotCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品分类Controller
 * 
 * @author ruoyi
 * @date 2026-06-05
 */
@RestController
@RequestMapping("/iot/category")
public class IotCategoryController extends BaseController
{
    @Autowired
    private IIotCategoryService iotCategoryService;

    /**
     * 查询产品分类列表
     */
    @PreAuthorize("@ss.hasPermi('iot:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotCategory iotCategory)
    {
        startPage();
        List<IotCategory> list = iotCategoryService.selectIotCategoryList(iotCategory);
        return getDataTable(list);
    }

    /**
     * 查询产品分类简短列表（用于下拉选择）
     */
    @PreAuthorize("@ss.hasPermi('iot:category:list')")
    @GetMapping("/shortList")
    public AjaxResult shortList()
    {
        IotCategory iotCategory = new IotCategory();
        List<IotCategory> list = iotCategoryService.selectIotCategoryList(iotCategory);
        return success(list);
    }

    /**
     * 导出产品分类列表
     */
    @PreAuthorize("@ss.hasPermi('iot:category:export')")
    @Log(title = "产品分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, IotCategory iotCategory)
    {
        List<IotCategory> list = iotCategoryService.selectIotCategoryList(iotCategory);
        ExcelUtil<IotCategory> util = new ExcelUtil<IotCategory>(IotCategory.class);
        util.exportExcel(response, list, "产品分类数据");
    }

    /**
     * 获取产品分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:category:query')")
    @GetMapping(value = "/{categoryId}")
    public AjaxResult getInfo(@PathVariable("categoryId") Long categoryId)
    {
        return success(iotCategoryService.selectIotCategoryByCategoryId(categoryId));
    }

    /**
     * 新增产品分类
     */
    @PreAuthorize("@ss.hasPermi('iot:category:add')")
    @Log(title = "产品分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotCategory iotCategory)
    {
        return toAjax(iotCategoryService.insertIotCategory(iotCategory));
    }

    /**
     * 修改产品分类
     */
    @PreAuthorize("@ss.hasPermi('iot:category:edit')")
    @Log(title = "产品分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotCategory iotCategory)
    {
        return toAjax(iotCategoryService.updateIotCategory(iotCategory));
    }

    /**
     * 删除产品分类
     */
    @PreAuthorize("@ss.hasPermi('iot:category:remove')")
    @Log(title = "产品分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{categoryIds}")
    public AjaxResult remove(@PathVariable Long[] categoryIds)
    {
        return toAjax(iotCategoryService.deleteIotCategoryByCategoryIds(categoryIds));
    }
}
