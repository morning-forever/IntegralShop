package com.bm.webs.bean; 

import java.util.Date;

public class WebScoreRule {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  ruleKey;//兑换规则的key
    private  Integer  ruleScore;//这个规则所需要的分数（桃子）
    private  String  ruleDesc;//本规则的描述
    private  Integer  ruleType;//规则类型(1,获取规则  2.兑换规则  3.失效规则)


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
	public void setRuleKey( String  ruleKey){
        this.ruleKey=ruleKey;
    }
    public  String  getRuleKey(){
        return this.ruleKey;
    }
    public void setRuleScore( Integer  ruleScore){
        this.ruleScore=ruleScore;
    }
    public  Integer  getRuleScore(){
        return this.ruleScore;
    }
    public void setRuleDesc( String  ruleDesc){
        this.ruleDesc=ruleDesc;
    }
    public  String  getRuleDesc(){
        return this.ruleDesc;
    }
    public void setRuleType( Integer  ruleType){
        this.ruleType=ruleType;
    }
    public  Integer  getRuleType(){
        return this.ruleType;
    }
}
