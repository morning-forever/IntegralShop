package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleScenic {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  names;//景区名称
    private  Long  atAddrId;//地址id
    private  String  addrDetail;//详细地址
    private  Integer  star;//星级
    private  String  openStart;//开放时间开始
    private  String  openEnd;//开放时间关闭
    private  Integer  recomHour;//推荐小时
    private  Integer  recomMinute;//推荐分钟
    private  Double priceAdult;//成人价
    private  Double priceChild;//儿童价
    private  String  summary;//景区介绍
    private  Integer  isMust;//是否必须(1：否   0：是)


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
 
    public void setNames( String  names){
        this.names=names;
    }
    public  String  getNames(){
        return this.names;
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
    public void setStar( Integer  star){
        this.star=star;
    }
    public  Integer  getStar(){
        return this.star;
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
    public void setRecomHour( Integer  recomHour){
        this.recomHour=recomHour;
    }
    public  Integer  getRecomHour(){
        return this.recomHour;
    }
    public void setRecomMinute( Integer  recomMinute){
        this.recomMinute=recomMinute;
    }
    public  Integer  getRecomMinute(){
        return this.recomMinute;
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
	public Double getPriceAdult() {
		return priceAdult;
	}
	public void setPriceAdult(Double priceAdult) {
		this.priceAdult = priceAdult;
	}
	public Double getPriceChild() {
		return priceChild;
	}
	public void setPriceChild(Double priceChild) {
		this.priceChild = priceChild;
	}
	public void setSummary( String  summary){
        this.summary=summary;
    }
    public  String  getSummary(){
        return this.summary;
    }
    public void setIsMust( Integer  isMust){
        this.isMust=isMust;
    }
    public  Integer  getIsMust(){
        return this.isMust;
    }
}
