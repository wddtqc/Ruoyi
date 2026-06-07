package com.ruoyi.iot.service.impl;

import java.util.List;
import java.util.UUID;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils; // 确保引入若依安全工具类
import com.ruoyi.common.utils.StringUtils;   // 确保引入字符串工具类
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.iot.mapper.IotProductMapper;
import com.ruoyi.iot.domain.IotProduct;
import com.ruoyi.iot.service.IIotProductService;

/**
 * 产品Service业务层处理
 * * @author ruoyi
 * @date 2026-06-05
 */
@Service
public class IotProductServiceImpl implements IIotProductService
{
    @Autowired
    private IotProductMapper iotProductMapper;

    /**
     * 查询产品
     * * @param productId 产品主键
     * @return 产品
     */
    @Override
    public IotProduct selectIotProductByProductId(Long productId)
    {
        return iotProductMapper.selectIotProductByProductId(productId);
    }

    /**
     * 查询产品列表
     * * @param iotProduct 产品
     * @return 产品
     */
    @Override
    public List<IotProduct> selectIotProductList(IotProduct iotProduct)
    {
        return iotProductMapper.selectIotProductList(iotProduct);
    }

    /**
     * 新增产品
     * * @param iotProduct 产品
     * @return 结果
     */
    @Override
    public int insertIotProduct(IotProduct iotProduct)
    {
        // 1. 设置基础通用字段
        iotProduct.setCreateTime(DateUtils.getNowDate());
        try {
            iotProduct.setCreateBy(SecurityUtils.getUsername());
        } catch (Exception e) {
            iotProduct.setCreateBy("admin");
        }

        // 2. 核心修复：强行给租户 ID 赋默认值 0L，绕过数据库的 NOT NULL 限制
        if (iotProduct.getTenantId() == null) {
            iotProduct.setTenantId(0L);
        }

        // 3. 冗余字段防护：顺便把租户名称也填充一个默认值
        if (iotProduct.getTenantName() == null) {
            iotProduct.setTenantName("系统自营");
        }

        // 4. 物联网增强：如果前端没有填 MQTT 凭证，后端自动生成（完美配合你的 Wokwi 测试）
        if (StringUtils.isEmpty(iotProduct.getMqttAccount())) {
            // 自动生成 8 位简短账号
            iotProduct.setMqttAccount("P_" + UUID.randomUUID().toString().substring(0, 8));
        }
        if (StringUtils.isEmpty(iotProduct.getMqttPassword())) {
            // 自动生成 16 位强密码
            iotProduct.setMqttPassword(UUID.randomUUID().toString().replace("-", "").substring(0, 16));
        }
        if (StringUtils.isEmpty(iotProduct.getMqttSecret())) {
            // 自动生成产品密钥
            iotProduct.setMqttSecret(UUID.randomUUID().toString().replace("-", ""));
        }

        // 5. 初始化产品状态（默认 1-未发布）
        if (iotProduct.getStatus() == null) {
            iotProduct.setStatus(1);
        }

        return iotProductMapper.insertIotProduct(iotProduct);
    }

    /**
     * 修改产品
     * * @param iotProduct 产品
     * @return 结果
     */
    @Override
    public int updateIotProduct(IotProduct iotProduct)
    {
        iotProduct.setUpdateTime(DateUtils.getNowDate());
        try {
            iotProduct.setUpdateBy(SecurityUtils.getUsername());
        } catch (Exception e) {
            // 防护非Web环境调用
        }
        return iotProductMapper.updateIotProduct(iotProduct);
    }

    /**
     * 批量删除产品
     * * @param productIds 需要删除的产品主键
     * @return 结果
     */
    @Override
    public int deleteIotProductByProductIds(Long[] productIds)
    {
        return iotProductMapper.deleteIotProductByProductIds(productIds);
    }

    /**
     * 删除产品信息
     * * @param productId 产品主键
     * @return 结果
     */
    @Override
    public int deleteIotProductByProductId(Long productId)
    {
        return iotProductMapper.deleteIotProductByProductId(productId);
    }
}