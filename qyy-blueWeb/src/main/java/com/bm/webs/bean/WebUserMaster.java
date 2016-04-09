package com.bm.webs.bean; 

import java.util.Date;

public class WebUserMaster {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  userId;//前端用户id
    private  String  realName;//真实姓名
    private  Long  nowlive;//现住地(可能会关联地区表）
    private  String  occupation;//职业
    private  String  qqNum;//qq号
    private  String  wechat;//微信号
    private  String  isAudit;//是否审核通过（OK:通过  NO:审核拒绝 ,TO:提交）


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
    public void setRealName( String  realName){
        this.realName=realName;
    }
    public  String  getRealName(){
        return this.realName;
    }
    public void setNowlive( Long  nowlive){
        this.nowlive=nowlive;
    }
    public  Long  getNowlive(){
        return this.nowlive;
    }
    public void setOccupation( String  occupation){
        this.occupation=occupation;
    }
    public  String  getOccupation(){
        return this.occupation;
    }
    public void setQqNum( String  qqNum){
        this.qqNum=qqNum;
    }
    public  String  getQqNum(){
        return this.qqNum;
    }
    public void setWechat( String  wechat){
        this.wechat=wechat;
    }
    public  String  getWechat(){
        return this.wechat;
    }
    public void setIsAudit( String  isAudit){
        this.isAudit=isAudit;
    }
    public  String  getIsAudit(){
        return this.isAudit;
    }
	
}
