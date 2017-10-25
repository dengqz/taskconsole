package com.taskconsole.dao;

import com.taskconsole.dto.Organization;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrganizationMapper {
    int deleteByPrimaryKey(String orgId);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(String orgId);

    List<Organization> selectAllOrg();

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);
}