package com.bm.webs.bean;

import java.io.Serializable;
import java.util.List;

import com.bm.common.util.HString;

public class AreaAll implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7202885624607369418L;
	private Long id;
	private List<AreaAll> list;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return this.id;
	}

	private Integer sum;
	private java.util.Date createDate;

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public java.util.Date getCreateDate() {
		return this.createDate;
	}

	private java.util.Date modifyDate;

	public void setModifyDate(java.util.Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public java.util.Date getModifyDate() {
		return this.modifyDate;
	}

	public List<AreaAll> getList() {
		return list;
	}

	public void setList(List<AreaAll> list) {
		this.list = list;
	}

	private Integer orders;

	public void setOrders(Integer orders) {
		if (!HString.isEmpty(orders))
			this.orders = orders;
	}

	public Integer getOrders() {
		return this.orders;
	}

	private String fullName;

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getFullName() {
		return this.fullName;
	}

	private String name;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	private String treePath;

	public void setTreePath(String treePath) {
		if (!HString.isEmpty(treePath))
			this.treePath = treePath;
	}

	public String getTreePath() {
		return this.treePath;
	}

	private Long parent;

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public Long getParent() {
		return this.parent;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

	/**
	 * 地区名拼音全拼
	 */
	private String full;
	/**
	 * 地区名拼音首字母
	 */
	private String first;

	public String getFull() {
		return full;
	}

	public void setFull(String full) {
		this.full = full;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public Integer isShow;

	public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

}
