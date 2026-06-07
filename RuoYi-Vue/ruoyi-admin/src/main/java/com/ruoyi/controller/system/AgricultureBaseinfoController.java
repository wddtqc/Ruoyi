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
import com.ruoyi.system.domain.AgricultureBaseinfo;
import com.ruoyi.system.service.IAgricultureBaseinfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 基地信息Controller
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@RestController
@RequestMapping("/system/baseinfo")
public class AgricultureBaseinfoController extends BaseController
{
    @Autowired
    private IAgricultureBaseinfoService agricultureBaseinfoService;

    /**
     * 查询基地信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureBaseinfo agricultureBaseinfo)
    {
        startPage();
        List<AgricultureBaseinfo> list = agricultureBaseinfoService.selectAgricultureBaseinfoList(agricultureBaseinfo);
        return getDataTable(list);
    }

    /**
     * 导出基地信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:export')")
    @Log(title = "基地信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureBaseinfo agricultureBaseinfo)
    {
        List<AgricultureBaseinfo> list = agricultureBaseinfoService.selectAgricultureBaseinfoList(agricultureBaseinfo);
        ExcelUtil<AgricultureBaseinfo> util = new ExcelUtil<AgricultureBaseinfo>(AgricultureBaseinfo.class);
        util.exportExcel(response, list, "基地信息数据");
    }

    /**
     * 获取基地信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:query')")
    @GetMapping(value = "/{baseId}")
    public AjaxResult getInfo(@PathVariable("baseId") String baseId)
    {
        return success(agricultureBaseinfoService.selectAgricultureBaseinfoByBaseId(baseId));
    }

    /**
     * 新增基地信息
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:add')")
    @Log(title = "基地信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureBaseinfo agricultureBaseinfo)
    {
        return toAjax(agricultureBaseinfoService.insertAgricultureBaseinfo(agricultureBaseinfo));
    }

    /**
     * 修改基地信息
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:edit')")
    @Log(title = "基地信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureBaseinfo agricultureBaseinfo)
    {
        return toAjax(agricultureBaseinfoService.updateAgricultureBaseinfo(agricultureBaseinfo));
    }

    /**
     * 删除基地信息
     */
    @PreAuthorize("@ss.hasPermi('system:baseinfo:remove')")
    @Log(title = "基地信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{baseIds}")
    public AjaxResult remove(@PathVariable String[] baseIds)
    {
        return toAjax(agricultureBaseinfoService.deleteAgricultureBaseinfoByBaseIds(baseIds));
    }
}
