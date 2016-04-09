package com.bm.webs.bean; 
public class WebScoreObtain {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  Long  ruleId;//规则id
    private  String  opers;//操作
    private  Integer  totals;//当前总分
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
    public void setRuleId( Long  ruleId){
        this.ruleId=ruleId;
    }
    public  Long  getRuleId(){
        return this.ruleId;
    }
    public void setOpers( String  opers){
        this.opers=opers;
    }
    public  String  getOpers(){
        return this.opers;
    }
    public void setTotals( Integer  totals){
        this.totals=totals;
    }
    public  Integer  getTotals(){
        return this.totals;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
}
