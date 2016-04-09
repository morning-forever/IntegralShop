package com.bm.webs.bean; 

import java.util.Date;

public class WebUserLevel {
    private  Long  id;//
    private  String  state;//
    private  Date  createtime;//
    private  Date updateTime;//
    private  String  levelName;//等级名称
    private  String  levelDesc;//等级描述
    private  Integer  requireStart;//范围开始
    private  Integer  requireEnd;//范围结束
    private  Long  parentId;//父等级id


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
    
    public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public void setLevelName( String  levelName){
        this.levelName=levelName;
    }
    public  String  getLevelName(){
        return this.levelName;
    }
    public void setLevelDesc( String  levelDesc){
        this.levelDesc=levelDesc;
    }
    public  String  getLevelDesc(){
        return this.levelDesc;
    }
    public void setRequireStart( Integer  requireStart){
        this.requireStart=requireStart;
    }
    public  Integer  getRequireStart(){
        return this.requireStart;
    }
    public void setRequireEnd( Integer  requireEnd){
        this.requireEnd=requireEnd;
    }
    public  Integer  getRequireEnd(){
        return this.requireEnd;
    }
    public void setParentId( Long  parentId){
        this.parentId=parentId;
    }
    public  Long  getParentId(){
        return this.parentId;
    }
}
