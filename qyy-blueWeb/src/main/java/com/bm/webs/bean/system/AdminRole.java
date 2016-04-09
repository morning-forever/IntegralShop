package com.bm.webs.bean.system; 
public class AdminRole {
    private  Integer  id;//
    private  String  stutas;//
    private  String  roleKey;//角色key
    private  String  roleName;//角色名
    private  String  parentKey;//当前角色的父节点key
    private  String  menuKeys;//所有菜单的key
    private  String  menuRightModel;//菜单权限的model,对应关系


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
    public void setRoleKey( String  roleKey){
        this.roleKey=roleKey;
    }
    public  String  getRoleKey(){
        return this.roleKey;
    }
    public void setRoleName( String  roleName){
        this.roleName=roleName;
    }
    public  String  getRoleName(){
        return this.roleName;
    }
    public void setParentKey( String  parentKey){
        this.parentKey=parentKey;
    }
    public  String  getParentKey(){
        return this.parentKey;
    }
    public void setMenuKeys( String  menuKeys){
        this.menuKeys=menuKeys;
    }
    public  String  getMenuKeys(){
        return this.menuKeys;
    }
    public void setMenuRightModel( String  menuRightModel){
        this.menuRightModel=menuRightModel;
    }
    public  String  getMenuRightModel(){
        return this.menuRightModel;
    }
}
