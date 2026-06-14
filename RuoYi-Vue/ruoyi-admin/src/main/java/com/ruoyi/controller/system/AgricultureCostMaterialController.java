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
import com.ruoyi.system.domain.AgricultureCostMaterial;
import com.ruoyi.system.service.IAgricultureCostMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农资物料成本Controller
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@RestController
@RequestMapping("/system/costMaterial")
public class AgricultureCostMaterialController extends BaseController
{
    @Autowired
    private IAgricultureCostMaterialService agricultureCostMaterialService;

    /**
     * 查询农资物料成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureCostMaterial agricultureCostMaterial)
    {
        startPage();
        List<AgricultureCostMaterial> list = agricultureCostMaterialService.selectAgricultureCostMaterialList(agricultureCostMaterial);
        return getDataTable(list);
    }

    /**
     * 导出农资物料成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:export')")
    @Log(title = "农资物料成本", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureCostMaterial agricultureCostMaterial)
    {
        List<AgricultureCostMaterial> list = agricultureCostMaterialService.selectAgricultureCostMaterialList(agricultureCostMaterial);
        ExcelUtil<AgricultureCostMaterial> util = new ExcelUtil<AgricultureCostMaterial>(AgricultureCostMaterial.class);
        util.exportExcel(response, list, "农资物料成本数据");
    }

    /**
     * 获取农资物料成本详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:query')")
    @GetMapping(value = "/{costId}")
    public AjaxResult getInfo(@PathVariable("costId") Long costId)
    {
        return success(agricultureCostMaterialService.selectAgricultureCostMaterialByCostId(costId));
    }

    /**
     * 新增农资物料成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:add')")
    @Log(title = "农资物料成本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureCostMaterial agricultureCostMaterial)
    {
        return toAjax(agricultureCostMaterialService.insertAgricultureCostMaterial(agricultureCostMaterial));
    }

    /**
     * 修改农资物料成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:edit')")
    @Log(title = "农资物料成本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureCostMaterial agricultureCostMaterial)
    {
        return toAjax(agricultureCostMaterialService.updateAgricultureCostMaterial(agricultureCostMaterial));
    }

    /**
     * 删除农资物料成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMaterial:remove')")
    @Log(title = "农资物料成本", businessType = BusinessType.DELETE)
    @DeleteMapping("/{costIds}")
    public AjaxResult remove(@PathVariable Long[] costIds)
    {
        return toAjax(agricultureCostMaterialService.deleteAgricultureCostMaterialByCostIds(costIds));
    }
}
