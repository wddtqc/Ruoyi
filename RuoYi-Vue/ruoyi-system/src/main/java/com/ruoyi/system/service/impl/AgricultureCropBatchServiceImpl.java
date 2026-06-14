package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureCropBatchMapper;
import com.ruoyi.system.mapper.AgricultureLandMapper;
import com.ruoyi.system.domain.AgricultureCropBatch;
import com.ruoyi.system.domain.AgricultureLand;
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

    @Autowired
    private AgricultureLandMapper agricultureLandMapper;

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
        int result = agricultureCropBatchMapper.insertAgricultureCropBatch(agricultureCropBatch);

        // 同步更新地块的 current_batch 字段
        if (result > 0 && agricultureCropBatch.getLandId() != null) {
            AgricultureLand land = agricultureLandMapper.selectAgricultureLandByLandId(String.valueOf(agricultureCropBatch.getLandId()));
            if (land != null) {
                land.setCurrentBatch(Long.parseLong(agricultureCropBatch.getBatchId()));
                agricultureLandMapper.updateAgricultureLand(land);
            }
        }

        return result;
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

        // 获取旧的批次信息
        AgricultureCropBatch oldBatch = agricultureCropBatchMapper.selectAgricultureCropBatchByBatchId(agricultureCropBatch.getBatchId());

        int result = agricultureCropBatchMapper.updateAgricultureCropBatch(agricultureCropBatch);

        // 如果地块发生变化，需要更新新旧地块的 current_batch 字段
        if (result > 0) {
            Long oldLandId = oldBatch != null ? oldBatch.getLandId() : null;
            Long newLandId = agricultureCropBatch.getLandId();

            // 清除旧地块的 current_batch
            if (oldLandId != null && !oldLandId.equals(newLandId)) {
                AgricultureLand oldLand = agricultureLandMapper.selectAgricultureLandByLandId(String.valueOf(oldLandId));
                if (oldLand != null && String.valueOf(oldLand.getCurrentBatch()).equals(agricultureCropBatch.getBatchId())) {
                    oldLand.setCurrentBatch(null);
                    agricultureLandMapper.updateAgricultureLand(oldLand);
                }
            }

            // 设置新地块的 current_batch
            if (newLandId != null) {
                AgricultureLand newLand = agricultureLandMapper.selectAgricultureLandByLandId(String.valueOf(newLandId));
                if (newLand != null) {
                    newLand.setCurrentBatch(Long.parseLong(agricultureCropBatch.getBatchId()));
                    agricultureLandMapper.updateAgricultureLand(newLand);
                }
            }
        }

        return result;
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
