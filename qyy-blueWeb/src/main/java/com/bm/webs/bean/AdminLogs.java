package com.bm.webs.bean; 

import java.util.Date;

public class AdminLogs {
    private  Long  id;//
    private  Date  createTime;//操作时间
    private  Long  operUserId;//操作的用户
    private  String  operType;//类型（增删改查）
    private  String  operDesc;//具体的操作内容，尽量描述完整


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
    }
    public void setCreateTime( Date  createTime){
        this.createTime=createTime;
    }
    public  Date  getCreateTime(){
        return this.createTime;
    }
    public void setOperUserId( Long  operUserId){
        this.operUserId=operUserId;
    }
    public  Long  getOperUserId(){
        return this.operUserId;
    }
    public void setOperType( String  operType){
        this.operType=operType;
    }
    public  String  getOperType(){
        return this.operType;
    }
    public void setOperDesc( String  operDesc){
        this.operDesc=operDesc;
    }
    public  String  getOperDesc(){
        return this.operDesc;
    }
}
