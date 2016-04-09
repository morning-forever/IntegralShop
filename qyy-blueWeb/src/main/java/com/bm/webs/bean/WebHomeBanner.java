package com.bm.webs.bean; 

import java.util.Date;

public class WebHomeBanner {
    private  Long  id;//
    private  String  state;//
    private  Date  createTime;//
    private  Date updateTime;//
    private  String  bannerImg;//图片地址
    private  Integer  bannerWhere;//图片放置在那个端（1：app和网页  2：网页  3：app）
    private  String  bannerType;//banner图片属于那个模块（home:首页,depth:深度游,recruit:游伴招募,hot:热门攻略）
    private  Integer  bannerLink;//链接的栏目
    private  Long  bannerLinkSpecific;//栏目中某个具体产品或帖子的id
    private  Integer  bannerOrder;//排序
    private  Date      startTime;
    private  Date      endTime;
    
     
    public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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
	public void setBannerImg( String  bannerImg){
        this.bannerImg=bannerImg;
    }
    public  String  getBannerImg(){
        return this.bannerImg;
    }
    public void setBannerWhere( Integer  bannerWhere){
        this.bannerWhere=bannerWhere;
    }
    public  Integer  getBannerWhere(){
        return this.bannerWhere;
    }
    public void setBannerType( String  bannerType){
        this.bannerType=bannerType;
    }
    public  String  getBannerType(){
        return this.bannerType;
    }
    public void setBannerLink( Integer  bannerLink){
        this.bannerLink=bannerLink;
    }
    public  Integer  getBannerLink(){
        return this.bannerLink;
    }
    public void setBannerLinkSpecific( Long  bannerLinkSpecific){
        this.bannerLinkSpecific=bannerLinkSpecific;
    }
    public  Long  getBannerLinkSpecific(){
        return this.bannerLinkSpecific;
    }
    public void setBannerOrder( Integer  bannerOrder){
        this.bannerOrder=bannerOrder;
    }
    public  Integer  getBannerOrder(){
        return this.bannerOrder;
    }
}
