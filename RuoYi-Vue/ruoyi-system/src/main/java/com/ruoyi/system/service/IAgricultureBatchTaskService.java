package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureBatchTask;

/**
 * 批次任务Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureBatchTaskService 
{
    /**
     * 查询批次任务
     * 
     * @param taskId 批次任务主键
     * @return 批次任务
     */
    public AgricultureBatchTask selectAgricultureBatchTaskByTaskId(String taskId);

    /**
     * 查询批次任务列表
     * 
     * @param agricultureBatchTask 批次任务
     * @return 批次任务集合
     */
    public List<AgricultureBatchTask> selectAgricultureBatchTaskList(AgricultureBatchTask agricultureBatchTask);

    /**
     * 新增批次任务
     * 
     * @param agricultureBatchTask 批次任务
     * @return 结果
     */
    public int insertAgricultureBatchTask(AgricultureBatchTask agricultureBatchTask);

    /**
     * 修改批次任务
     * 
     * @param agricultureBatchTask 批次任务
     * @return 结果
     */
    public int updateAgricultureBatchTask(AgricultureBatchTask agricultureBatchTask);

    /**
     * 批量删除批次任务
     * 
     * @param taskIds 需要删除的批次任务主键集合
     * @return 结果
     */
    public int deleteAgricultureBatchTaskByTaskIds(String[] taskIds);

    /**
     * 删除批次任务信息
     * 
     * @param taskId 批次任务主键
     * @return 结果
     */
    public int deleteAgricultureBatchTaskByTaskId(String taskId);
}
