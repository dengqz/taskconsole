package com.taskconsole.dto;

import java.math.BigDecimal;

public class Organization {
    private String orgId;

    private String dimension;

    private String orgCode;

    private String orgName;

    private String parentId;

    private String manageId;

    private String positionCode;

    private String orgCate;

    private String orgLevel;

    private BigDecimal orgOrder;

    private String orgPath;

    private String ssoOrgCode;

    private String ssoParentCode;

    private String extId;

    private String remark;

    private BigDecimal status;

    private BigDecimal tenantId;

    private String shortorgname;

    private String createdate;

    private String lastmodifiedon;

    private Double amountlimits;

    private Double platformsupplierrate;

    private Double corecompanyrate;

    private String areaid;

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getDimension() {
        return dimension;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension == null ? null : dimension.trim();
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode == null ? null : orgCode.trim();
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getManageId() {
        return manageId;
    }

    public void setManageId(String manageId) {
        this.manageId = manageId == null ? null : manageId.trim();
    }

    public String getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode == null ? null : positionCode.trim();
    }

    public String getOrgCate() {
        return orgCate;
    }

    public void setOrgCate(String orgCate) {
        this.orgCate = orgCate == null ? null : orgCate.trim();
    }

    public String getOrgLevel() {
        return orgLevel;
    }

    public void setOrgLevel(String orgLevel) {
        this.orgLevel = orgLevel == null ? null : orgLevel.trim();
    }

    public BigDecimal getOrgOrder() {
        return orgOrder;
    }

    public void setOrgOrder(BigDecimal orgOrder) {
        this.orgOrder = orgOrder;
    }

    public String getOrgPath() {
        return orgPath;
    }

    public void setOrgPath(String orgPath) {
        this.orgPath = orgPath == null ? null : orgPath.trim();
    }

    public String getSsoOrgCode() {
        return ssoOrgCode;
    }

    public void setSsoOrgCode(String ssoOrgCode) {
        this.ssoOrgCode = ssoOrgCode == null ? null : ssoOrgCode.trim();
    }

    public String getSsoParentCode() {
        return ssoParentCode;
    }

    public void setSsoParentCode(String ssoParentCode) {
        this.ssoParentCode = ssoParentCode == null ? null : ssoParentCode.trim();
    }

    public String getExtId() {
        return extId;
    }

    public void setExtId(String extId) {
        this.extId = extId == null ? null : extId.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public BigDecimal getStatus() {
        return status;
    }

    public void setStatus(BigDecimal status) {
        this.status = status;
    }

    public BigDecimal getTenantId() {
        return tenantId;
    }

    public void setTenantId(BigDecimal tenantId) {
        this.tenantId = tenantId;
    }

    public String getShortorgname() {
        return shortorgname;
    }

    public void setShortorgname(String shortorgname) {
        this.shortorgname = shortorgname == null ? null : shortorgname.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }

    public String getLastmodifiedon() {
        return lastmodifiedon;
    }

    public void setLastmodifiedon(String lastmodifiedon) {
        this.lastmodifiedon = lastmodifiedon == null ? null : lastmodifiedon.trim();
    }

    public Double getAmountlimits() {
        return amountlimits;
    }

    public void setAmountlimits(Double amountlimits) {
        this.amountlimits = amountlimits;
    }

    public Double getPlatformsupplierrate() {
        return platformsupplierrate;
    }

    public void setPlatformsupplierrate(Double platformsupplierrate) {
        this.platformsupplierrate = platformsupplierrate;
    }

    public Double getCorecompanyrate() {
        return corecompanyrate;
    }

    public void setCorecompanyrate(Double corecompanyrate) {
        this.corecompanyrate = corecompanyrate;
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid == null ? null : areaid.trim();
    }
}