package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureStandardJobMapper;
import com.ruoyi.system.domain.AgricultureStandardJob;
import com.ruoyi.system.service.IAgricultureStandardJobService;

/**
 * 标准作业任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureStandardJobServiceImpl implements IAgricultureStandardJobService 
{
    @Autowired
    private AgricultureStandardJobMapper agricultureStandardJobMapper;

    /**
     * 查询标准作业任务
     * 
     * @param jobId 标准作业任务主键
     * @return 标准作业任务
     */
    @Override
    public AgricultureStandardJob selectAgricultureStandardJobByJobId(String jobId)
    {
        return agricultureStandardJobMapper.selectAgricultureStandardJobByJobId(jobId);
    }

    /**
     * 查询标准作业任务列表
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 标准作业任务
     */
    @Override
    public List<AgricultureStandardJob> selectAgricultureStandardJobList(AgricultureStandardJob agricultureStandardJob)
    {
        return agricultureStandardJobMapper.selectAgricultureStandardJobList(agricultureStandardJob);
    }

    /**
     * 新增标准作业任务
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 结果
     */
    @Override
    public int insertAgricultureStandardJob(AgricultureStandardJob agricultureStandardJob)
    {
        agricultureStandardJob.setCreateTime(DateUtils.getNowDate());
        return agricultureStandardJobMapper.insertAgricultureStandardJob(agricultureStandardJob);
    }

    /**
     * 修改标准作业任务
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 结果
     */
    @Override
    public int updateAgricultureStandardJob(AgricultureStandardJob agricultureStandardJob)
    {
        agricultureStandardJob.setUpdateTime(DateUtils.getNowDate());
        return agricultureStandardJobMapper.updateAgricultureStandardJob(agricultureStandardJob);
    }

    /**
     * 批量删除标准作业任务
     * 
     * @param jobIds 需要删除的标准作业任务主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureStandardJobByJobIds(String[] jobIds)
    {
        return agricultureStandardJobMapper.deleteAgricultureStandardJobByJobIds(jobIds);
    }

    /**
     * 删除标准作业任务信息
     * 
     * @param jobId 标准作业任务主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureStandardJobByJobId(String jobId)
    {
        return agricultureStandardJobMapper.deleteAgricultureStandardJobByJobId(jobId);
    }
}
