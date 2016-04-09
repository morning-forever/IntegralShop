package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthPrices {
    private  Long  id;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Double adultPrice;//成人价
    private  Double childPrice;//儿童价
    private  Date  priceTime;//价格时间
    private  Integer  isOdds;//是否特惠（1：否，0：是）所有的这种字段没有标明都是如此
    private  Long  depthId;//深度游的价格时间


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
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
	public Double getAdultPrice() {
		return adultPrice;
	}
	public void setAdultPrice(Double adultPrice) {
		this.adultPrice = adultPrice;
	}
	public Double getChildPrice() {
		return childPrice;
	}
	public void setChildPrice(Double childPrice) {
		this.childPrice = childPrice;
	}
	public Date getPriceTime() {
		return priceTime;
	}
	public void setPriceTime(Date priceTime) {
		this.priceTime = priceTime;
	}
	public void setIsOdds( Integer  isOdds){
        this.isOdds=isOdds;
    }
    public  Integer  getIsOdds(){
        return this.isOdds;
    }
    public void setDepthId( Long  depthId){
        this.depthId=depthId;
    }
    public  Long  getDepthId(){
        return this.depthId;
    }
}
