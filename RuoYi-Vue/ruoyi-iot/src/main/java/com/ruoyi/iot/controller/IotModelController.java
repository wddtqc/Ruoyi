package com.ruoyi.iot.controller;

import java.util.List;
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
import com.ruoyi.common.core.page.TableDataInfo;
import java.util.Map;
import com.ruoyi.common.core.domain.AjaxResult;

/**
 * 物模型Controller — 前端调用的 /iot/model 路由
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/iot/model")
public class IotModelController extends BaseController
{
    @Autowired
    private IIotThingsModelTemplateService iotThingsModelTemplateService;

    /**
     * 查询物模型列表
     */
    @GetMapping("/list")
    public TableDataInfo list(IotThingsModelTemplate iotThingsModelTemplate)
    {
        startPage();
        List<IotThingsModelTemplate> list = iotThingsModelTemplateService.selectIotThingsModelTemplateList(iotThingsModelTemplate);
        return getDataTable(list);
    }

    /**
     * 获取物模型详细信息
     */
    @GetMapping(value = "/{modelId}")
    public AjaxResult getInfo(@PathVariable("modelId") Long modelId)
    {
        return success(iotThingsModelTemplateService.selectIotThingsModelTemplateByTemplateId(modelId));
    }

    /**
     * 导入通用物模型
     */
    @Log(title = "物模型", businessType = BusinessType.INSERT)
    @PostMapping("/import")
    public AjaxResult importModels(@RequestBody Map<String, Object> params)
    {
        Long productId = Long.valueOf(params.get("productId").toString());
        @SuppressWarnings("unchecked")
        List<Integer> templateIdsRaw = (List<Integer>) params.get("templateIds");
        Long[] templateIds = templateIdsRaw.stream().map(Long::valueOf).toArray(Long[]::new);
        int count = iotThingsModelTemplateService.importModelsToProduct(productId, null, templateIds);
        return success("成功导入 " + count + " 条物模型");
    }

    /**
     * 新增物模型
     */
    @Log(title = "物模型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotThingsModelTemplate iotThingsModelTemplate)
    {
        return toAjax(iotThingsModelTemplateService.insertIotThingsModelTemplate(iotThingsModelTemplate));
    }

    /**
     * 修改物模型
     */
    @Log(title = "物模型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotThingsModelTemplate iotThingsModelTemplate)
    {
        return toAjax(iotThingsModelTemplateService.updateIotThingsModelTemplate(iotThingsModelTemplate));
    }

    /**
     * 删除物模型
     */
    @Log(title = "物模型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{modelIds}")
    public AjaxResult remove(@PathVariable Long[] modelIds)
    {
        return toAjax(iotThingsModelTemplateService.deleteIotThingsModelTemplateByTemplateIds(modelIds));
    }

    /**
     * 根据产品ID获取缓存的物模型(ping接口，用于前端判断跳转)
     */
    @GetMapping(value = "/cache/{productId}")
    public AjaxResult cacheJsonThingsModel(@PathVariable("productId") Long productId)
    {
        IotThingsModelTemplate param = new IotThingsModelTemplate();
        param.setProductId(productId);
        List<IotThingsModelTemplate> list = iotThingsModelTemplateService.selectIotThingsModelTemplateList(param);
        return success(list);
    }
}
