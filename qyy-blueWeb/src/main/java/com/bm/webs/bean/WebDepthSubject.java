package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthSubject {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  subject;//主题


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
	public void setSubject( String  subject){
        this.subject=subject;
    }
    public  String  getSubject(){
        return this.subject;
    }
}
