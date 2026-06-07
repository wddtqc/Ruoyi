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
import com.ruoyi.system.domain.AgricultureMachineType;
import com.ruoyi.system.service.IAgricultureMachineTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 机械类别Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/machine/type")
public class AgricultureMachineTypeController extends BaseController
{
    @Autowired
    private IAgricultureMachineTypeService agricultureMachineTypeService;

    /**
     * 查询机械类别列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureMachineType agricultureMachineType)
    {
        startPage();
        List<AgricultureMachineType> list = agricultureMachineTypeService.selectAgricultureMachineTypeList(agricultureMachineType);
        return getDataTable(list);
    }

    /**
     * 导出机械类别列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:export')")
    @Log(title = "机械类别", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureMachineType agricultureMachineType)
    {
        List<AgricultureMachineType> list = agricultureMachineTypeService.selectAgricultureMachineTypeList(agricultureMachineType);
        ExcelUtil<AgricultureMachineType> util = new ExcelUtil<AgricultureMachineType>(AgricultureMachineType.class);
        util.exportExcel(response, list, "机械类别数据");
    }

    /**
     * 获取机械类别详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:type:query')")
    @GetMapping(value = "/{machineTypeId}")
    public AjaxResult getInfo(@PathVariable("machineTypeId") String machineTypeId)
    {
        return success(agricultureMachineTypeService.selectAgricultureMachineTypeByMachineTypeId(machineTypeId));
    }

    /**
     * 新增机械类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:add')")
    @Log(title = "机械类别", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureMachineType agricultureMachineType)
    {
        return toAjax(agricultureMachineTypeService.insertAgricultureMachineType(agricultureMachineType));
    }

    /**
     * 修改机械类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:edit')")
    @Log(title = "机械类别", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureMachineType agricultureMachineType)
    {
        return toAjax(agricultureMachineTypeService.updateAgricultureMachineType(agricultureMachineType));
    }

    /**
     * 删除机械类别
     */
    @PreAuthorize("@ss.hasPermi('system:type:remove')")
    @Log(title = "机械类别", businessType = BusinessType.DELETE)
	@DeleteMapping("/{machineTypeIds}")
    public AjaxResult remove(@PathVariable String[] machineTypeIds)
    {
        return toAjax(agricultureMachineTypeService.deleteAgricultureMachineTypeByMachineTypeIds(machineTypeIds));
    }
}
