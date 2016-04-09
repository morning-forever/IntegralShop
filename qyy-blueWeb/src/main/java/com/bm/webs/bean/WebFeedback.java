package com.bm.webs.bean; 
public class WebFeedback {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  String  email;//邮箱
    private  String  phone;//电话
    private  String  username;//姓名
    private  String  message;//消息
    private  Long  userId;//用户id


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
    public void setCreateTime( java.sql.Date  createTime){
        this.createTime=createTime;
    }
    public  java.sql.Date  getCreateTime(){
        return this.createTime;
    }
    public void setEmail( String  email){
        this.email=email;
    }
    public  String  getEmail(){
        return this.email;
    }
    public void setPhone( String  phone){
        this.phone=phone;
    }
    public  String  getPhone(){
        return this.phone;
    }
    public void setUsername( String  username){
        this.username=username;
    }
    public  String  getUsername(){
        return this.username;
    }
    public void setMessage( String  message){
        this.message=message;
    }
    public  String  getMessage(){
        return this.message;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
}
