package com.bm.webs.bean; 

import java.util.Date;

public class WebCarRule {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  depict;//规则描述
    private  String  backDepict;//退改规则
    private  String  reminder;//温馨提示
    private  String  ruleType;//规则类型（租车，包车，班车，拼车）
    private  String  timeoutDepict;//
    private  String  applyDepict;//支付成功提示


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
	public void setDepict( String  depict){
        this.depict=depict;
    }
    public  String  getDepict(){
        return this.depict;
    }
    public void setBackDepict( String  backDepict){
        this.backDepict=backDepict;
    }
    public  String  getBackDepict(){
        return this.backDepict;
    }
    public void setReminder( String  reminder){
        this.reminder=reminder;
    }
    public  String  getReminder(){
        return this.reminder;
    }
    public void setRuleType( String  ruleType){
        this.ruleType=ruleType;
    }
    public  String  getRuleType(){
        return this.ruleType;
    }
    public void setTimeoutDepict( String  timeoutDepict){
        this.timeoutDepict=timeoutDepict;
    }
    public  String  getTimeoutDepict(){
        return this.timeoutDepict;
    }
    public void setApplyDepict( String  applyDepict){
        this.applyDepict=applyDepict;
    }
    public  String  getApplyDepict(){
        return this.applyDepict;
    }
}
