package com.bm.webs.bean; 

import java.util.Date;

public class WebPriceSearch {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  Date updateTime;//
    private  Double priceStart;//价格开始
    private  Double priceEnd;//价格结束
    private  String  depict;//描述（主要是存这个字段，然后进行转换为prices字段存值）
    private  String  searchType;//酒店     景区   餐饮    装备  深度   车辆


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
	public Double getPriceStart() {
		return priceStart;
	}
	public void setPriceStart(Double priceStart) {
		this.priceStart = priceStart;
	}
	public Double getPriceEnd() {
		return priceEnd;
	}
	public void setPriceEnd(Double priceEnd) {
		this.priceEnd = priceEnd;
	}
	public java.sql.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.sql.Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public void setDepict( String  depict){
        this.depict=depict;
    }
    public  String  getDepict(){
        return this.depict;
    }
    public void setSearchType( String  searchType){
        this.searchType=searchType;
    }
    public  String  getSearchType(){
        return this.searchType;
    }
}
