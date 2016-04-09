package com.bm.webs.bean; 
public class WebLabel {
    private  Long  id;//
    private  java.sql.Date  createTime;//
    private  String  forms;//来源
    private  Long  formId;//来源id
    private  String  label;//具体类容


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
    public void setForms( String  forms){
        this.forms=forms;
    }
    public  String  getForms(){
        return this.forms;
    }
    public void setFormId( Long  formId){
        this.formId=formId;
    }
    public  Long  getFormId(){
        return this.formId;
    }
    public void setLabel( String  label){
        this.label=label;
    }
    public  String  getLabel(){
        return this.label;
    }
}
