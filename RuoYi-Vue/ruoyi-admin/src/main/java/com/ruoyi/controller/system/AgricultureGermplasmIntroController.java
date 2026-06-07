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
import com.ruoyi.system.domain.AgricultureGermplasmIntro;
import com.ruoyi.system.service.IAgricultureGermplasmIntroService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 种质介绍Controller
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@RestController
@RequestMapping("/system/intro")
public class AgricultureGermplasmIntroController extends BaseController
{
    @Autowired
    private IAgricultureGermplasmIntroService agricultureGermplasmIntroService;

    /**
     * 查询种质介绍列表
     */
    @PreAuthorize("@ss.hasPermi('system:intro:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        startPage();
        List<AgricultureGermplasmIntro> list = agricultureGermplasmIntroService.selectAgricultureGermplasmIntroList(agricultureGermplasmIntro);
        return getDataTable(list);
    }

    /**
     * 导出种质介绍列表
     */
    @PreAuthorize("@ss.hasPermi('system:intro:export')")
    @Log(title = "种质介绍", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        List<AgricultureGermplasmIntro> list = agricultureGermplasmIntroService.selectAgricultureGermplasmIntroList(agricultureGermplasmIntro);
        ExcelUtil<AgricultureGermplasmIntro> util = new ExcelUtil<AgricultureGermplasmIntro>(AgricultureGermplasmIntro.class);
        util.exportExcel(response, list, "种质介绍数据");
    }

    /**
     * 获取种质介绍详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:intro:query')")
    @GetMapping(value = "/{introId}")
    public AjaxResult getInfo(@PathVariable("introId") String introId)
    {
        return success(agricultureGermplasmIntroService.selectAgricultureGermplasmIntroByIntroId(introId));
    }

    /**
     * 新增种质介绍
     */
    @PreAuthorize("@ss.hasPermi('system:intro:add')")
    @Log(title = "种质介绍", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        return toAjax(agricultureGermplasmIntroService.insertAgricultureGermplasmIntro(agricultureGermplasmIntro));
    }

    /**
     * 修改种质介绍
     */
    @PreAuthorize("@ss.hasPermi('system:intro:edit')")
    @Log(title = "种质介绍", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        return toAjax(agricultureGermplasmIntroService.updateAgricultureGermplasmIntro(agricultureGermplasmIntro));
    }

    /**
     * 删除种质介绍
     */
    @PreAuthorize("@ss.hasPermi('system:intro:remove')")
    @Log(title = "种质介绍", businessType = BusinessType.DELETE)
	@DeleteMapping("/{introIds}")
    public AjaxResult remove(@PathVariable String[] introIds)
    {
        return toAjax(agricultureGermplasmIntroService.deleteAgricultureGermplasmIntroByIntroIds(introIds));
    }
}
