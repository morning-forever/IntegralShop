package com.bm.webs.bean; 
public class WebCarRentAddrCt {
    private  Long  id;//
    private  String  state;//
    private  java.sql.Date  createTime;//
    private  Long  rentId;//×â³µµÄid
    private  Long  carAddrsId;//µØÖ·id


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
    public void setCreateTime( java.sql.Date  createTime){
        this.createTime=createTime;
    }
    public  java.sql.Date  getCreateTime(){
        return this.createTime;
    }
    public void setRentId( Long  rentId){
        this.rentId=rentId;
    }
    public  Long  getRentId(){
        return this.rentId;
    }
    public void setCarAddrsId( Long  carAddrsId){
        this.carAddrsId=carAddrsId;
    }
    public  Long  getCarAddrsId(){
        return this.carAddrsId;
    }
}
