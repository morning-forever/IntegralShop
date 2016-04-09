package com.bm.webs.bean; 

import java.util.Date;

public class WebUserLogin {
    private  Long  id;//id
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  userId;//前台用户id
    private  String  loginId;//登录名
    private  String  loginPwd;//登录密码
    private  String  loginIp;//登录ip
    private  String  loginPrevIp;//上一次登录的ip
    private  Date  loginPrevTime;//上一次登录时间


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
  
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setLoginId( String  loginId){
        this.loginId=loginId;
    }
    public  String  getLoginId(){
        return this.loginId;
    }
    public void setLoginPwd( String  loginPwd){
        this.loginPwd=loginPwd;
    }
    public  String  getLoginPwd(){
        return this.loginPwd;
    }
    public void setLoginIp( String  loginIp){
        this.loginIp=loginIp;
    }
    public  String  getLoginIp(){
        return this.loginIp;
    }
    public void setLoginPrevIp( String  loginPrevIp){
        this.loginPrevIp=loginPrevIp;
    }
    public  String  getLoginPrevIp(){
        return this.loginPrevIp;
    }
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getLoginPrevTime() {
		return loginPrevTime;
	}
	public void setLoginPrevTime(Date loginPrevTime) {
		this.loginPrevTime = loginPrevTime;
	}

   
}
