package com.bm.webs.bean.system; 
public class AdminMenuRight {
    private  Integer  id;//
    private  String  stutas;//
    private  String  menuKey;//菜单的key
    private  String  rightKeys;//当前菜单中的所有权限keys
    private  String  model;//默认的全部权限


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
    public void setMenuKey( String  menuKey){
        this.menuKey=menuKey;
    }
    public  String  getMenuKey(){
        return this.menuKey;
    }
    public void setRightKeys( String  rightKeys){
        this.rightKeys=rightKeys;
    }
    public  String  getRightKeys(){
        return this.rightKeys;
    }
    public void setModel( String  model){
        this.model=model;
    }
    public  String  getModel(){
        return this.model;
    }
}
