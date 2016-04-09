package com.bm.webs.bean; 

import java.util.Date;

public class WebCarAddrs {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  cityId;//城市的id
    private  String  area;//区域
    private  String  store;//门店
    private  String  addrDetail;//具体地址
    private  String  linkTel;//联系电话
    private  String  openStart;//营业时间开始
    private  String  openEnd;//营业时间结束
    private  String  addrType;//地点类型(租车   包车   班车   拼车-start  拼车-end）


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
	public void setCityId( Long  cityId){
        this.cityId=cityId;
    }
    public  Long  getCityId(){
        return this.cityId;
    }
    public void setArea( String  area){
        this.area=area;
    }
    public  String  getArea(){
        return this.area;
    }
    public void setStore( String  store){
        this.store=store;
    }
    public  String  getStore(){
        return this.store;
    }
    public void setAddrDetail( String  addrDetail){
        this.addrDetail=addrDetail;
    }
    public  String  getAddrDetail(){
        return this.addrDetail;
    }
    public void setLinkTel( String  linkTel){
        this.linkTel=linkTel;
    }
    public  String  getLinkTel(){
        return this.linkTel;
    }
    public void setOpenStart( String  openStart){
        this.openStart=openStart;
    }
    public  String  getOpenStart(){
        return this.openStart;
    }
    public void setOpenEnd( String  openEnd){
        this.openEnd=openEnd;
    }
    public  String  getOpenEnd(){
        return this.openEnd;
    }
    public void setAddrType( String  addrType){
        this.addrType=addrType;
    }
    public  String  getAddrType(){
        return this.addrType;
    }
}
