package com.bm.webs.bean; 

import java.util.Date;

public class WebSimple {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  addrStartId;//起始地
    private  Long  addrEndId;//目的地
    private  Long  tripDay;//出行天数


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
	public void setAddrStartId( Long  addrStartId){
        this.addrStartId=addrStartId;
    }
    public  Long  getAddrStartId(){
        return this.addrStartId;
    }
    public void setAddrEndId( Long  addrEndId){
        this.addrEndId=addrEndId;
    }
    public  Long  getAddrEndId(){
        return this.addrEndId;
    }
    public void setTripDay( Long  tripDay){
        this.tripDay=tripDay;
    }
    public  Long  getTripDay(){
        return this.tripDay;
    }
}
