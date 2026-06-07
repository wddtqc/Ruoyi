package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgricultureGermplasmIntroMapper;
import com.ruoyi.system.domain.AgricultureGermplasmIntro;
import com.ruoyi.system.service.IAgricultureGermplasmIntroService;

/**
 * 种质介绍Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
@Service
public class AgricultureGermplasmIntroServiceImpl implements IAgricultureGermplasmIntroService 
{
    @Autowired
    private AgricultureGermplasmIntroMapper agricultureGermplasmIntroMapper;

    /**
     * 查询种质介绍
     * 
     * @param introId 种质介绍主键
     * @return 种质介绍
     */
    @Override
    public AgricultureGermplasmIntro selectAgricultureGermplasmIntroByIntroId(String introId)
    {
        return agricultureGermplasmIntroMapper.selectAgricultureGermplasmIntroByIntroId(introId);
    }

    /**
     * 查询种质介绍列表
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 种质介绍
     */
    @Override
    public List<AgricultureGermplasmIntro> selectAgricultureGermplasmIntroList(AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        return agricultureGermplasmIntroMapper.selectAgricultureGermplasmIntroList(agricultureGermplasmIntro);
    }

    /**
     * 新增种质介绍
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 结果
     */
    @Override
    public int insertAgricultureGermplasmIntro(AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        agricultureGermplasmIntro.setCreateTime(DateUtils.getNowDate());
        return agricultureGermplasmIntroMapper.insertAgricultureGermplasmIntro(agricultureGermplasmIntro);
    }

    /**
     * 修改种质介绍
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 结果
     */
    @Override
    public int updateAgricultureGermplasmIntro(AgricultureGermplasmIntro agricultureGermplasmIntro)
    {
        agricultureGermplasmIntro.setUpdateTime(DateUtils.getNowDate());
        return agricultureGermplasmIntroMapper.updateAgricultureGermplasmIntro(agricultureGermplasmIntro);
    }

    /**
     * 批量删除种质介绍
     * 
     * @param introIds 需要删除的种质介绍主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureGermplasmIntroByIntroIds(String[] introIds)
    {
        return agricultureGermplasmIntroMapper.deleteAgricultureGermplasmIntroByIntroIds(introIds);
    }

    /**
     * 删除种质介绍信息
     * 
     * @param introId 种质介绍主键
     * @return 结果
     */
    @Override
    public int deleteAgricultureGermplasmIntroByIntroId(String introId)
    {
        return agricultureGermplasmIntroMapper.deleteAgricultureGermplasmIntroByIntroId(introId);
    }
}
