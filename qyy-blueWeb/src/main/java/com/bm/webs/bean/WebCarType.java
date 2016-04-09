package com.bm.webs.bean; 

import java.util.Date;

public class WebCarType {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  carType;//车辆类型
    private  String  typeType;//类型（租车，包车）


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
	public void setCarType( String  carType){
        this.carType=carType;
    }
    public  String  getCarType(){
        return this.carType;
    }
    public void setTypeType( String  typeType){
        this.typeType=typeType;
    }
    public  String  getTypeType(){
        return this.typeType;
    }
}
