package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureCropBatch;

/**
 * 作物批次Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureCropBatchService 
{
    /**
     * 查询作物批次
     * 
     * @param batchId 作物批次主键
     * @return 作物批次
     */
    public AgricultureCropBatch selectAgricultureCropBatchByBatchId(String batchId);

    /**
     * 查询作物批次列表
     * 
     * @param agricultureCropBatch 作物批次
     * @return 作物批次集合
     */
    public List<AgricultureCropBatch> selectAgricultureCropBatchList(AgricultureCropBatch agricultureCropBatch);

    /**
     * 新增作物批次
     * 
     * @param agricultureCropBatch 作物批次
     * @return 结果
     */
    public int insertAgricultureCropBatch(AgricultureCropBatch agricultureCropBatch);

    /**
     * 修改作物批次
     * 
     * @param agricultureCropBatch 作物批次
     * @return 结果
     */
    public int updateAgricultureCropBatch(AgricultureCropBatch agricultureCropBatch);

    /**
     * 批量删除作物批次
     * 
     * @param batchIds 需要删除的作物批次主键集合
     * @return 结果
     */
    public int deleteAgricultureCropBatchByBatchIds(String[] batchIds);

    /**
     * 删除作物批次信息
     * 
     * @param batchId 作物批次主键
     * @return 结果
     */
    public int deleteAgricultureCropBatchByBatchId(String batchId);
}
