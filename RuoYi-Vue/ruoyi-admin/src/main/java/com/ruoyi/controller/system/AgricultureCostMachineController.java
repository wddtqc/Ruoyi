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
import com.ruoyi.system.domain.AgricultureCostMachine;
import com.ruoyi.system.service.IAgricultureCostMachineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农事机械成本Controller
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@RestController
@RequestMapping("/system/costMachine")
public class AgricultureCostMachineController extends BaseController
{
    @Autowired
    private IAgricultureCostMachineService agricultureCostMachineService;

    /**
     * 查询农事机械成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureCostMachine agricultureCostMachine)
    {
        startPage();
        List<AgricultureCostMachine> list = agricultureCostMachineService.selectAgricultureCostMachineList(agricultureCostMachine);
        return getDataTable(list);
    }

    /**
     * 导出农事机械成本列表
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:export')")
    @Log(title = "农事机械成本", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureCostMachine agricultureCostMachine)
    {
        List<AgricultureCostMachine> list = agricultureCostMachineService.selectAgricultureCostMachineList(agricultureCostMachine);
        ExcelUtil<AgricultureCostMachine> util = new ExcelUtil<AgricultureCostMachine>(AgricultureCostMachine.class);
        util.exportExcel(response, list, "农事机械成本数据");
    }

    /**
     * 获取农事机械成本详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:query')")
    @GetMapping(value = "/{costId}")
    public AjaxResult getInfo(@PathVariable("costId") Long costId)
    {
        return success(agricultureCostMachineService.selectAgricultureCostMachineByCostId(costId));
    }

    /**
     * 新增农事机械成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:add')")
    @Log(title = "农事机械成本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureCostMachine agricultureCostMachine)
    {
        return toAjax(agricultureCostMachineService.insertAgricultureCostMachine(agricultureCostMachine));
    }

    /**
     * 修改农事机械成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:edit')")
    @Log(title = "农事机械成本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureCostMachine agricultureCostMachine)
    {
        return toAjax(agricultureCostMachineService.updateAgricultureCostMachine(agricultureCostMachine));
    }

    /**
     * 删除农事机械成本
     */
    @PreAuthorize("@ss.hasPermi('system:costMachine:remove')")
    @Log(title = "农事机械成本", businessType = BusinessType.DELETE)
    @DeleteMapping("/{costIds}")
    public AjaxResult remove(@PathVariable Long[] costIds)
    {
        return toAjax(agricultureCostMachineService.deleteAgricultureCostMachineByCostIds(costIds));
    }
}
