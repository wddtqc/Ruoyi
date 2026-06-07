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
import com.ruoyi.system.domain.AgricultureMachineInfo;
import com.ruoyi.system.service.IAgricultureMachineInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 机械信息Controller
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@RestController
@RequestMapping("/system/machine")
public class AgricultureMachineInfoController extends BaseController
{
    @Autowired
    private IAgricultureMachineInfoService agricultureMachineInfoService;

    /**
     * 查询机械信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureMachineInfo agricultureMachineInfo)
    {
        startPage();
        List<AgricultureMachineInfo> list = agricultureMachineInfoService.selectAgricultureMachineInfoList(agricultureMachineInfo);
        return getDataTable(list);
    }

    /**
     * 导出机械信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "机械信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureMachineInfo agricultureMachineInfo)
    {
        List<AgricultureMachineInfo> list = agricultureMachineInfoService.selectAgricultureMachineInfoList(agricultureMachineInfo);
        ExcelUtil<AgricultureMachineInfo> util = new ExcelUtil<AgricultureMachineInfo>(AgricultureMachineInfo.class);
        util.exportExcel(response, list, "机械信息数据");
    }

    /**
     * 获取机械信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{machineId}")
    public AjaxResult getInfo(@PathVariable("machineId") String machineId)
    {
        return success(agricultureMachineInfoService.selectAgricultureMachineInfoByMachineId(machineId));
    }

    /**
     * 新增机械信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "机械信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureMachineInfo agricultureMachineInfo)
    {
        return toAjax(agricultureMachineInfoService.insertAgricultureMachineInfo(agricultureMachineInfo));
    }

    /**
     * 修改机械信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "机械信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureMachineInfo agricultureMachineInfo)
    {
        return toAjax(agricultureMachineInfoService.updateAgricultureMachineInfo(agricultureMachineInfo));
    }

    /**
     * 删除机械信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "机械信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{machineIds}")
    public AjaxResult remove(@PathVariable String[] machineIds)
    {
        return toAjax(agricultureMachineInfoService.deleteAgricultureMachineInfoByMachineIds(machineIds));
    }
}
