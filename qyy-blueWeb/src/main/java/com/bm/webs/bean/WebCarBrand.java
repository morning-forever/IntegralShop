package com.bm.webs.bean; 

import java.util.Date;

public class WebCarBrand {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  brand;//品牌
    private  String  carSys;//车系
    private  String  brandType;//品牌类别（租车，包车/拼车，班车）


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
	public void setBrand( String  brand){
        this.brand=brand;
    }
    public  String  getBrand(){
        return this.brand;
    }
    public void setCarSys( String  carSys){
        this.carSys=carSys;
    }
    public  String  getCarSys(){
        return this.carSys;
    }
    public void setBrandType( String  brandType){
        this.brandType=brandType;
    }
    public  String  getBrandType(){
        return this.brandType;
    }
}
