package com.bm.webs.bean; 

import java.util.Date;

public class WebCarRoute {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  carId;//car的id
    private  Long  fromAddrId;//发车地点（web_car_addr）
    private  Long  toAddrId;//目的地（web_car_addr）
    private  Double price;//价格
    private  String  fromTime;//出发时间
    private  String  toTime;//到达时间
    private  Integer  isShelves;//是否上架（1：否 （默认）    0：是）
    private  String  kilometrers;//公里数


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
   
    public void setCarId( Long  carId){
        this.carId=carId;
    }
    public  Long  getCarId(){
        return this.carId;
    }
    public void setFromAddrId( Long  fromAddrId){
        this.fromAddrId=fromAddrId;
    }
    public  Long  getFromAddrId(){
        return this.fromAddrId;
    }
    public void setToAddrId( Long  toAddrId){
        this.toAddrId=toAddrId;
    }
    public  Long  getToAddrId(){
        return this.toAddrId;
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public void setFromTime( String  fromTime){
        this.fromTime=fromTime;
    }
    public  String  getFromTime(){
        return this.fromTime;
    }
    public void setToTime( String  toTime){
        this.toTime=toTime;
    }
    public  String  getToTime(){
        return this.toTime;
    }
    public void setIsShelves( Integer  isShelves){
        this.isShelves=isShelves;
    }
    public  Integer  getIsShelves(){
        return this.isShelves;
    }
    public void setKilometrers( String  kilometrers){
        this.kilometrers=kilometrers;
    }
    public  String  getKilometrers(){
        return this.kilometrers;
    }
}
