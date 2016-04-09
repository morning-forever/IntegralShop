package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthTrip {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  currentDay;//当前行程中的天（从0开始）
    private  String  dayType;//天数类型（启程：start  行程中：ing  结束：end）
    private  String  depthId;//所属深度游的id


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
	public void setCurrentDay( String  currentDay){
        this.currentDay=currentDay;
    }
    public  String  getCurrentDay(){
        return this.currentDay;
    }
    public void setDayType( String  dayType){
        this.dayType=dayType;
    }
    public  String  getDayType(){
        return this.dayType;
    }
    public void setDepthId( String  depthId){
        this.depthId=depthId;
    }
    public  String  getDepthId(){
        return this.depthId;
    }
}
