package com.bm.webs.bean; 

import java.util.Date;

public class MerchGoodsScenic {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  goodsId;//商品id
    private  Double originalPrice;//原价
    private  Double currentPrice;//现价
    private  Long  atAreaId;//当前地址区的id
    private  String  addrDetail;//详细地址
    private  String  usedExplain;//使用说明
    private  Date  periodStart;//有效期(开始）
    private  Date  periodEnd;//有效期(结束）
    private  Date  timeStart;//使用时间（开始）
    private  Date  timeEnd;//使用时间（结束）
    private String remarks;//有效期备注
    private Date couponTime;//订购卷有效期
    


    public Date getCouponTime() {
		return couponTime;
	}
	public void setCouponTime(Date couponTime) {
		this.couponTime = couponTime;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	public void setAtAreaId( Long  atAreaId){
        this.atAreaId=atAreaId;
    }
    public  Long  getAtAreaId(){
        return this.atAreaId;
    }
    public void setAddrDetail( String  addrDetail){
        this.addrDetail=addrDetail;
    }
    public  String  getAddrDetail(){
        return this.addrDetail;
    }
    public void setUsedExplain( String  usedExplain){
        this.usedExplain=usedExplain;
    }
    public  String  getUsedExplain(){
        return this.usedExplain;
    }
    public void setPeriodStart( Date  periodStart){
        this.periodStart=periodStart;
    }
    public  Date  getPeriodStart(){
        return this.periodStart;
    }
    public void setPeriodEnd( Date  periodEnd){
        this.periodEnd=periodEnd;
    }
    public  Date  getPeriodEnd(){
        return this.periodEnd;
    }
    public void setTimeStart( Date  timeStart){
        this.timeStart=timeStart;
    }
    public  Date  getTimeStart(){
        return this.timeStart;
    }
    public void setTimeEnd( Date  timeEnd){
        this.timeEnd=timeEnd;
    }
    public  Date  getTimeEnd(){
        return this.timeEnd;
    }
}
