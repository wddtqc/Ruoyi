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
import com.ruoyi.system.domain.AgricultureLand;
import com.ruoyi.system.service.IAgricultureLandService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 地块Controller
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@RestController
@RequestMapping("/system/land")
public class AgricultureLandController extends BaseController
{
    @Autowired
    private IAgricultureLandService agricultureLandService;

    /**
     * 查询地块列表
     */
    @PreAuthorize("@ss.hasPermi('system:land:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureLand agricultureLand)
    {
        startPage();
        List<AgricultureLand> list = agricultureLandService.selectAgricultureLandList(agricultureLand);
        return getDataTable(list);
    }

    /**
     * 导出地块列表
     */
    @PreAuthorize("@ss.hasPermi('system:land:export')")
    @Log(title = "地块", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureLand agricultureLand)
    {
        List<AgricultureLand> list = agricultureLandService.selectAgricultureLandList(agricultureLand);
        ExcelUtil<AgricultureLand> util = new ExcelUtil<AgricultureLand>(AgricultureLand.class);
        util.exportExcel(response, list, "地块数据");
    }

    /**
     * 获取地块详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:land:query')")
    @GetMapping(value = "/{landId}")
    public AjaxResult getInfo(@PathVariable("landId") String landId)
    {
        return success(agricultureLandService.selectAgricultureLandByLandId(landId));
    }

    /**
     * 新增地块
     */
    @PreAuthorize("@ss.hasPermi('system:land:add')")
    @Log(title = "地块", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureLand agricultureLand)
    {
        return toAjax(agricultureLandService.insertAgricultureLand(agricultureLand));
    }

    /**
     * 修改地块
     */
    @PreAuthorize("@ss.hasPermi('system:land:edit')")
    @Log(title = "地块", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureLand agricultureLand)
    {
        return toAjax(agricultureLandService.updateAgricultureLand(agricultureLand));
    }

    /**
     * 删除地块
     */
    @PreAuthorize("@ss.hasPermi('system:land:remove')")
    @Log(title = "地块", businessType = BusinessType.DELETE)
	@DeleteMapping("/{landIds}")
    public AjaxResult remove(@PathVariable String[] landIds)
    {
        return toAjax(agricultureLandService.deleteAgricultureLandByLandIds(landIds));
    }
}
