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
import com.ruoyi.system.domain.AgriculturePlantMethod;
import com.ruoyi.system.service.IAgriculturePlantMethodService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 种植方法Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/method")
public class AgriculturePlantMethodController extends BaseController
{
    @Autowired
    private IAgriculturePlantMethodService agriculturePlantMethodService;

    /**
     * 查询种植方法列表
     */
    @PreAuthorize("@ss.hasPermi('system:method:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgriculturePlantMethod agriculturePlantMethod)
    {
        startPage();
        List<AgriculturePlantMethod> list = agriculturePlantMethodService.selectAgriculturePlantMethodList(agriculturePlantMethod);
        return getDataTable(list);
    }

    /**
     * 导出种植方法列表
     */
    @PreAuthorize("@ss.hasPermi('system:method:export')")
    @Log(title = "种植方法", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgriculturePlantMethod agriculturePlantMethod)
    {
        List<AgriculturePlantMethod> list = agriculturePlantMethodService.selectAgriculturePlantMethodList(agriculturePlantMethod);
        ExcelUtil<AgriculturePlantMethod> util = new ExcelUtil<AgriculturePlantMethod>(AgriculturePlantMethod.class);
        util.exportExcel(response, list, "种植方法数据");
    }

    /**
     * 获取种植方法详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:method:query')")
    @GetMapping(value = "/{methodId}")
    public AjaxResult getInfo(@PathVariable("methodId") String methodId)
    {
        return success(agriculturePlantMethodService.selectAgriculturePlantMethodByMethodId(methodId));
    }

    /**
     * 新增种植方法
     */
    @PreAuthorize("@ss.hasPermi('system:method:add')")
    @Log(title = "种植方法", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgriculturePlantMethod agriculturePlantMethod)
    {
        return toAjax(agriculturePlantMethodService.insertAgriculturePlantMethod(agriculturePlantMethod));
    }

    /**
     * 修改种植方法
     */
    @PreAuthorize("@ss.hasPermi('system:method:edit')")
    @Log(title = "种植方法", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgriculturePlantMethod agriculturePlantMethod)
    {
        return toAjax(agriculturePlantMethodService.updateAgriculturePlantMethod(agriculturePlantMethod));
    }

    /**
     * 删除种植方法
     */
    @PreAuthorize("@ss.hasPermi('system:method:remove')")
    @Log(title = "种植方法", businessType = BusinessType.DELETE)
	@DeleteMapping("/{methodIds}")
    public AjaxResult remove(@PathVariable String[] methodIds)
    {
        return toAjax(agriculturePlantMethodService.deleteAgriculturePlantMethodByMethodIds(methodIds));
    }
}
