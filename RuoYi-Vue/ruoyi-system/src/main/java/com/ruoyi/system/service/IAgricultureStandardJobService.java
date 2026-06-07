package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureStandardJob;

/**
 * 标准作业任务Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureStandardJobService 
{
    /**
     * 查询标准作业任务
     * 
     * @param jobId 标准作业任务主键
     * @return 标准作业任务
     */
    public AgricultureStandardJob selectAgricultureStandardJobByJobId(String jobId);

    /**
     * 查询标准作业任务列表
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 标准作业任务集合
     */
    public List<AgricultureStandardJob> selectAgricultureStandardJobList(AgricultureStandardJob agricultureStandardJob);

    /**
     * 新增标准作业任务
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 结果
     */
    public int insertAgricultureStandardJob(AgricultureStandardJob agricultureStandardJob);

    /**
     * 修改标准作业任务
     * 
     * @param agricultureStandardJob 标准作业任务
     * @return 结果
     */
    public int updateAgricultureStandardJob(AgricultureStandardJob agricultureStandardJob);

    /**
     * 批量删除标准作业任务
     * 
     * @param jobIds 需要删除的标准作业任务主键集合
     * @return 结果
     */
    public int deleteAgricultureStandardJobByJobIds(String[] jobIds);

    /**
     * 删除标准作业任务信息
     * 
     * @param jobId 标准作业任务主键
     * @return 结果
     */
    public int deleteAgricultureStandardJobByJobId(String jobId);
}
