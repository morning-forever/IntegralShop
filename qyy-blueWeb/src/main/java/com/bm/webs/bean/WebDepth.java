package com.bm.webs.bean; 

import java.util.Date;

public class WebDepth {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  subjectId;//主题名称
    private  String  atAddr;//所在地，貌似有多个
    private  Integer  days;//行程天数
    private  Double adultPrice;//成人价格
    private  Double childPrice;//儿童价格
    private  Integer  expon;//推荐指数
    private  Integer  azimuthId;//方位
    private  Long  adminUserId;//后台用户id
    private  String subject;


    public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
   
    public Double getAdultPrice() {
		return adultPrice;
	}
	public Double getChildPrice() {
		return childPrice;
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
	public void setAdultPrice(Double adultPrice) {
		this.adultPrice = adultPrice;
	}
	public void setChildPrice(Double childPrice) {
		this.childPrice = childPrice;
	}
	public void setSubjectId( Long  subjectId){
        this.subjectId=subjectId;
    }
    public  Long  getSubjectId(){
        return this.subjectId;
    }
    public void setAtAddr( String  atAddr){
        this.atAddr=atAddr;
    }
    public  String  getAtAddr(){
        return this.atAddr;
    }
    public void setDays( Integer  days){
        this.days=days;
    }
    public  Integer  getDays(){
        return this.days;
    }
    
    public void setExpon( Integer  expon){
        this.expon=expon;
    }
    public  Integer  getExpon(){
        return this.expon;
    }
    public void setAzimuthId( Integer  azimuthId){
        this.azimuthId=azimuthId;
    }
    public  Integer  getAzimuthId(){
        return this.azimuthId;
    }
    public void setAdminUserId( Long  adminUserId){
        this.adminUserId=adminUserId;
    }
    public  Long  getAdminUserId(){
        return this.adminUserId;
    }
}
