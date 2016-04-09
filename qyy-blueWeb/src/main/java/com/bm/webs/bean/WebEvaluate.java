package com.bm.webs.bean; 

import java.util.Date;

public class WebEvaluate {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  userId;//前台用户id
    private  Long  formId;//评论的商品id
    private  String  forms;//商品来自哪个版块或者哪个表
    private  String  comment;//评价的内容
    private  Double  score;//分数（根据分数推算出星级）


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
	public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setFormId( Long  formId){
        this.formId=formId;
    }
    public  Long  getFormId(){
        return this.formId;
    }
    public void setForms( String  forms){
        this.forms=forms;
    }
    public  String  getForms(){
        return this.forms;
    }
    public void setComment( String  comment){
        this.comment=comment;
    }
    public  String  getComment(){
        return this.comment;
    }
    public void setScore( Double  score){
        this.score=score;
    }
    public  Double  getScore(){
        return this.score;
    }
}
