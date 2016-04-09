package com.bm.webs.bean; 

import java.util.Date;

public class WebDepthPointCt {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  Long  depthId;//深度游id
    private  Long  pointId;//亮点id


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
	public void setDepthId( Long  depthId){
        this.depthId=depthId;
    }
    public  Long  getDepthId(){
        return this.depthId;
    }
    public void setPointId( Long  pointId){
        this.pointId=pointId;
    }
    public  Long  getPointId(){
        return this.pointId;
    }
}
