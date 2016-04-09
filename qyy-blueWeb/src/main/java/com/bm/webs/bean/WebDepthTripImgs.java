package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthTripImgs {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  tripId;//行程id
    private  String  remark;//文字说明
    private  Integer  usedHour;//使用时间的小时数
    private  Integer  usedMinute;//使用时间的分钟数
    private  Integer  imgOrder;//排序


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
    public void setRemark( String  remark){
        this.remark=remark;
    }
    public  String  getRemark(){
        return this.remark;
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
    public void setImgOrder( Integer  imgOrder){
        this.imgOrder=imgOrder;
    }
    public  Integer  getImgOrder(){
        return this.imgOrder;
    }
}
