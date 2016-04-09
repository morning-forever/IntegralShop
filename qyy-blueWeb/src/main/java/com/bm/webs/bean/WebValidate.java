package com.bm.webs.bean; 

import java.util.Date;

public class WebValidate {
    private  Long  id;//
    private  Date createTime;//
    private  Long  userId;//前端用户id
    private  String  vcode;//验证码
    private  Integer  deadline;//验证码存活的时效(期限）
    private  String  vtype;//验证的类型（邮箱：email   手机：phone）其他待补充


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
    public void setVcode( String  vcode){
        this.vcode=vcode;
    }
    public  String  getVcode(){
        return this.vcode;
    }
    public void setDeadline( Integer  deadline){
        this.deadline=deadline;
    }
    public  Integer  getDeadline(){
        return this.deadline;
    }
    public void setVtype( String  vtype){
        this.vtype=vtype;
    }
    public  String  getVtype(){
        return this.vtype;
    }
}
