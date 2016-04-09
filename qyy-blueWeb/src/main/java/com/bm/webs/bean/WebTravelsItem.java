package com.bm.webs.bean; 

import java.util.Date;

public class WebTravelsItem {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  itemType;//条目的类型（文字：word   图片：imgs    段落：stage）
    private  String  context;//内容
    private  Long  travelId;//游记主体id


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
	public void setItemType( String  itemType){
        this.itemType=itemType;
    }
    public  String  getItemType(){
        return this.itemType;
    }
    public void setContext( String  context){
        this.context=context;
    }
    public  String  getContext(){
        return this.context;
    }
    public void setTravelId( Long  travelId){
        this.travelId=travelId;
    }
    public  Long  getTravelId(){
        return this.travelId;
    }
}
