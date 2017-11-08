package com.taskconsole.dao;

import com.taskconsole.dto.TBSCHEDULESTRATEGY;

public interface TBSCHEDULESTRATEGYMapper {
    int deleteByPrimaryKey(String urid);

    int insert(TBSCHEDULESTRATEGY record);

    int insertSelective(TBSCHEDULESTRATEGY record);

    TBSCHEDULESTRATEGY selectByPrimaryKey(String urid);

    int updateByPrimaryKeySelective(TBSCHEDULESTRATEGY record);

    int updateByPrimaryKey(TBSCHEDULESTRATEGY record);
}