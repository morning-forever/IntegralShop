package com.bm.webs.bean.system; 
public class AdminRight {
    private  Integer  id;//
    private  String  stutas;//
    private  String  rightKey;//权限key
    private  String  rightName;//权限名
    private  Integer  rightCode;//权限的编号
    private  String  rightBtn;//权限btn的id
    private  String  rightCss;//权限的css
    private  String  rightImg;//权限的图片css


    public void setId( Integer  id){
        this.id=id;
    }
    public  Integer  getId(){
        return this.id;
    }
    public void setStutas( String  stutas){
        this.stutas=stutas;
    }
    public  String  getStutas(){
        return this.stutas;
    }
    public void setRightKey( String  rightKey){
        this.rightKey=rightKey;
    }
    public  String  getRightKey(){
        return this.rightKey;
    }
    public void setRightName( String  rightName){
        this.rightName=rightName;
    }
    public  String  getRightName(){
        return this.rightName;
    }
    public void setRightCode( Integer  rightCode){
        this.rightCode=rightCode;
    }
    public  Integer  getRightCode(){
        return this.rightCode;
    }
    public void setRightBtn( String  rightBtn){
        this.rightBtn=rightBtn;
    }
    public  String  getRightBtn(){
        return this.rightBtn;
    }
    public void setRightCss( String  rightCss){
        this.rightCss=rightCss;
    }
    public  String  getRightCss(){
        return this.rightCss;
    }
    public void setRightImg( String  rightImg){
        this.rightImg=rightImg;
    }
    public  String  getRightImg(){
        return this.rightImg;
    }
}
