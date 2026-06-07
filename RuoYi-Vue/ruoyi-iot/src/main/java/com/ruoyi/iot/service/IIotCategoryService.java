package com.ruoyi.iot.service;

import java.util.List;
import com.ruoyi.iot.domain.IotCategory;

/**
 * 产品分类Service接口
 * 
 * @author ruoyi
 * @date 2026-06-05
 */
public interface IIotCategoryService 
{
    /**
     * 查询产品分类
     * 
     * @param categoryId 产品分类主键
     * @return 产品分类
     */
    public IotCategory selectIotCategoryByCategoryId(Long categoryId);

    /**
     * 查询产品分类列表
     * 
     * @param iotCategory 产品分类
     * @return 产品分类集合
     */
    public List<IotCategory> selectIotCategoryList(IotCategory iotCategory);

    /**
     * 新增产品分类
     * 
     * @param iotCategory 产品分类
     * @return 结果
     */
    public int insertIotCategory(IotCategory iotCategory);

    /**
     * 修改产品分类
     * 
     * @param iotCategory 产品分类
     * @return 结果
     */
    public int updateIotCategory(IotCategory iotCategory);

    /**
     * 批量删除产品分类
     * 
     * @param categoryIds 需要删除的产品分类主键集合
     * @return 结果
     */
    public int deleteIotCategoryByCategoryIds(Long[] categoryIds);

    /**
     * 删除产品分类信息
     * 
     * @param categoryId 产品分类主键
     * @return 结果
     */
    public int deleteIotCategoryByCategoryId(Long categoryId);
}
