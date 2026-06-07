package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureGermplasmMapper;
import com.ruoyi.system.domain.AgricultureGermplasm;
import com.ruoyi.system.service.IAgricultureGermplasmService;

/**
 * 种质Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureGermplasmServiceImpl implements IAgricultureGermplasmService 
{
    @Autowired
    private AgricultureGermplasmMapper agricultureGermplasmMapper;

    /**
     * 查询种质
     * 
     * @param germplasmId 种质主键
     * @return 种质
     */
    @Override
    public AgricultureGermplasm selectAgricultureGermplasmByGermplasmId(String germplasmId)
    {
        return agricultureGermplasmMapper.selectAgricultureGermplasmByGermplasmId(germplasmId);
    }

    /**
     * 查询种质列表
     * 
     * @param agricultureGermplasm 种质
     * @return 种质
     */
    @Override
    public List<AgricultureGermplasm> selectAgricultureGermplasmList(AgricultureGermplasm agricultureGermplasm)
    {
        return agricultureGermplasmMapper.selectAgricultureGermplasmList(agricultureGermplasm);
    }

    /**
     * 新增种质
     * 
     * @param agricultureGermplasm 种质
     * @return 结果
     */
    @Override
    public int insertAgricultureGermplasm(AgricultureGermplasm agricultureGermplasm)
    {
        agricultureGermplasm.setCreateTime(DateUtils.getNowDate());
        return agricultureGermplasmMapper.insertAgricultureGermplasm(agricultureGermplasm);
    }

    /**
     * 修改种质
     * 
     * @param agricultureGermplasm 种质
     * @return 结果
     */
    @Override
    public int updateAgricultureGermplasm(AgricultureGermplasm agricultureGermplasm)
    {
        agricultureGermplasm.setUpdateTime(DateUtils.getNowDate());
        return agricultureGermplasmMapper.updateAgricultureGermplasm(agricultureGermplasm);
    }

    /**
     * 批量删除种质
     * 
     * @param germplasmIds 需要删除的种质主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureGermplasmByGermplasmIds(String[] germplasmIds)
    {
        return agricultureGermplasmMapper.deleteAgricultureGermplasmByGermplasmIds(germplasmIds);
    }

    /**
     * 删除种质信息
     * 
     * @param germplasmId 种质主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureGermplasmByGermplasmId(String germplasmId)
    {
        return agricultureGermplasmMapper.deleteAgricultureGermplasmByGermplasmId(germplasmId);
    }
}
