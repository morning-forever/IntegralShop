package com.bm.webs.bean; 

import java.util.Date;

public class MerchGoodsHotel {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  goodsId;//商品id
    private  Long  roomId;//房型id
    private  Double originalPrice;//原价
    private  Double currentPrice;//当前价
    private  Integer  isBreakfast;//是否有早餐（1：没有    0：有）
    private  String  usedExplain;//使用说明
    private  String  notice;//入住须知
    private String roomName;//房型名(套餐名)
    private Integer roomNumber;//房间数
    private Date timeStart;//使用开始时间
    private Date timeEnd;//使用结束时间


    public Date getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}
	public Date getTimeEnd() {
		return timeEnd;
	}
	public void setTimeEnd(Date timeEnd) {
		this.timeEnd = timeEnd;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Integer getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
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
   
    public void setGoodsId( Long  goodsId){
        this.goodsId=goodsId;
    }
    public  Long  getGoodsId(){
        return this.goodsId;
    }
    public void setRoomId( Long  roomId){
        this.roomId=roomId;
    }
    public  Long  getRoomId(){
        return this.roomId;
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
	public Double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(Double originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Double getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Double currentPrice) {
		this.currentPrice = currentPrice;
	}
	public void setIsBreakfast( Integer  isBreakfast){
        this.isBreakfast=isBreakfast;
    }
    public  Integer  getIsBreakfast(){
        return this.isBreakfast;
    }
    public void setUsedExplain( String  usedExplain){
        this.usedExplain=usedExplain;
    }
    public  String  getUsedExplain(){
        return this.usedExplain;
    }
    public void setNotice( String  notice){
        this.notice=notice;
    }
    public  String  getNotice(){
        return this.notice;
    }
}
