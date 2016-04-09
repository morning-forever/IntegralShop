package com.bm.webs.bean; 

import java.util.Date;

public class WebCarSafe {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  safeType;//保险类型（租车    包车     班车   拼车）
    private  Double price;//需要金额
    private  String  remark;//保险说明


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
  
    public void setSafeType( String  safeType){
        this.safeType=safeType;
    }
    public  String  getSafeType(){
        return this.safeType;
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public void setRemark( String  remark){
        this.remark=remark;
    }
    public  String  getRemark(){
        return this.remark;
    }
}
