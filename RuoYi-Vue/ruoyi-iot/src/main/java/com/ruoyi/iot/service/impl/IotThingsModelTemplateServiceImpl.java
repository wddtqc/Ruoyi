package com.ruoyi.iot.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils; // 确保引入了若依的安全工具类
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.iot.mapper.IotThingsModelTemplateMapper;
import com.ruoyi.iot.domain.IotThingsModelTemplate;
import com.ruoyi.iot.service.IIotThingsModelTemplateService;

/**
 * 物模型模板Service业务层处理
 * * @author ruoyi
 * @date 2026-06-04
 */
@Service
public class IotThingsModelTemplateServiceImpl implements IIotThingsModelTemplateService
{
    @Autowired
    private IotThingsModelTemplateMapper iotThingsModelTemplateMapper;

    /**
     * 查询物模型模板
     * * @param templateId 物模型模板主键
     * @return 物模型模板
     */
    @Override
    public IotThingsModelTemplate selectIotThingsModelTemplateByTemplateId(Long templateId)
    {
        return iotThingsModelTemplateMapper.selectIotThingsModelTemplateByTemplateId(templateId);
    }

    /**
     * 查询物模型模板列表
     * * @param iotThingsModelTemplate 物模型模板
     * @return 物模型模板
     */
    @Override
    public List<IotThingsModelTemplate> selectIotThingsModelTemplateList(IotThingsModelTemplate iotThingsModelTemplate)
    {
        return iotThingsModelTemplateMapper.selectIotThingsModelTemplateList(iotThingsModelTemplate);
    }

    /**
     * 新增物模型模板
     * * @param iotThingsModelTemplate 物模型模板
     * @return 结果
     */
    @Override
    public int insertIotThingsModelTemplate(IotThingsModelTemplate iotThingsModelTemplate)
    {
        // 1. 设置创建时间
        iotThingsModelTemplate.setCreateTime(DateUtils.getNowDate());

        // 2. 核心修复：强行给租户 ID 赋默认值 0L，绕过数据库的 NOT NULL 限制
        if (iotThingsModelTemplate.getTenantId() == null) {
            iotThingsModelTemplate.setTenantId(0L);
        }

        // 3. 冗余字段防护：顺便把租户名称也填充一个默认值
        if (iotThingsModelTemplate.getTenantName() == null) {
            iotThingsModelTemplate.setTenantName("系统自营");
        }

        return iotThingsModelTemplateMapper.insertIotThingsModelTemplate(iotThingsModelTemplate);
    }

    /**
     * 修改物模型模板
     * * @param iotThingsModelTemplate 物模型模板
     * @return 结果
     */
    @Override
    public int updateIotThingsModelTemplate(IotThingsModelTemplate iotThingsModelTemplate)
    {
        // 自动补全修改时间与修改人
        iotThingsModelTemplate.setUpdateTime(DateUtils.getNowDate());
        try {
            iotThingsModelTemplate.setUpdateBy(SecurityUtils.getUsername());
        } catch (Exception e) {
            // 防护：可能存在非Web上下文环境调用
        }
        return iotThingsModelTemplateMapper.updateIotThingsModelTemplate(iotThingsModelTemplate);
    }

    /**
     * 批量删除物模型模板
     * * @param templateIds 需要删除的物模型模板主键
     * @return 结果
     */
    @Override
    public int deleteIotThingsModelTemplateByTemplateIds(Long[] templateIds)
    {
        return iotThingsModelTemplateMapper.deleteIotThingsModelTemplateByTemplateIds(templateIds);
    }

    /**
     * 删除物模型模板信息
     * * @param templateId 物模型模板主键
     * @return 结果
     */
    @Override
    public int deleteIotThingsModelTemplateByTemplateId(Long templateId)
    {
        return iotThingsModelTemplateMapper.deleteIotThingsModelTemplateByTemplateId(templateId);
    }
}