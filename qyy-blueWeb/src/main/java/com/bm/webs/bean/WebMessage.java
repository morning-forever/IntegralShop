package com.bm.webs.bean; 
public class WebMessage {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  String  messages;//具体信息描述
    private  String  msgSource;//信息来源(SYSTEM,FRIEND,ORDERS,ARTCLE,MENTS）
    private  Long  fromUserId;//
    private  Long  toUserId;//
    private  Long  biuldId;//在不同的来源下绑定不同的id,需要进行跳转的时候需要
    private  Integer  isRead;//是否已读


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
    public void setMessages( String  messages){
        this.messages=messages;
    }
    public  String  getMessages(){
        return this.messages;
    }
    public void setMsgSource( String  msgSource){
        this.msgSource=msgSource;
    }
    public  String  getMsgSource(){
        return this.msgSource;
    }
    public void setFromUserId( Long  fromUserId){
        this.fromUserId=fromUserId;
    }
    public  Long  getFromUserId(){
        return this.fromUserId;
    }
    public void setToUserId( Long  toUserId){
        this.toUserId=toUserId;
    }
    public  Long  getToUserId(){
        return this.toUserId;
    }
    public void setBiuldId( Long  biuldId){
        this.biuldId=biuldId;
    }
    public  Long  getBiuldId(){
        return this.biuldId;
    }
    public void setIsRead( Integer  isRead){
        this.isRead=isRead;
    }
    public  Integer  getIsRead(){
        return this.isRead;
    }
}
