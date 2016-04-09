package com.bm.webs.bean; 

import java.util.Date;

public class WebAdvert {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  title;//
    private  String  context;//
    private  Date  effectTime;//生效时间


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
  
    public void setTitle( String  title){
        this.title=title;
    }
    public  String  getTitle(){
        return this.title;
    }
    public void setContext( String  context){
        this.context=context;
    }
    public  String  getContext(){
        return this.context;
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
	public Date getEffectTime() {
		return effectTime;
	}
	public void setEffectTime(Date effectTime) {
		this.effectTime = effectTime;
	}
    
}
