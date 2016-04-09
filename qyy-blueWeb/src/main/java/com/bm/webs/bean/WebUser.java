package com.bm.webs.bean;

import java.util.Date;

public class WebUser {
	private Long id;// userId
	private String state;// 数据状态(ADD添加，DEL删除）
	private Date createTime;// 数据创建时间
	private Date updateTime;//
	private String nickname;// 昵称
	private Integer sex;// 性别(1:男 2：女)
	private Date birthday;// 生日
	private Long atAreaId;// 所在地
	private String phone;// 电话
	private String email;// 邮箱
	private String summary;// 个人介绍
	private String headImg;// 头像图片
	private Long userLevelId;// 用户等级
	private Integer isMaster;// 是否达人
	private Integer isBan;// 是否禁用
	
	
	private String accessToken;//token
	private String threeUid;//第三方id
	private String thridFrom;
	
	
	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return this.id;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return this.state;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getSex() {
		return this.sex;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public void setAtAreaId(Long atAreaId) {
		this.atAreaId = atAreaId;
	}

	public Long getAtAreaId() {
		return this.atAreaId;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getHeadImg() {
		return this.headImg;
	}

	public void setUserLevelId(Long userLevelId) {
		this.userLevelId = userLevelId;
	}

	public Long getUserLevelId() {
		return this.userLevelId;
	}

	public void setIsMaster(Integer isMaster) {
		this.isMaster = isMaster;
	}

	public Integer getIsMaster() {
		return this.isMaster;
	}

	public Integer getIsBan() {
		return isBan;
	}

	public void setIsBan(Integer isBan) {
		this.isBan = isBan;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getThreeUid() {
		return threeUid;
	}

	public void setThreeUid(String threeUid) {
		this.threeUid = threeUid;
	}

	public void setThridFrom(String thridFrom) {
		this.thridFrom = thridFrom;
	}

	public String getThridFrom() {
		return thridFrom;
	}
}
