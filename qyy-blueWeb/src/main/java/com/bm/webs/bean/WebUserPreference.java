package com.bm.webs.bean; 

import java.util.Date;

public class WebUserPreference {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  prefKey;//偏好key
    private  String  perfName;//偏好名称
    private  Integer  percent;//
    private  Long  userId;//所占的比重（百分比）


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
	public void setPrefKey( String  prefKey){
        this.prefKey=prefKey;
    }
    public  String  getPrefKey(){
        return this.prefKey;
    }
    public void setPerfName( String  perfName){
        this.perfName=perfName;
    }
    public  String  getPerfName(){
        return this.perfName;
    }
    public void setPercent( Integer  percent){
        this.percent=percent;
    }
    public  Integer  getPercent(){
        return this.percent;
    }
    public void setUserId( Long  userId){
        this.userId=userId;
    }
    public  Long  getUserId(){
        return this.userId;
    }
}
