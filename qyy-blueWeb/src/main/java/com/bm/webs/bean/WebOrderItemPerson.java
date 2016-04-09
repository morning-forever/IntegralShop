package com.bm.webs.bean;

import java.util.Date;

public class WebOrderItemPerson {
	private Long id;//
	private String state;//
	private Date createTime;//
	private Long itemId;// ����item��id
	private String personName;// ������������
	private String personType;// ������������������adult ������children��
	private String cardNo;// ��������
	private String cardType;// ��������
	private String personPhone;

	public String getPersonPhone() {
		return personPhone;
	}

	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}

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

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getItemId() {
		return this.itemId;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPersonName() {
		return this.personName;
	}

	public void setPersonType(String personType) {
		this.personType = personType;
	}

	public String getPersonType() {
		return this.personType;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardType() {
		return this.cardType;
	}
}
