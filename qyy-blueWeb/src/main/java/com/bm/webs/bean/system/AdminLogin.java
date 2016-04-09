package com.bm.webs.bean.system; 

import java.util.Date;

public class AdminLogin {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private   Date udpateTime;//
    private  String  loginId;//
    private  String  loginPwd;//登录密码（）
    private  String  adminType;//用户类型（商户：merch , 管理员：admin--默认）
    private  Long  adminId;//后台管理用户的id


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
   
    public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUdpateTime() {
		return udpateTime;
	}
	public void setUdpateTime(Date udpateTime) {
		this.udpateTime = udpateTime;
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
    public void setAdminType( String  adminType){
        this.adminType=adminType;
    }
    public  String  getAdminType(){
        return this.adminType;
    }
    public void setAdminId( Long  adminId){
        this.adminId=adminId;
    }
    public  Long  getAdminId(){
        return this.adminId;
    }
}
