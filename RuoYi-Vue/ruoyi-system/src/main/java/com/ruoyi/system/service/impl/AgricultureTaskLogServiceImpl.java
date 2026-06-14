package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureTaskLogMapper;
import com.ruoyi.system.domain.AgricultureTaskLog;
import com.ruoyi.system.service.IAgricultureTaskLogService;

/**
 * 任务执行日志Service业务层处理
 *
 * @author ruoyi
 * @date 2026-06-14
 */
@Service
public class AgricultureTaskLogServiceImpl implements IAgricultureTaskLogService
{
    @Autowired
    private AgricultureTaskLogMapper agricultureTaskLogMapper;

    /**
     * 查询任务执行日志
     *
     * @param logId 任务执行日志主键
     * @return 任务执行日志
     */
    @Override
    public AgricultureTaskLog selectAgricultureTaskLogByLogId(Long logId)
    {
        return agricultureTaskLogMapper.selectAgricultureTaskLogByLogId(logId);
    }

    /**
     * 查询任务执行日志列表
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 任务执行日志
     */
    @Override
    public List<AgricultureTaskLog> selectAgricultureTaskLogList(AgricultureTaskLog agricultureTaskLog)
    {
        return agricultureTaskLogMapper.selectAgricultureTaskLogList(agricultureTaskLog);
    }

    /**
     * 新增任务执行日志
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 结果
     */
    @Override
    public int insertAgricultureTaskLog(AgricultureTaskLog agricultureTaskLog)
    {
        agricultureTaskLog.setCreateTime(DateUtils.getNowDate());
        return agricultureTaskLogMapper.insertAgricultureTaskLog(agricultureTaskLog);
    }

    /**
     * 修改任务执行日志
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 结果
     */
    @Override
    public int updateAgricultureTaskLog(AgricultureTaskLog agricultureTaskLog)
    {
        agricultureTaskLog.setUpdateTime(DateUtils.getNowDate());
        return agricultureTaskLogMapper.updateAgricultureTaskLog(agricultureTaskLog);
    }

    /**
     * 批量删除任务执行日志
     *
     * @param logIds 需要删除的任务执行日志主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureTaskLogByLogIds(Long[] logIds)
    {
        return agricultureTaskLogMapper.deleteAgricultureTaskLogByLogIds(logIds);
    }

    /**
     * 删除任务执行日志信息
     *
     * @param logId 任务执行日志主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureTaskLogByLogId(Long logId)
    {
        return agricultureTaskLogMapper.deleteAgricultureTaskLogByLogId(logId);
    }
}
