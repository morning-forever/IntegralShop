package com.bm.webs.bean; 

import java.util.Date;

public class WebCarRent {
    private  Long  id;//
    private  Date  createTime;//
    private  Long  carId;//��id
    private  Integer  coach;//������
    private  Integer  seating;//��λ��
    private  Integer  door;//������
    private  String  fuel;//ȼ������
    private  String  gearbox;//������
    private  String  outputs;//����
    private  String  fuelGrade;//ȼ�ͱ��
    private  String  drives;//��ʽ
    private  String  airForm;//����ʽ
    private  Integer  skylight;//�촰����
    private  String  fuelTankage;//��������
    private  String  voiceBox;//����
    private  String  chair;//����
    private  Integer  radar;//�����״�
    private  String  gasbag;//��ȫ����
    private  String  dvdcd;//DVD/CD
    private  Integer  gps;//GPS����


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
	public void setCarId( Long  carId){
        this.carId=carId;
    }
    public  Long  getCarId(){
        return this.carId;
    }
    public void setCoach( Integer  coach){
        this.coach=coach;
    }
    public  Integer  getCoach(){
        return this.coach;
    }
    public void setSeating( Integer  seating){
        this.seating=seating;
    }
    public  Integer  getSeating(){
        return this.seating;
    }
    public void setDoor( Integer  door){
        this.door=door;
    }
    public  Integer  getDoor(){
        return this.door;
    }
    public void setFuel( String  fuel){
        this.fuel=fuel;
    }
    public  String  getFuel(){
        return this.fuel;
    }
    public void setGearbox( String  gearbox){
        this.gearbox=gearbox;
    }
    public  String  getGearbox(){
        return this.gearbox;
    }
    public void setOutputs( String  outputs){
        this.outputs=outputs;
    }
    public  String  getOutputs(){
        return this.outputs;
    }
    public void setFuelGrade( String  fuelGrade){
        this.fuelGrade=fuelGrade;
    }
    public  String  getFuelGrade(){
        return this.fuelGrade;
    }
    public void setDrives( String  drives){
        this.drives=drives;
    }
    public  String  getDrives(){
        return this.drives;
    }
    public void setAirForm( String  airForm){
        this.airForm=airForm;
    }
    public  String  getAirForm(){
        return this.airForm;
    }
    public void setSkylight( Integer  skylight){
        this.skylight=skylight;
    }
    public  Integer  getSkylight(){
        return this.skylight;
    }
    public void setFuelTankage( String  fuelTankage){
        this.fuelTankage=fuelTankage;
    }
    public  String  getFuelTankage(){
        return this.fuelTankage;
    }
    public void setVoiceBox( String  voiceBox){
        this.voiceBox=voiceBox;
    }
    public  String  getVoiceBox(){
        return this.voiceBox;
    }
    public void setChair( String  chair){
        this.chair=chair;
    }
    public  String  getChair(){
        return this.chair;
    }
    public void setRadar( Integer  radar){
        this.radar=radar;
    }
    public  Integer  getRadar(){
        return this.radar;
    }
    public void setGasbag( String  gasbag){
        this.gasbag=gasbag;
    }
    public  String  getGasbag(){
        return this.gasbag;
    }
    public void setDvdcd( String  dvdcd){
        this.dvdcd=dvdcd;
    }
    public  String  getDvdcd(){
        return this.dvdcd;
    }
    public void setGps( Integer  gps){
        this.gps=gps;
    }
    public  Integer  getGps(){
        return this.gps;
    }
}
