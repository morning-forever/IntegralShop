package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleDay {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  atDay;//天数（1:第一天   依次类推）
    private  Long  simpleId;//智易行的id


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
	public void setAtDay( String  atDay){
        this.atDay=atDay;
    }
    public  String  getAtDay(){
        return this.atDay;
    }
    public void setSimpleId( Long  simpleId){
        this.simpleId=simpleId;
    }
    public  Long  getSimpleId(){
        return this.simpleId;
    }
}
