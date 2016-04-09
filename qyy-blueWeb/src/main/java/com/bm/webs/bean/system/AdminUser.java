package com.bm.webs.bean.system; 

import java.util.Date;

public class AdminUser {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  username;//姓名
    private  String  phone;//
    private  Integer  accountState;//账号状态（1：无效 --默认   0：有效）
    private  String  roleKey;//
    private  String roleName;
    private String menuKeys;
    private String menuRightModel;
    
    
    
    public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getMenuKeys() {
		return menuKeys;
	}
	public void setMenuKeys(String menuKeys) {
		this.menuKeys = menuKeys;
	}
	public String getMenuRightModel() {
		return menuRightModel;
	}
	public void setMenuRightModel(String menuRightModel) {
		this.menuRightModel = menuRightModel;
	}
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
    public void setCreateTime( Date  createTime){
        this.createTime=createTime;
    }
    public  Date  getCreateTime(){
        return this.createTime;
    }
    
    
    
    public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public void setUsername( String  username){
        this.username=username;
    }
    public  String  getUsername(){
        return this.username;
    }
    public void setPhone( String  phone){
        this.phone=phone;
    }
    public  String  getPhone(){
        return this.phone;
    }
    public void setAccountState( Integer  accountState){
        this.accountState=accountState;
    }
    public  Integer  getAccountState(){
        return this.accountState;
    }
    public void setRoleKey( String  roleKey){
        this.roleKey=roleKey;
    }
    public  String  getRoleKey(){
        return this.roleKey;
    }
}
