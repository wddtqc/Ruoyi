package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureTaskLog;

/**
 * 任务执行日志Mapper接口
 *
 * @author ruoyi
 * @date 2026-06-14
 */
public interface AgricultureTaskLogMapper
{
    /**
     * 查询任务执行日志
     *
     * @param logId 任务执行日志主键
     * @return 任务执行日志
     */
    public AgricultureTaskLog selectAgricultureTaskLogByLogId(Long logId);

    /**
     * 查询任务执行日志列表
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 任务执行日志集合
     */
    public List<AgricultureTaskLog> selectAgricultureTaskLogList(AgricultureTaskLog agricultureTaskLog);

    /**
     * 新增任务执行日志
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 结果
     */
    public int insertAgricultureTaskLog(AgricultureTaskLog agricultureTaskLog);

    /**
     * 修改任务执行日志
     *
     * @param agricultureTaskLog 任务执行日志
     * @return 结果
     */
    public int updateAgricultureTaskLog(AgricultureTaskLog agricultureTaskLog);

    /**
     * 删除任务执行日志
     *
     * @param logId 任务执行日志主键
     * @return 结果
     */
    public int deleteAgricultureTaskLogByLogId(Long logId);

    /**
     * 批量删除任务执行日志
     *
     * @param logIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureTaskLogByLogIds(Long[] logIds);
}
