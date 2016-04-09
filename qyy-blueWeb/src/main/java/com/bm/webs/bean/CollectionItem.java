package com.bm.webs.bean;

import java.io.UnsupportedEncodingException;
import java.util.Date;

public class CollectionItem {
	
	private Long id;
	private String title;
	private String context;
	private Date createTime;
	private String imgUrl;
	private String type;
	private Date collectionTime;
	
	
	
	public Date getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(Date collectionTime) {
		this.collectionTime = collectionTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(byte[] context) {
		try {
			if(context!=null){
			this.context = new String(context,"utf-8");
			}else{
				this.context="";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

}
