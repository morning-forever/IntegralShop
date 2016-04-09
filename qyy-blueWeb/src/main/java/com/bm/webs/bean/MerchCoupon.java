package com.bm.webs.bean; 

import java.util.Date;

public class MerchCoupon {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Long  merchUserId;//商户id
    private  Long  goodsId;//商品的id
    private  Long  goodsCount;//这张劵包含的数量
    private  Integer  isUsed;//是否使用过（1：未使用   0：已使用）
    private  Long  orderItemId;//需要跟order_item绑定


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
    public void setCreateTime(Date  createTime){
        this.createTime=createTime;
    }
    public  Date  getCreateTime(){
        return this.createTime;
    }
    public void setMerchUserId( Long  merchUserId){
        this.merchUserId=merchUserId;
    }
    public  Long  getMerchUserId(){
        return this.merchUserId;
    }
    public void setGoodsId( Long  goodsId){
        this.goodsId=goodsId;
    }
    public  Long  getGoodsId(){
        return this.goodsId;
    }
    public void setGoodsCount( Long  goodsCount){
        this.goodsCount=goodsCount;
    }
    public  Long  getGoodsCount(){
        return this.goodsCount;
    }
    public void setIsUsed( Integer  isUsed){
        this.isUsed=isUsed;
    }
    public  Integer  getIsUsed(){
        return this.isUsed;
    }
    public void setOrderItemId( Long  orderItemId){
        this.orderItemId=orderItemId;
    }
    public  Long  getOrderItemId(){
        return this.orderItemId;
    }
}
