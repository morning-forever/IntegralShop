package com.bm.webs.bean; 
public class WebUserMasterArea {
    private  Long  id;//
    private  java.sql.Date  createTime;//
    private  Long  masterId;//达人id
    private  Long  areaId;//地区关联的id


    public void setId( Long  id){
        this.id=id;
    }
    public  Long  getId(){
        return this.id;
    }
    public void setCreateTime( java.sql.Date  createTime){
        this.createTime=createTime;
    }
    public  java.sql.Date  getCreateTime(){
        return this.createTime;
    }
    public void setMasterId( Long  masterId){
        this.masterId=masterId;
    }
    public  Long  getMasterId(){
        return this.masterId;
    }
    public void setAreaId( Long  areaId){
        this.areaId=areaId;
    }
    public  Long  getAreaId(){
        return this.areaId;
    }
}
