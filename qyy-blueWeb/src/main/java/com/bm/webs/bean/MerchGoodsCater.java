package com.bm.webs.bean; 

import java.util.Date;

public class MerchGoodsCater {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  meal;//套餐
    private  Double originalPrice;//原价
    private  Double currentPrice;//现价
    private  Long  goodsId;//商品id


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
    
    public void setMeal( String  meal){
        this.meal=meal;
    }
    public  String  getMeal(){
        return this.meal;
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
	public void setGoodsId( Long  goodsId){
        this.goodsId=goodsId;
    }
    public  Long  getGoodsId(){
        return this.goodsId;
    }
}
