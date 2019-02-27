package com.vicyor.dto;

public class AppInfoDTO {
    private String softwareName;
    private Integer appStatus;
    private Integer appFlatform;
    private Integer levelOne;
    private Integer levelTwo;
    private Integer levelThree;
    private Integer pageNum = 1;
    private Integer devId = 1;
    private Integer appInfoId;

    public Integer getAppInfoId() {
        return this.appInfoId;
    }

    public void setAppInfoId(Integer appInfoId) {
        this.appInfoId = appInfoId;
    }

    public Integer getDevId() {
        return this.devId;
    }

    public void setDevId(Integer devId) {
        this.devId = devId;
    }

    public String getSoftwareName() {
        return this.softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }


    public Integer getLevelOne() {
        return this.levelOne;
    }

    public void setLevelOne(Integer levelOne) {
        this.levelOne = levelOne;
    }

    public Integer getLevelTwo() {
        return this.levelTwo;
    }

    public Integer getAppStatus() {
        return this.appStatus;
    }

    public void setAppStatus(Integer appStatus) {
        this.appStatus = appStatus;
    }

    public Integer getAppFlatform() {
        return this.appFlatform;
    }

    public void setAppFlatform(Integer appFlatform) {
        this.appFlatform = appFlatform;
    }

    public void setLevelTwo(Integer levelTwo) {
        this.levelTwo = levelTwo;
    }

    public Integer getLevelThree() {
        return this.levelThree;
    }

    public void setLevelThree(Integer levelThree) {
        this.levelThree = levelThree;
    }

    public Integer getPageNum() {
        return this.pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public String toString() {
        return "AppInfoDTO{" +
                "softwareName='" + softwareName + '\'' +
                ", appStatus='" + appStatus + '\'' +
                ", appFlatform='" + appFlatform + '\'' +
                ", levelOne=" + levelOne +
                ", levelTwo=" + levelTwo +
                ", levelThree=" + levelThree +
                ", pageNum=" + pageNum +
                '}';
    }
}
