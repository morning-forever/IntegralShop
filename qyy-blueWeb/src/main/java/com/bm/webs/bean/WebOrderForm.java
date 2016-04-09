package com.bm.webs.bean; 

import java.util.Date;

public class WebOrderForm {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  orderType;//订单类型
    private  String  orderCode;//订单编号(yyyyMMddHHmmss+userId+随机3)
    private  String  payType;//支付类型（alipay：支付宝   unionpay:银联）
    private  String  payOrderId;//支付时间
    private  java.sql.Date  payTime;//支付时间
    private  String  orderState;//订单状态（WAITPAY:等待付款    CLOSED:交易关闭  REFUNDING:退款中    REFUNDED:退款完成  CONSUME:已消费  UNCONSUME:未消费）
    private  Integer  isInvoice;//是否需要发票(1:不需要   0：需要)
    private  Long  userId;//用户id
    private  Long  merchUserId;//商家用户id


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
	public void setOrderType( String  orderType){
        this.orderType=orderType;
    }
    public  String  getOrderType(){
        return this.orderType;
    }
    public void setOrderCode( String  orderCode){
        this.orderCode=orderCode;
    }
    public  String  getOrderCode(){
        return this.orderCode;
    }
    public void setPayType( String  payType){
        this.payType=payType;
    }
    public  String  getPayType(){
        return this.payType;
    }
    public void setPayOrderId( String  payOrderId){
        this.payOrderId=payOrderId;
    }
    public  String  getPayOrderId(){
        return this.payOrderId;
    }
    public void setPayTime( java.sql.Date  payTime){
        this.payTime=payTime;
    }
    public  java.sql.Date  getPayTime(){
        return this.payTime;
    }
    public void setOrderState( String  orderState){
        this.orderState=orderState;
    }
    public  String  getOrderState(){
        return this.orderState;
    }
    public void setIsInvoice( Integer  isInvoice){
        this.isInvoice=isInvoice;
    }
    public  Integer  getIsInvoice(){
        return this.isInvoice;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setMerchUserId( Long  merchUserId){
        this.merchUserId=merchUserId;
    }
    public  Long  getMerchUserId(){
        return this.merchUserId;
    }
}
