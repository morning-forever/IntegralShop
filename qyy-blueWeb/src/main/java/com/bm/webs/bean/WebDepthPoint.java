package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthPoint {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  pointName;//亮点名称
    private  Long  atAddrId;//所在地id
    private  String  addrDetail;//详细地址
    private  Integer  tourHour;//游览小时数
    private  Integer  tourMinute;//游览分钟数
    private  String  summary;//概述
    private  String  attention1;//注意1
    private  String  attention2;//
    private  String  attention3;//
    private  String  traffic;//交通状况
    private  String  feature;//特色推荐
    private  String  other1;//其他1
    private  String  other2;//其他2
    private  String  other3;//其他3


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
	public void setPointName( String  pointName){
        this.pointName=pointName;
    }
    public  String  getPointName(){
        return this.pointName;
    }
    public void setAtAddrId( Long  atAddrId){
        this.atAddrId=atAddrId;
    }
    public  Long  getAtAddrId(){
        return this.atAddrId;
    }
    public void setAddrDetail( String  addrDetail){
        this.addrDetail=addrDetail;
    }
    public  String  getAddrDetail(){
        return this.addrDetail;
    }
    public void setTourHour( Integer  tourHour){
        this.tourHour=tourHour;
    }
    public  Integer  getTourHour(){
        return this.tourHour;
    }
    public void setTourMinute( Integer  tourMinute){
        this.tourMinute=tourMinute;
    }
    public  Integer  getTourMinute(){
        return this.tourMinute;
    }
    public void setSummary( String  summary){
        this.summary=summary;
    }
    public  String  getSummary(){
        return this.summary;
    }
    public void setAttention1( String  attention1){
        this.attention1=attention1;
    }
    public  String  getAttention1(){
        return this.attention1;
    }
    public void setAttention2( String  attention2){
        this.attention2=attention2;
    }
    public  String  getAttention2(){
        return this.attention2;
    }
    public void setAttention3( String  attention3){
        this.attention3=attention3;
    }
    public  String  getAttention3(){
        return this.attention3;
    }
    public void setTraffic( String  traffic){
        this.traffic=traffic;
    }
    public  String  getTraffic(){
        return this.traffic;
    }
    public void setFeature( String  feature){
        this.feature=feature;
    }
    public  String  getFeature(){
        return this.feature;
    }
    public void setOther1( String  other1){
        this.other1=other1;
    }
    public  String  getOther1(){
        return this.other1;
    }
    public void setOther2( String  other2){
        this.other2=other2;
    }
    public  String  getOther2(){
        return this.other2;
    }
    public void setOther3( String  other3){
        this.other3=other3;
    }
    public  String  getOther3(){
        return this.other3;
    }
}
