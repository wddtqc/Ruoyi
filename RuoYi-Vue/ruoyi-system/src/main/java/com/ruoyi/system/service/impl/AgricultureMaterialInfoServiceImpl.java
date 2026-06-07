package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureMaterialInfoMapper;
import com.ruoyi.system.domain.AgricultureMaterialInfo;
import com.ruoyi.system.service.IAgricultureMaterialInfoService;

/**
 * 农资信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureMaterialInfoServiceImpl implements IAgricultureMaterialInfoService 
{
    @Autowired
    private AgricultureMaterialInfoMapper agricultureMaterialInfoMapper;

    /**
     * 查询农资信息
     * 
     * @param materialId 农资信息主键
     * @return 农资信息
     */
    @Override
    public AgricultureMaterialInfo selectAgricultureMaterialInfoByMaterialId(String materialId)
    {
        return agricultureMaterialInfoMapper.selectAgricultureMaterialInfoByMaterialId(materialId);
    }

    /**
     * 查询农资信息列表
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 农资信息
     */
    @Override
    public List<AgricultureMaterialInfo> selectAgricultureMaterialInfoList(AgricultureMaterialInfo agricultureMaterialInfo)
    {
        return agricultureMaterialInfoMapper.selectAgricultureMaterialInfoList(agricultureMaterialInfo);
    }

    /**
     * 新增农资信息
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 结果
     */
    @Override
    public int insertAgricultureMaterialInfo(AgricultureMaterialInfo agricultureMaterialInfo)
    {
        agricultureMaterialInfo.setCreateTime(DateUtils.getNowDate());
        return agricultureMaterialInfoMapper.insertAgricultureMaterialInfo(agricultureMaterialInfo);
    }

    /**
     * 修改农资信息
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 结果
     */
    @Override
    public int updateAgricultureMaterialInfo(AgricultureMaterialInfo agricultureMaterialInfo)
    {
        agricultureMaterialInfo.setUpdateTime(DateUtils.getNowDate());
        return agricultureMaterialInfoMapper.updateAgricultureMaterialInfo(agricultureMaterialInfo);
    }

    /**
     * 批量删除农资信息
     * 
     * @param materialIds 需要删除的农资信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMaterialInfoByMaterialIds(String[] materialIds)
    {
        return agricultureMaterialInfoMapper.deleteAgricultureMaterialInfoByMaterialIds(materialIds);
    }

    /**
     * 删除农资信息信息
     * 
     * @param materialId 农资信息主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureMaterialInfoByMaterialId(String materialId)
    {
        return agricultureMaterialInfoMapper.deleteAgricultureMaterialInfoByMaterialId(materialId);
    }
}
