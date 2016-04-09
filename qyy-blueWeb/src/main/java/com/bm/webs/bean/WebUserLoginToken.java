package com.bm.webs.bean; 

import java.util.Date;

public class WebUserLoginToken {
    private  Long  id;//
    private  Date createTime;//创建时间
    private  Long  userId;//前台用户id
    private  String  token;//生成的token
    private  Integer  deadline;//时间期限（单位秒）


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
	public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setToken( String  token){
        this.token=token;
    }
    public  String  getToken(){
        return this.token;
    }
    public void setDeadline( Integer  deadline){
        this.deadline=deadline;
    }
    public  Integer  getDeadline(){
        return this.deadline;
    }
}
