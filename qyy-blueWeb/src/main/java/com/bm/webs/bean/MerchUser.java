package com.bm.webs.bean; 

import java.util.Date;

public class MerchUser {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  logo;//商户logo
    private  String  shortname;//
    private  Long  atAddr;//
    private  String  addrDetail;//详细地址
    private  String  summary;//商户介绍
    private  Integer  merchType;//商户类型（1：景区商户   2：酒店商户   3：餐饮商户  4：装备商户）
    private  String  serviceType;//主要是应用于餐饮商户和装备商户类容分类
    private  String  brand;//品牌（酒店）
    private  String  starLevel;//星级（酒店）
    private  String  theme;//主题（酒店）
    private  Long  adminId;//
    private String facilities;//商户设置

    
    private static String[] merchTypeString={"景区商户","酒店商户","餐饮商户","装备商户"};

    /**
     * 返回商户类型名(字符串)
     * @return
     */
    public String getMerchTypeName(){
    	if(merchType!=null&&merchType<5&&merchType>0){
    		//数据库存储从1开始
    		return merchTypeString[merchType-1];
    	}else{
    		return null;
    	}
    }
    
    public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
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
	public void setLogo( String  logo){
        this.logo=logo;
    }
    public  String  getLogo(){
        return this.logo;
    }
    public void setShortname( String  shortname){
        this.shortname=shortname;
    }
    public  String  getShortname(){
        return this.shortname;
    }
    public void setAtAddr( Long  atAddr){
        this.atAddr=atAddr;
    }
    public  Long  getAtAddr(){
        return this.atAddr;
    }
    public void setAddrDetail( String  addrDetail){
        this.addrDetail=addrDetail;
    }
    public  String  getAddrDetail(){
        return this.addrDetail;
    }
    public void setSummary( String  summary){
        this.summary=summary;
    }
    public  String  getSummary(){
        return this.summary;
    }
    public void setMerchType( Integer  merchType){
        this.merchType=merchType;
    }
    public  Integer  getMerchType(){
        return this.merchType;
    }
    public void setServiceType( String  serviceType){
        this.serviceType=serviceType;
    }
    public  String  getServiceType(){
        return this.serviceType;
    }
    public void setBrand( String  brand){
        this.brand=brand;
    }
    public  String  getBrand(){
        return this.brand;
    }
    public void setStarLevel( String  starLevel){
        this.starLevel=starLevel;
    }
    public  String  getStarLevel(){
        return this.starLevel;
    }
    public void setTheme( String  theme){
        this.theme=theme;
    }
    public  String  getTheme(){
        return this.theme;
    }
    public void setAdminId( Long  adminId){
        this.adminId=adminId;
    }
    public  Long  getAdminId(){
        return this.adminId;
    }
}
