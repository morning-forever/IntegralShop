package com.bm.webs.bean; 

import java.util.Date;

public class CommonUpload {
    private  Long  id;//
    private  Date  createTime;//
    private  String  picUrl;//
    private  String  picFrom;//图片模块
    private  String  picType;//图片类型（logo,head,banner）
    private  Long  fromId;//


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
    }
    public void setCreateTime(Date  createTime){
        this.createTime=createTime;
    }
    public  Date  getCreateTime(){
        return this.createTime;
    }
    public void setPicUrl( String  picUrl){
        this.picUrl=picUrl;
    }
    public  String  getPicUrl(){
        return this.picUrl;
    }
    public void setPicFrom( String  picFrom){
        this.picFrom=picFrom;
    }
    public  String  getPicFrom(){
        return this.picFrom;
    }
    public void setPicType( String  picType){
        this.picType=picType;
    }
    public  String  getPicType(){
        return this.picType;
    }
    public void setFromId( Long  fromId){
        this.fromId=fromId;
    }
    public  Long  getFromId(){
        return this.fromId;
    }
}
