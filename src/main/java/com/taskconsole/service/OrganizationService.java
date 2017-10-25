package com.taskconsole.service;

import com.taskconsole.dto.Organization;

import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/26<br>
 * <br>
 */
public interface OrganizationService {
    List<Organization> getAllOrg();
    Organization getOrgById(String orgId);
}
