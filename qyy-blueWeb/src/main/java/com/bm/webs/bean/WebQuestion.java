package com.bm.webs.bean; 

import java.util.Date;

public class WebQuestion {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  userId;//前端用户id
    private  String  atUserIds;//邀请回答人的列表(1,2,）这种格式
    private  String  content;//问题内容


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
	public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setAtUserIds( String  atUserIds){
        this.atUserIds=atUserIds;
    }
    public  String  getAtUserIds(){
        return this.atUserIds;
    }
    public void setContent( String  content){
        this.content=content;
    }
    public  String  getContent(){
        return this.content;
    }
}
