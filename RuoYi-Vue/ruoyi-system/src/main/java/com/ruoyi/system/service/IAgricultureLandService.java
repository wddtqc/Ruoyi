package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureLand;

/**
 * 地块Service接口
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
public interface IAgricultureLandService 
{
    /**
     * 查询地块
     * 
     * @param landId 地块主键
     * @return 地块
     */
    public AgricultureLand selectAgricultureLandByLandId(String landId);

    /**
     * 查询地块列表
     * 
     * @param agricultureLand 地块
     * @return 地块集合
     */
    public List<AgricultureLand> selectAgricultureLandList(AgricultureLand agricultureLand);

    /**
     * 新增地块
     * 
     * @param agricultureLand 地块
     * @return 结果
     */
    public int insertAgricultureLand(AgricultureLand agricultureLand);

    /**
     * 修改地块
     * 
     * @param agricultureLand 地块
     * @return 结果
     */
    public int updateAgricultureLand(AgricultureLand agricultureLand);

    /**
     * 批量删除地块
     * 
     * @param landIds 需要删除的地块主键集合
     * @return 结果
     */
    public int deleteAgricultureLandByLandIds(String[] landIds);

    /**
     * 删除地块信息
     * 
     * @param landId 地块主键
     * @return 结果
     */
    public int deleteAgricultureLandByLandId(String landId);
}
