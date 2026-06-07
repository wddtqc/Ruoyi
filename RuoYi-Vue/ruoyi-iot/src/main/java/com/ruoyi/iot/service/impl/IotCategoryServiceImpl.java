package com.ruoyi.iot.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils; // 确保引入了若依自带的安全工具类
import org.springframework.beans.factory.annotation.Autowired; // 引入 Spring 注入注解
import org.springframework.stereotype.Service;
import com.ruoyi.iot.mapper.IotCategoryMapper;
import com.ruoyi.iot.domain.IotCategory;
import com.ruoyi.iot.service.IIotCategoryService;

/**
 * 产品分类Service业务层处理
 * * @author ruoyi
 * @date 2026-06-05
 */
@Service
public class IotCategoryServiceImpl implements IIotCategoryService
{
    @Autowired //  修正：使用 Autowired 让 Spring 自动注入该 Mapper 实例
    private IotCategoryMapper iotCategoryMapper;

    /**
     * 查询产品分类
     * * @param categoryId 产品分类主键
     * @return 产品分类
     */
    @Override
    public IotCategory selectIotCategoryByCategoryId(Long categoryId)
    {
        return iotCategoryMapper.selectIotCategoryByCategoryId(categoryId);
    }

    /**
     * 查询产品分类列表
     * * @param iotCategory 产品分类
     * @return 产品分类
     */
    @Override
    public List<IotCategory> selectIotCategoryList(IotCategory iotCategory)
    {
        return iotCategoryMapper.selectIotCategoryList(iotCategory);
    }

    /**
     * 新增产品分类
     * * @param iotCategory 产品分类
     * @return 结果
     */
    @Override
    public int insertIotCategory(IotCategory iotCategory)
    {
        // 1. 设置若依基础通用字段
        iotCategory.setCreateTime(DateUtils.getNowDate());
        iotCategory.setCreateBy(SecurityUtils.getUsername());

        // 2. 关键修复：由于SysUser中没有租户字段，这里直接硬编码赋予默认租户ID（0L）
        // 这样 MyBatis 拼接 SQL 时有了安全兜底，数据库就不会报错了
        if (iotCategory.getTenantId() == null) {
            iotCategory.setTenantId(0L);
        }

        // 3. 冗余租户名称，没有就填默认系统
        if (iotCategory.getTenantName() == null) {
            iotCategory.setTenantName("系统自营");
        }

        // 4. 初始化默认字段值（系统通用：0-否）
        if (iotCategory.getIsSys() == null) {
            iotCategory.setIsSys(1); // 修正：上一步已处理为标准的 Integer 类型数字
        }

        return iotCategoryMapper.insertIotCategory(iotCategory);
    }

    /**
     * 修改产品分类
     * * @param iotCategory 产品分类
     * @return 结果
     */
    @Override
    public int updateIotCategory(IotCategory iotCategory)
    {
        iotCategory.setUpdateTime(DateUtils.getNowDate());
        iotCategory.setUpdateBy(SecurityUtils.getUsername()); // 自动补全修改人
        return iotCategoryMapper.updateIotCategory(iotCategory);
    }

    /**
     * 批量删除产品分类
     * * @param categoryIds 需要删除的产品分类主键
     * @return 结果
     */
    @Override
    public int deleteIotCategoryByCategoryIds(Long[] categoryIds)
    {
        return iotCategoryMapper.deleteIotCategoryByCategoryIds(categoryIds);
    }

    /**
     * 删除产品分类信息
     * * @param categoryId 产品分类主键
     * @return 结果
     */
    @Override
    public int deleteIotCategoryByCategoryId(Long categoryId)
    {
        return iotCategoryMapper.deleteIotCategoryByCategoryId(categoryId);
    }
}