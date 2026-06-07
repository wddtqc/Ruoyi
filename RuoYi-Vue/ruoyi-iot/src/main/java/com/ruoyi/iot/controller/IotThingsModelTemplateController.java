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
import com.ruoyi.iot.domain.IotThingsModelTemplate;
import com.ruoyi.iot.service.IIotThingsModelTemplateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 物模型模板Controller
 * 
 * @author ruoyi
 * @date 2026-06-04
 */
@RestController
@RequestMapping("/iot/template")
public class IotThingsModelTemplateController extends BaseController
{
    @Autowired
    private IIotThingsModelTemplateService iotThingsModelTemplateService;

    /**
     * 查询物模型模板列表
     */
    @PreAuthorize("@ss.hasPermi('iot:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotThingsModelTemplate iotThingsModelTemplate)
    {
        startPage();
        List<IotThingsModelTemplate> list = iotThingsModelTemplateService.selectIotThingsModelTemplateList(iotThingsModelTemplate);
        return getDataTable(list);
    }

    /**
     * 导出物模型模板列表
     */
    @PreAuthorize("@ss.hasPermi('iot:template:export')")
    @Log(title = "物模型模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, IotThingsModelTemplate iotThingsModelTemplate)
    {
        List<IotThingsModelTemplate> list = iotThingsModelTemplateService.selectIotThingsModelTemplateList(iotThingsModelTemplate);
        ExcelUtil<IotThingsModelTemplate> util = new ExcelUtil<IotThingsModelTemplate>(IotThingsModelTemplate.class);
        util.exportExcel(response, list, "物模型模板数据");
    }

    /**
     * 获取物模型模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:template:query')")
    @GetMapping(value = "/{templateId}")
    public AjaxResult getInfo(@PathVariable("templateId") Long templateId)
    {
        return success(iotThingsModelTemplateService.selectIotThingsModelTemplateByTemplateId(templateId));
    }

    /**
     * 新增物模型模板
     */
    @PreAuthorize("@ss.hasPermi('iot:template:add')")
    @Log(title = "物模型模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotThingsModelTemplate iotThingsModelTemplate)
    {
        return toAjax(iotThingsModelTemplateService.insertIotThingsModelTemplate(iotThingsModelTemplate));
    }

    /**
     * 修改物模型模板
     */
    @PreAuthorize("@ss.hasPermi('iot:template:edit')")
    @Log(title = "物模型模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotThingsModelTemplate iotThingsModelTemplate)
    {
        return toAjax(iotThingsModelTemplateService.updateIotThingsModelTemplate(iotThingsModelTemplate));
    }

    /**
     * 删除物模型模板
     */
    @PreAuthorize("@ss.hasPermi('iot:template:remove')")
    @Log(title = "物模型模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{templateIds}")
    public AjaxResult remove(@PathVariable Long[] templateIds)
    {
        return toAjax(iotThingsModelTemplateService.deleteIotThingsModelTemplateByTemplateIds(templateIds));
    }
}
