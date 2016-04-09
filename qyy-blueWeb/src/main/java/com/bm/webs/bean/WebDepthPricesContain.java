package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthPricesContain {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  containType;//类型(机票    酒店   观光)
    private  String  fromAddr;//出发地
    private  String  toAddr;//到达地
    private  String  checkDay;//入住时间
    private  String  checkHotal;//入住酒店的名称
    private  String  visit;//观光的景点
    private  String  remark;//备注


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
	public void setContainType( String  containType){
        this.containType=containType;
    }
    public  String  getContainType(){
        return this.containType;
    }
    public void setFromAddr( String  fromAddr){
        this.fromAddr=fromAddr;
    }
    public  String  getFromAddr(){
        return this.fromAddr;
    }
    public void setToAddr( String  toAddr){
        this.toAddr=toAddr;
    }
    public  String  getToAddr(){
        return this.toAddr;
    }
    public void setCheckDay( String  checkDay){
        this.checkDay=checkDay;
    }
    public  String  getCheckDay(){
        return this.checkDay;
    }
    public void setCheckHotal( String  checkHotal){
        this.checkHotal=checkHotal;
    }
    public  String  getCheckHotal(){
        return this.checkHotal;
    }
    public void setVisit( String  visit){
        this.visit=visit;
    }
    public  String  getVisit(){
        return this.visit;
    }
    public void setRemark( String  remark){
        this.remark=remark;
    }
    public  String  getRemark(){
        return this.remark;
    }
}
