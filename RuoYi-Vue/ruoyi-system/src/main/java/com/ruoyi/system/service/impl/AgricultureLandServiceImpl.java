package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureLandMapper;
import com.ruoyi.system.domain.AgricultureLand;
import com.ruoyi.system.service.IAgricultureLandService;

/**
 * 地块Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-01
 */
@Service
public class AgricultureLandServiceImpl implements IAgricultureLandService 
{
    @Autowired
    private AgricultureLandMapper agricultureLandMapper;

    /**
     * 查询地块
     * 
     * @param landId 地块主键
     * @return 地块
     */
    @Override
    public AgricultureLand selectAgricultureLandByLandId(String landId)
    {
        return agricultureLandMapper.selectAgricultureLandByLandId(landId);
    }

    /**
     * 查询地块列表
     * 
     * @param agricultureLand 地块
     * @return 地块
     */
    @Override
    public List<AgricultureLand> selectAgricultureLandList(AgricultureLand agricultureLand)
    {
        return agricultureLandMapper.selectAgricultureLandList(agricultureLand);
    }

    /**
     * 新增地块
     * 
     * @param agricultureLand 地块
     * @return 结果
     */
    @Override
    public int insertAgricultureLand(AgricultureLand agricultureLand)
    {
        agricultureLand.setCreateTime(DateUtils.getNowDate());
        return agricultureLandMapper.insertAgricultureLand(agricultureLand);
    }

    /**
     * 修改地块
     * 
     * @param agricultureLand 地块
     * @return 结果
     */
    @Override
    public int updateAgricultureLand(AgricultureLand agricultureLand)
    {
        agricultureLand.setUpdateTime(DateUtils.getNowDate());
        return agricultureLandMapper.updateAgricultureLand(agricultureLand);
    }

    /**
     * 批量删除地块
     * 
     * @param landIds 需要删除的地块主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureLandByLandIds(String[] landIds)
    {
        return agricultureLandMapper.deleteAgricultureLandByLandIds(landIds);
    }

    /**
     * 删除地块信息
     * 
     * @param landId 地块主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureLandByLandId(String landId)
    {
        return agricultureLandMapper.deleteAgricultureLandByLandId(landId);
    }
}
