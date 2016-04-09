package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthTripAddrs {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  tripId;//行程天数的id
    private  String  tripAddr;//行程地址
    private  Integer  tripOrder;//行程地点排序


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
	public void setTripId( Long  tripId){
        this.tripId=tripId;
    }
    public  Long  getTripId(){
        return this.tripId;
    }
    public void setTripAddr( String  tripAddr){
        this.tripAddr=tripAddr;
    }
    public  String  getTripAddr(){
        return this.tripAddr;
    }
    public void setTripOrder( Integer  tripOrder){
        this.tripOrder=tripOrder;
    }
    public  Integer  getTripOrder(){
        return this.tripOrder;
    }
}
