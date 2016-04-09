package com.bm.webs.bean; 

import java.util.Date;

public class WebCar {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  carCard;//车牌号
    private Long sysId;//车系 
    private  Long  brandId;//品牌
    private  Integer  carYear;//车子出厂年份，从2000年开始
    private  String  carConfigure;//车辆配置
    private  Integer  counts;//拥有车辆数
    private  Integer  isShelves;//是否上架（1：否 （默认）    0：是）


    public Long getSysId() {
		return sysId;
	}
	public void setSysId(Long sysId) {
		this.sysId = sysId;
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
	public void setCarCard( String  carCard){
        this.carCard=carCard;
    }
    public  String  getCarCard(){
        return this.carCard;
    }
    public void setBrandId( Long  brandId){
        this.brandId=brandId;
    }
    public  Long  getBrandId(){
        return this.brandId;
    }
    public void setCarYear( Integer  carYear){
        this.carYear=carYear;
    }
    public  Integer  getCarYear(){
        return this.carYear;
    }
    public void setCarConfigure( String  carConfigure){
        this.carConfigure=carConfigure;
    }
    public  String  getCarConfigure(){
        return this.carConfigure;
    }
    public void setCounts( Integer  counts){
        this.counts=counts;
    }
    public  Integer  getCounts(){
        return this.counts;
    }
    public void setIsShelves( Integer  isShelves){
        this.isShelves=isShelves;
    }
    public  Integer  getIsShelves(){
        return this.isShelves;
    }
}
