package com.bm.webs.bean; 

import java.util.Date;

public class MerchLinkman {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  linkName;//联系人名称
    private  String  linkPhone;//联系人手机
    private  String  linkEmail;//联系人邮箱
    private  String  linkMerchTel;//商户联系电话(多个用','隔开)
    private  Long  merchUserId;//商家用户id


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
	public void setLinkName( String  linkName){
        this.linkName=linkName;
    }
    public  String  getLinkName(){
        return this.linkName;
    }
    public void setLinkPhone( String  linkPhone){
        this.linkPhone=linkPhone;
    }
    public  String  getLinkPhone(){
        return this.linkPhone;
    }
    public void setLinkEmail( String  linkEmail){
        this.linkEmail=linkEmail;
    }
    public  String  getLinkEmail(){
        return this.linkEmail;
    }
    public void setLinkMerchTel( String  linkMerchTel){
        this.linkMerchTel=linkMerchTel;
    }
    public  String  getLinkMerchTel(){
        return this.linkMerchTel;
    }
    public void setMerchUserId( Long  merchUserId){
        this.merchUserId=merchUserId;
    }
    public  Long  getMerchUserId(){
        return this.merchUserId;
    }
}
