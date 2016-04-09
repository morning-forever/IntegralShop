package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleHotelStar {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Integer  starKey;//星级（1,2,3,4.）
    private  String  starDetail;//星级描述


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
	public void setStarKey( Integer  starKey){
        this.starKey=starKey;
    }
    public  Integer  getStarKey(){
        return this.starKey;
    }
    public void setStarDetail( String  starDetail){
        this.starDetail=starDetail;
    }
    public  String  getStarDetail(){
        return this.starDetail;
    }
}
