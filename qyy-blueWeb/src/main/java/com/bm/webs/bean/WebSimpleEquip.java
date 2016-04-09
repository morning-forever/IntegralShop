package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleEquip {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  queip;//装备名称
    private  Long  parentId;//父装备类型id(本表中的id)


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
   
    public void setQueip( String  queip){
        this.queip=queip;
    }
    public  String  getQueip(){
        return this.queip;
    }
    public void setParentId( Long  parentId){
        this.parentId=parentId;
    }
    public  Long  getParentId(){
        return this.parentId;
    }
}
