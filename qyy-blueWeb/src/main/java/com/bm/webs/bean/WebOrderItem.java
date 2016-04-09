package com.bm.webs.bean; 

import java.util.Date;

public class WebOrderItem {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  goodsId;//购买的商品的id
    private  Integer  goodsCount;//购买的数量
    private  Double realPrice;//购买时真实的价格(两位小数)
    private  String  couponNo;//订购劵号()
    private  Integer  isSafe;//是否需要保险（1：不需要   0：需要）
    private  Double safePrice;//单个保险费用


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
    public void setGoodsCount( Integer  goodsCount){
        this.goodsCount=goodsCount;
    }
    public  Integer  getGoodsCount(){
        return this.goodsCount;
    }
    
    public void setCouponNo( String  couponNo){
        this.couponNo=couponNo;
    }
    public  String  getCouponNo(){
        return this.couponNo;
    }
    public void setIsSafe( Integer  isSafe){
        this.isSafe=isSafe;
    }
    public  Integer  getIsSafe(){
        return this.isSafe;
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
	public Double getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(Double realPrice) {
		this.realPrice = realPrice;
	}
	public Double getSafePrice() {
		return safePrice;
	}
	public void setSafePrice(Double safePrice) {
		this.safePrice = safePrice;
	}
   
}
