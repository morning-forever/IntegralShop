package com.bm.webs.bean; 
public class WebCarBus {
    private  Long  id;//
    private  java.sql.Date  createTime;//
    private  Integer  seating;//座位数
    private  String  carCard;//车牌号
    private  Long  carId;//car的id


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
    public void setSeating( Integer  seating){
        this.seating=seating;
    }
    public  Integer  getSeating(){
        return this.seating;
    }
    public void setCarCard( String  carCard){
        this.carCard=carCard;
    }
    public  String  getCarCard(){
        return this.carCard;
    }
    public void setCarId( Long  carId){
        this.carId=carId;
    }
    public  Long  getCarId(){
        return this.carId;
    }
}
