package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureCropBatchMapper;
import com.ruoyi.system.domain.AgricultureCropBatch;
import com.ruoyi.system.service.IAgricultureCropBatchService;

/**
 * 作物批次Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureCropBatchServiceImpl implements IAgricultureCropBatchService 
{
    @Autowired
    private AgricultureCropBatchMapper agricultureCropBatchMapper;

    /**
     * 查询作物批次
     * 
     * @param batchId 作物批次主键
     * @return 作物批次
     */
    @Override
    public AgricultureCropBatch selectAgricultureCropBatchByBatchId(String batchId)
    {
        return agricultureCropBatchMapper.selectAgricultureCropBatchByBatchId(batchId);
    }

    /**
     * 查询作物批次列表
     * 
     * @param agricultureCropBatch 作物批次
     * @return 作物批次
     */
    @Override
    public List<AgricultureCropBatch> selectAgricultureCropBatchList(AgricultureCropBatch agricultureCropBatch)
    {
        return agricultureCropBatchMapper.selectAgricultureCropBatchList(agricultureCropBatch);
    }

    /**
     * 新增作物批次
     * 
     * @param agricultureCropBatch 作物批次
     * @return 结果
     */
    @Override
    public int insertAgricultureCropBatch(AgricultureCropBatch agricultureCropBatch)
    {
        agricultureCropBatch.setCreateTime(DateUtils.getNowDate());
        return agricultureCropBatchMapper.insertAgricultureCropBatch(agricultureCropBatch);
    }

    /**
     * 修改作物批次
     * 
     * @param agricultureCropBatch 作物批次
     * @return 结果
     */
    @Override
    public int updateAgricultureCropBatch(AgricultureCropBatch agricultureCropBatch)
    {
        agricultureCropBatch.setUpdateTime(DateUtils.getNowDate());
        return agricultureCropBatchMapper.updateAgricultureCropBatch(agricultureCropBatch);
    }

    /**
     * 批量删除作物批次
     * 
     * @param batchIds 需要删除的作物批次主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCropBatchByBatchIds(String[] batchIds)
    {
        return agricultureCropBatchMapper.deleteAgricultureCropBatchByBatchIds(batchIds);
    }

    /**
     * 删除作物批次信息
     * 
     * @param batchId 作物批次主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureCropBatchByBatchId(String batchId)
    {
        return agricultureCropBatchMapper.deleteAgricultureCropBatchByBatchId(batchId);
    }
}
