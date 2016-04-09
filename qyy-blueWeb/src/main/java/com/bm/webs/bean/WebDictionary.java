package com.bm.webs.bean; 

import java.util.Date;

public class WebDictionary {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  dictKey;//字典的key
    private  String  dictName;//字典的名称
    private  String  dictContext;//字典的具体内容


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
	public void setDictKey( String  dictKey){
        this.dictKey=dictKey;
    }
    public  String  getDictKey(){
        return this.dictKey;
    }
    public void setDictName( String  dictName){
        this.dictName=dictName;
    }
    public  String  getDictName(){
        return this.dictName;
    }
    public void setDictContext( String  dictContext){
        this.dictContext=dictContext;
    }
    public  String  getDictContext(){
        return this.dictContext;
    }
}
