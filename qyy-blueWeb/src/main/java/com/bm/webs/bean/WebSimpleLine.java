package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleLine {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  atTime;//
    private  String  atWhereId;//
    private  String  atWhereType;//
    private  String  atUsedTime;//
    private  Integer  isShelves;//是否上架
    private  Integer  lineGroup;//这个时间线的分组
    private  Long  dayId;//web_simple_day中的id


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
	public void setAtTime( String  atTime){
        this.atTime=atTime;
    }
    public  String  getAtTime(){
        return this.atTime;
    }
    public void setAtWhereId( String  atWhereId){
        this.atWhereId=atWhereId;
    }
    public  String  getAtWhereId(){
        return this.atWhereId;
    }
    public void setAtWhereType( String  atWhereType){
        this.atWhereType=atWhereType;
    }
    public  String  getAtWhereType(){
        return this.atWhereType;
    }
    public void setAtUsedTime( String  atUsedTime){
        this.atUsedTime=atUsedTime;
    }
    public  String  getAtUsedTime(){
        return this.atUsedTime;
    }
    public void setIsShelves( Integer  isShelves){
        this.isShelves=isShelves;
    }
    public  Integer  getIsShelves(){
        return this.isShelves;
    }
    public void setLineGroup( Integer  lineGroup){
        this.lineGroup=lineGroup;
    }
    public  Integer  getLineGroup(){
        return this.lineGroup;
    }
    public void setDayId( Long  dayId){
        this.dayId=dayId;
    }
    public  Long  getDayId(){
        return this.dayId;
    }
}
