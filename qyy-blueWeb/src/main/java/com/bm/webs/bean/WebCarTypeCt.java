package com.bm.webs.bean; 
public class WebCarTypeCt {
    private  Long  id;//
    private  java.sql.Date  createTime;//
    private  Long  carId;//车辆id
    private  Long  carTypeId;//车辆类型id


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
    public void setCarId( Long  carId){
        this.carId=carId;
    }
    public  Long  getCarId(){
        return this.carId;
    }
    public void setCarTypeId( Long  carTypeId){
        this.carTypeId=carTypeId;
    }
    public  Long  getCarTypeId(){
        return this.carTypeId;
    }
}
