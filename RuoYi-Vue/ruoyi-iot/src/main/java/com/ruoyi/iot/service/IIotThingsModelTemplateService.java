package com.ruoyi.iot.service;

import java.util.List;
import com.ruoyi.iot.domain.IotThingsModelTemplate;

/**
 * 物模型模板Service接口
 * 
 * @author ruoyi
 * @date 2026-06-04
 */
public interface IIotThingsModelTemplateService 
{
    /**
     * 查询物模型模板
     * 
     * @param templateId 物模型模板主键
     * @return 物模型模板
     */
    public IotThingsModelTemplate selectIotThingsModelTemplateByTemplateId(Long templateId);

    /**
     * 查询物模型模板列表
     * 
     * @param iotThingsModelTemplate 物模型模板
     * @return 物模型模板集合
     */
    public List<IotThingsModelTemplate> selectIotThingsModelTemplateList(IotThingsModelTemplate iotThingsModelTemplate);

    /**
     * 新增物模型模板
     * 
     * @param iotThingsModelTemplate 物模型模板
     * @return 结果
     */
    public int insertIotThingsModelTemplate(IotThingsModelTemplate iotThingsModelTemplate);

    /**
     * 修改物模型模板
     * 
     * @param iotThingsModelTemplate 物模型模板
     * @return 结果
     */
    public int updateIotThingsModelTemplate(IotThingsModelTemplate iotThingsModelTemplate);

    /**
     * 批量删除物模型模板
     * 
     * @param templateIds 需要删除的物模型模板主键集合
     * @return 结果
     */
    public int deleteIotThingsModelTemplateByTemplateIds(Long[] templateIds);

    /**
     * 删除物模型模板信息
     * 
     * @param templateId 物模型模板主键
     * @return 结果
     */
    public int deleteIotThingsModelTemplateByTemplateId(Long templateId);
}
