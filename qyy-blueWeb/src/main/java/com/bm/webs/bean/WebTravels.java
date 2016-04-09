package com.bm.webs.bean; 

import java.util.Date;

public class WebTravels {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  title;//游记（或其他）标题
    private  Integer  travelType;//游记的类型（待整理）
    private  Long  atAddr;//所在地区
    private  Long  userId;//用户id


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
	public void setTitle( String  title){
        this.title=title;
    }
    public  String  getTitle(){
        return this.title;
    }
    public void setTravelType( Integer  travelType){
        this.travelType=travelType;
    }
    public  Integer  getTravelType(){
        return this.travelType;
    }
    public void setAtAddr( Long  atAddr){
        this.atAddr=atAddr;
    }
    public  Long  getAtAddr(){
        return this.atAddr;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
}
