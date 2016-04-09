package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthTripTraffic {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  tripId;//行程的id
    private  Long  toolsId;//交通工具的id
    private  Integer  usedHour;//使用小时数
    private  Integer  usedMinute;//使用的分钟数
    private  Integer  toolsOrder;//排序


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
    public void setToolsId( Long  toolsId){
        this.toolsId=toolsId;
    }
    public  Long  getToolsId(){
        return this.toolsId;
    }
    public void setUsedHour( Integer  usedHour){
        this.usedHour=usedHour;
    }
    public  Integer  getUsedHour(){
        return this.usedHour;
    }
    public void setUsedMinute( Integer  usedMinute){
        this.usedMinute=usedMinute;
    }
    public  Integer  getUsedMinute(){
        return this.usedMinute;
    }
    public void setToolsOrder( Integer  toolsOrder){
        this.toolsOrder=toolsOrder;
    }
    public  Integer  getToolsOrder(){
        return this.toolsOrder;
    }
}
