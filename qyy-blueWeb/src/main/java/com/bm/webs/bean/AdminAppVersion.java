package com.bm.webs.bean; 

import java.util.Date;

public class AdminAppVersion {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  Date updateTime;//
    private  String  appSys;//手机端（android|ios）
    private  String  clientIssueVersion;//客户端发行版本
    private  String  clientInsideVersion;//
    private  Double  clientSize;//
    private  Integer  updateType;//更新属性（1：非强制更新 0：强制更新）
    private  String  clientUrl;//
    private  Integer  issueChannle;//发布渠道（具体待定）
    private  Integer  versionType;//版本属性（1：灰度版  0：正式版）
    private  String  appDesc;//应用描述
    private  String  updateDesc;//更新描述


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
    }
    public void setState( String  state){
        this.state=state;
    }
    public  String  getState(){
        return this.state;
    }
    public void setCreateTime( java.sql.Date  createTime){
        this.createTime=createTime;
    }
    public  java.sql.Date  getCreateTime(){
        return this.createTime;
    }
   
    
    
    public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public void setAppSys( String  appSys){
        this.appSys=appSys;
    }
    public  String  getAppSys(){
        return this.appSys;
    }
    public void setClientIssueVersion( String  clientIssueVersion){
        this.clientIssueVersion=clientIssueVersion;
    }
    public  String  getClientIssueVersion(){
        return this.clientIssueVersion;
    }
    public void setClientInsideVersion( String  clientInsideVersion){
        this.clientInsideVersion=clientInsideVersion;
    }
    public  String  getClientInsideVersion(){
        return this.clientInsideVersion;
    }
    public void setClientSize( Double  clientSize){
        this.clientSize=clientSize;
    }
    public  Double  getClientSize(){
        return this.clientSize;
    }
    public void setUpdateType( Integer  updateType){
        this.updateType=updateType;
    }
    public  Integer  getUpdateType(){
        return this.updateType;
    }
    public void setClientUrl( String  clientUrl){
        this.clientUrl=clientUrl;
    }
    public  String  getClientUrl(){
        return this.clientUrl;
    }
    public void setIssueChannle( Integer  issueChannle){
        this.issueChannle=issueChannle;
    }
    public  Integer  getIssueChannle(){
        return this.issueChannle;
    }
    public void setVersionType( Integer  versionType){
        this.versionType=versionType;
    }
    public  Integer  getVersionType(){
        return this.versionType;
    }
    public void setAppDesc( String  appDesc){
        this.appDesc=appDesc;
    }
    public  String  getAppDesc(){
        return this.appDesc;
    }
    public void setUpdateDesc( String  updateDesc){
        this.updateDesc=updateDesc;
    }
    public  String  getUpdateDesc(){
        return this.updateDesc;
    }
}
