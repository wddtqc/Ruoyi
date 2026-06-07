package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AgricultureGermplasmIntro;

/**
 * 种质介绍Mapper接口
 * 
 * @author ruoyi
 * @date 2026-06-02
 */
public interface AgricultureGermplasmIntroMapper 
{
    /**
     * 查询种质介绍
     * 
     * @param introId 种质介绍主键
     * @return 种质介绍
     */
    public AgricultureGermplasmIntro selectAgricultureGermplasmIntroByIntroId(String introId);

    /**
     * 查询种质介绍列表
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 种质介绍集合
     */
    public List<AgricultureGermplasmIntro> selectAgricultureGermplasmIntroList(AgricultureGermplasmIntro agricultureGermplasmIntro);

    /**
     * 新增种质介绍
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 结果
     */
    public int insertAgricultureGermplasmIntro(AgricultureGermplasmIntro agricultureGermplasmIntro);

    /**
     * 修改种质介绍
     * 
     * @param agricultureGermplasmIntro 种质介绍
     * @return 结果
     */
    public int updateAgricultureGermplasmIntro(AgricultureGermplasmIntro agricultureGermplasmIntro);

    /**
     * 删除种质介绍
     * 
     * @param introId 种质介绍主键
     * @return 结果
     */
    public int deleteAgricultureGermplasmIntroByIntroId(String introId);

    /**
     * 批量删除种质介绍
     * 
     * @param introIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAgricultureGermplasmIntroByIntroIds(String[] introIds);
}
