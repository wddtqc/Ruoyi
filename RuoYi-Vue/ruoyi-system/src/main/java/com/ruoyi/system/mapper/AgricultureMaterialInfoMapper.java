package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureMaterialInfo;

/**
 * 农资信息Mapper接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface AgricultureMaterialInfoMapper 
{
    /**
     * 查询农资信息
     * 
     * @param materialId 农资信息主键
     * @return 农资信息
     */
    public AgricultureMaterialInfo selectAgricultureMaterialInfoByMaterialId(String materialId);

    /**
     * 查询农资信息列表
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 农资信息集合
     */
    public List<AgricultureMaterialInfo> selectAgricultureMaterialInfoList(AgricultureMaterialInfo agricultureMaterialInfo);

    /**
     * 新增农资信息
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 结果
     */
    public int insertAgricultureMaterialInfo(AgricultureMaterialInfo agricultureMaterialInfo);

    /**
     * 修改农资信息
     * 
     * @param agricultureMaterialInfo 农资信息
     * @return 结果
     */
    public int updateAgricultureMaterialInfo(AgricultureMaterialInfo agricultureMaterialInfo);

    /**
     * 删除农资信息
     * 
     * @param materialId 农资信息主键
     * @return 结果
     */
    public int deleteAgricultureMaterialInfoByMaterialId(String materialId);

    /**
     * 批量删除农资信息
     * 
     * @param materialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureMaterialInfoByMaterialIds(String[] materialIds);
}
