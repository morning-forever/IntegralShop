package com.bm.webs.bean; 

import java.util.Date;

public class MerchGoodsEquip {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Double originalPrice;//原价
    private  Double currentPrice;//现价
    private  Integer  volume;//数量
    private  Long  goodsId;//商品id
    private String spec;


    public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
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
	public void setVolume( Integer  volume){
        this.volume=volume;
    }
    public  Integer  getVolume(){
        return this.volume;
    }
    public void setGoodsId( Long  goodsId){
        this.goodsId=goodsId;
    }
    public  Long  getGoodsId(){
        return this.goodsId;
    }
}
