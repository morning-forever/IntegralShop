package com.bm.webs.bean; 

import java.util.Date;

public class WebThreeBuild {
    private  Long  id;//
    private  String  state;//数据状态
    private  Date createTime;//创建时间
    private  String  buildCode;//绑定码
    private  String  buildFrom;//绑定来源
    private  Long  userId;//本地web用户id


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
	public void setBuildCode( String  buildCode){
        this.buildCode=buildCode;
    }
    public  String  getBuildCode(){
        return this.buildCode;
    }
    public void setBuildFrom( String  buildFrom){
        this.buildFrom=buildFrom;
    }
    public  String  getBuildFrom(){
        return this.buildFrom;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
}
