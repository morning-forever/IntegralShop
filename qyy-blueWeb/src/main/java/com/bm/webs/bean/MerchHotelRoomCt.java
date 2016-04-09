package com.bm.webs.bean; 

import java.util.Date;

public class MerchHotelRoomCt {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  roomName;//房型
    private  Integer  roomCount;//房间数量
    private  Long  hotelId;//酒店id


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
	public void setRoomName( String  roomName){
        this.roomName=roomName;
    }
    public  String  getRoomName(){
        return this.roomName;
    }
    public void setRoomCount( Integer  roomCount){
        this.roomCount=roomCount;
    }
    public  Integer  getRoomCount(){
        return this.roomCount;
    }
    public void setHotelId( Long  hotelId){
        this.hotelId=hotelId;
    }
    public  Long  getHotelId(){
        return this.hotelId;
    }
}
