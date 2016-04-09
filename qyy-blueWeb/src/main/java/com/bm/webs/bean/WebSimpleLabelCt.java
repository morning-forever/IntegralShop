package com.bm.webs.bean; 

import java.util.Date;

public class WebSimpleLabelCt {
    private  Long  id;//
    private  Date  createTime;//
    private  Long  simpleId;//
    private  Long  labelId;//


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
    }
    
    public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public void setSimpleId( Long  simpleId){
        this.simpleId=simpleId;
    }
    public  Long  getSimpleId(){
        return this.simpleId;
    }
    public void setLabelId( Long  labelId){
        this.labelId=labelId;
    }
    public  Long  getLabelId(){
        return this.labelId;
    }
}
