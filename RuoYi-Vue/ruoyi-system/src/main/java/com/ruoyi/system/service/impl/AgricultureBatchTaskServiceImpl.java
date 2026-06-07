package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureBatchTaskMapper;
import com.ruoyi.system.domain.AgricultureBatchTask;
import com.ruoyi.system.service.IAgricultureBatchTaskService;

/**
 * 批次任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureBatchTaskServiceImpl implements IAgricultureBatchTaskService 
{
    @Autowired
    private AgricultureBatchTaskMapper agricultureBatchTaskMapper;

    /**
     * 查询批次任务
     * 
     * @param taskId 批次任务主键
     * @return 批次任务
     */
    @Override
    public AgricultureBatchTask selectAgricultureBatchTaskByTaskId(String taskId)
    {
        return agricultureBatchTaskMapper.selectAgricultureBatchTaskByTaskId(taskId);
    }

    /**
     * 查询批次任务列表
     * 
     * @param agricultureBatchTask 批次任务
     * @return 批次任务
     */
    @Override
    public List<AgricultureBatchTask> selectAgricultureBatchTaskList(AgricultureBatchTask agricultureBatchTask)
    {
        return agricultureBatchTaskMapper.selectAgricultureBatchTaskList(agricultureBatchTask);
    }

    /**
     * 新增批次任务
     * 
     * @param agricultureBatchTask 批次任务
     * @return 结果
     */
    @Override
    public int insertAgricultureBatchTask(AgricultureBatchTask agricultureBatchTask)
    {
        agricultureBatchTask.setCreateTime(DateUtils.getNowDate());
        return agricultureBatchTaskMapper.insertAgricultureBatchTask(agricultureBatchTask);
    }

    /**
     * 修改批次任务
     * 
     * @param agricultureBatchTask 批次任务
     * @return 结果
     */
    @Override
    public int updateAgricultureBatchTask(AgricultureBatchTask agricultureBatchTask)
    {
        agricultureBatchTask.setUpdateTime(DateUtils.getNowDate());
        return agricultureBatchTaskMapper.updateAgricultureBatchTask(agricultureBatchTask);
    }

    /**
     * 批量删除批次任务
     * 
     * @param taskIds 需要删除的批次任务主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureBatchTaskByTaskIds(String[] taskIds)
    {
        return agricultureBatchTaskMapper.deleteAgricultureBatchTaskByTaskIds(taskIds);
    }

    /**
     * 删除批次任务信息
     * 
     * @param taskId 批次任务主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureBatchTaskByTaskId(String taskId)
    {
        return agricultureBatchTaskMapper.deleteAgricultureBatchTaskByTaskId(taskId);
    }
}
