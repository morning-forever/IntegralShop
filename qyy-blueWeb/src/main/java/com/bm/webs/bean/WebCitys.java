package com.bm.webs.bean; 

import java.util.Date;

public class WebCitys {
    private  Long  id;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  name;//当前名称
    private  String  ctype;//类型（province:省  city：市  county：区县）
    private  Long  parentId;//上级目录id


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
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
	public void setName( String  name){
        this.name=name;
    }
    public  String  getName(){
        return this.name;
    }
    public void setCtype( String  ctype){
        this.ctype=ctype;
    }
    public  String  getCtype(){
        return this.ctype;
    }
    public void setParentId( Long  parentId){
        this.parentId=parentId;
    }
    public  Long  getParentId(){
        return this.parentId;
    }
}
