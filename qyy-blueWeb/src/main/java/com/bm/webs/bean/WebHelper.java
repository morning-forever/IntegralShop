package com.bm.webs.bean; 

import java.util.Date;

public class WebHelper {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  issue;//提问
    private  String  answer;//回答


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
	public void setIssue( String  issue){
        this.issue=issue;
    }
    public  String  getIssue(){
        return this.issue;
    }
    public void setAnswer( String  answer){
        this.answer=answer;
    }
    public  String  getAnswer(){
        return this.answer;
    }
}
