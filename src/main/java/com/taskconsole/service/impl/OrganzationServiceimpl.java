package com.taskconsole.service.impl;

import com.taskconsole.dao.OrganizationMapper;
import com.taskconsole.dto.Organization;
import com.taskconsole.service.OrganizationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/26<br>
 * <br>
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrganzationServiceimpl implements OrganizationService {

    @Resource
    private OrganizationMapper organizationMapper;

    @Override
    public List<Organization> getAllOrg() {
        return organizationMapper.selectAllOrg();
    }

    @Override
    public Organization getOrgById(String orgId) {
        return organizationMapper.selectByPrimaryKey(orgId);
    }
}
