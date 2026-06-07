package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AgricultureGermplasm;

/**
 * 种质Service接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface IAgricultureGermplasmService 
{
    /**
     * 查询种质
     * 
     * @param germplasmId 种质主键
     * @return 种质
     */
    public AgricultureGermplasm selectAgricultureGermplasmByGermplasmId(String germplasmId);

    /**
     * 查询种质列表
     * 
     * @param agricultureGermplasm 种质
     * @return 种质集合
     */
    public List<AgricultureGermplasm> selectAgricultureGermplasmList(AgricultureGermplasm agricultureGermplasm);

    /**
     * 新增种质
     * 
     * @param agricultureGermplasm 种质
     * @return 结果
     */
    public int insertAgricultureGermplasm(AgricultureGermplasm agricultureGermplasm);

    /**
     * 修改种质
     * 
     * @param agricultureGermplasm 种质
     * @return 结果
     */
    public int updateAgricultureGermplasm(AgricultureGermplasm agricultureGermplasm);

    /**
     * 批量删除种质
     * 
     * @param germplasmIds 需要删除的种质主键集合
     * @return 结果
     */
    public int deleteAgricultureGermplasmByGermplasmIds(String[] germplasmIds);

    /**
     * 删除种质信息
     * 
     * @param germplasmId 种质主键
     * @return 结果
     */
    public int deleteAgricultureGermplasmByGermplasmId(String germplasmId);
}
