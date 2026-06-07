package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgriculturePlantMethod;

/**
 * 种植方法Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgriculturePlantMethodService 
{
    /**
     * 查询种植方法
     * 
     * @param methodId 种植方法主键
     * @return 种植方法
     */
    public AgriculturePlantMethod selectAgriculturePlantMethodByMethodId(String methodId);

    /**
     * 查询种植方法列表
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 种植方法集合
     */
    public List<AgriculturePlantMethod> selectAgriculturePlantMethodList(AgriculturePlantMethod agriculturePlantMethod);

    /**
     * 新增种植方法
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 结果
     */
    public int insertAgriculturePlantMethod(AgriculturePlantMethod agriculturePlantMethod);

    /**
     * 修改种植方法
     * 
     * @param agriculturePlantMethod 种植方法
     * @return 结果
     */
    public int updateAgriculturePlantMethod(AgriculturePlantMethod agriculturePlantMethod);

    /**
     * 批量删除种植方法
     * 
     * @param methodIds 需要删除的种植方法主键集合
     * @return 结果
     */
    public int deleteAgriculturePlantMethodByMethodIds(String[] methodIds);

    /**
     * 删除种植方法信息
     * 
     * @param methodId 种植方法主键
     * @return 结果
     */
    public int deleteAgriculturePlantMethodByMethodId(String methodId);
}
