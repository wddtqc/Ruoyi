package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureStandardJob;

/**
 * 标准作业任务Mapper接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface AgricultureStandardJobMapper 
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
     * 删除标准作业任务
     * 
     * @param jobId 标准作业任务主键
     * @return 结果
     */
    public int deleteAgricultureStandardJobByJobId(String jobId);

    /**
     * 批量删除标准作业任务
     * 
     * @param jobIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureStandardJobByJobIds(String[] jobIds);
}
