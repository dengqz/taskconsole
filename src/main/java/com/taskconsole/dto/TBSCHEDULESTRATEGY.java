package com.taskconsole.dto;

import java.math.BigDecimal;

public class TBSCHEDULESTRATEGY {
    private String urid;

    private String strategyname;

    private String kind;

    private String taskname;

    private String taskparameter;

    private BigDecimal numofsingleserver;

    private BigDecimal assignnum;

    private String iplist;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid == null ? null : urid.trim();
    }

    public String getStrategyname() {
        return strategyname;
    }

    public void setStrategyname(String strategyname) {
        this.strategyname = strategyname == null ? null : strategyname.trim();
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind == null ? null : kind.trim();
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname == null ? null : taskname.trim();
    }

    public String getTaskparameter() {
        return taskparameter;
    }

    public void setTaskparameter(String taskparameter) {
        this.taskparameter = taskparameter == null ? null : taskparameter.trim();
    }

    public BigDecimal getNumofsingleserver() {
        return numofsingleserver;
    }

    public void setNumofsingleserver(BigDecimal numofsingleserver) {
        this.numofsingleserver = numofsingleserver;
    }

    public BigDecimal getAssignnum() {
        return assignnum;
    }

    public void setAssignnum(BigDecimal assignnum) {
        this.assignnum = assignnum;
    }

    public String getIplist() {
        return iplist;
    }

    public void setIplist(String iplist) {
        this.iplist = iplist == null ? null : iplist.trim();
    }
}