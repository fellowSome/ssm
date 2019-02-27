package com.vicyor.pojo;


import java.util.Date;
import java.util.List;

public class DevUser {
    private Long id;

    private String devCode;

    private String devName;

    private String devPassword;

    private String devEmail;

    private String devInfo;

    private Long createdBy;

    private Date creationDate;

    private Long modifyBy;

    private Date modifyDate;
    private List<AppInfo> appinfos;
    private byte[] picData;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDevCode() {
        return this.devCode;
    }

    public void setDevCode(String devCode) {
        this.devCode = devCode;
    }

    public String getDevName() {
        return this.devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public String getDevPassword() {
        return this.devPassword;
    }

    public void setDevPassword(String devPassword) {
        this.devPassword = devPassword;
    }

    public String getDevEmail() {
        return this.devEmail;
    }

    public void setDevEmail(String devEmail) {
        this.devEmail = devEmail;
    }

    public String getDevInfo() {
        return this.devInfo;
    }

    public void setDevInfo(String devInfo) {
        this.devInfo = devInfo;
    }

    public Long getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getModifyBy() {
        return this.modifyBy;
    }

    public void setModifyBy(Long modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return this.modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public List<AppInfo> getAppinfos() {
        return this.appinfos;
    }

    public void setAppinfos(List<AppInfo> appinfos) {
        this.appinfos = appinfos;
    }

    public byte[] getPicData() {
        return this.picData;
    }

    public void setPicData(byte[] picData) {
        this.picData = picData;
    }
}