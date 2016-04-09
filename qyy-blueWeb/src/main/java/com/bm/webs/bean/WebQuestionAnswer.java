package com.bm.webs.bean; 

import java.util.Date;

public class WebQuestionAnswer {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  content;//解答的内容
    private  Long  userId;//解答人的id
    private  Integer  isAdopt;//是否被采纳（1:否     0：是）(第一条才能采纳)
    private  Integer  praise;//点赞数
    private  Long  replyId;//回复的id(如果是第一条则为0)
    private  Long  replyUserId;//回复的用户id
    private  Long  rootId;//一个评论树下根id(为树开始时第一条的id,第一条为0,默认为0)


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
	public void setContent( String  content){
        this.content=content;
    }
    public  String  getContent(){
        return this.content;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
    public void setIsAdopt( Integer  isAdopt){
        this.isAdopt=isAdopt;
    }
    public  Integer  getIsAdopt(){
        return this.isAdopt;
    }
    public void setPraise( Integer  praise){
        this.praise=praise;
    }
    public  Integer  getPraise(){
        return this.praise;
    }
    public void setReplyId( Long  replyId){
        this.replyId=replyId;
    }
    public  Long  getReplyId(){
        return this.replyId;
    }
    public void setReplyUserId( Long  replyUserId){
        this.replyUserId=replyUserId;
    }
    public  Long  getReplyUserId(){
        return this.replyUserId;
    }
    public void setRootId( Long  rootId){
        this.rootId=rootId;
    }
    public  Long  getRootId(){
        return this.rootId;
    }
}
