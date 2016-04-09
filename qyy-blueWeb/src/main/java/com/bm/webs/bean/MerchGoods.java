package com.bm.webs.bean; 

import java.util.Date;

public class MerchGoods {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private String number;//商品编号
    private  String  title;//商品标题
    private  String  subtitle;//商品副标题
    private  String  goodsType;//商品类型（scenic：景点   hotel:酒店   cater：餐饮  equip：装备）
    private  Integer  salesVolume;//销售数量
    private  Integer  usedVolume;//消费数量（使用数量）
    private  String  reminder;//温馨提示
    private  String  detailedInfo;//详细信息
    private  Integer  isShelves;//是否上架（1：不   0：上）
    private  Long  merchUserId;//商家用户id


    public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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
	public void setTitle( String  title){
        this.title=title;
    }
    public  String  getTitle(){
        return this.title;
    }
    public void setSubtitle( String  subtitle){
        this.subtitle=subtitle;
    }
    public  String  getSubtitle(){
        return this.subtitle;
    }
    public void setGoodsType( String  goodsType){
        this.goodsType=goodsType;
    }
    public  String  getGoodsType(){
        return this.goodsType;
    }
    public void setSalesVolume( Integer  salesVolume){
        this.salesVolume=salesVolume;
    }
    public  Integer  getSalesVolume(){
        return this.salesVolume;
    }
    public void setUsedVolume( Integer  usedVolume){
        this.usedVolume=usedVolume;
    }
    public  Integer  getUsedVolume(){
        return this.usedVolume;
    }
    public void setReminder( String  reminder){
        this.reminder=reminder;
    }
    public  String  getReminder(){
        return this.reminder;
    }
    public void setDetailedInfo( String  detailedInfo){
        this.detailedInfo=detailedInfo;
    }
    public  String  getDetailedInfo(){
        return this.detailedInfo;
    }
    public void setIsShelves( Integer  isShelves){
        this.isShelves=isShelves;
    }
    public  Integer  getIsShelves(){
        return this.isShelves;
    }
    public void setMerchUserId( Long  merchUserId){
        this.merchUserId=merchUserId;
    }
    public  Long  getMerchUserId(){
        return this.merchUserId;
    }
}
