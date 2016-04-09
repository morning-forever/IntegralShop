package com.bm.webs.bean; 
public class WebComplaintMent {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  String  content;//评论类容
    private  Long  userId;//
    private  Integer  praise;//
    private  Long  replyId;//回复id(同web_quesion_answer)
    private  Long  replyUserId;//回复用户id
    private  Long  rootId;//根id


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
