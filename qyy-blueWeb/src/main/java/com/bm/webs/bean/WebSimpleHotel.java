package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleHotel {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  names;//酒店名称
    private  Long  addrId;//地址id
    private  String  addrDetail;//地址详细
    private  Long  starId;//星级id
    private  String  summary;//酒店介绍


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
	public void setNames( String  names){
        this.names=names;
    }
    public  String  getNames(){
        return this.names;
    }
    public void setAddrId( Long  addrId){
        this.addrId=addrId;
    }
    public  Long  getAddrId(){
        return this.addrId;
    }
    public void setAddrDetail( String  addrDetail){
        this.addrDetail=addrDetail;
    }
    public  String  getAddrDetail(){
        return this.addrDetail;
    }
    public void setStarId( Long  starId){
        this.starId=starId;
    }
    public  Long  getStarId(){
        return this.starId;
    }
    public void setSummary( String  summary){
        this.summary=summary;
    }
    public  String  getSummary(){
        return this.summary;
    }
}
