package com.bm.webs.bean;

import java.util.Date;

/**
 * 
 * 租车联系人信息
 * 
 * @author Hham
 *
 */
public class WebOrderRentInfo {

	private Long id;
	private Date createTime;
	private Date startDate;
	private Date endDate;
	private Long getStoreId;
	private Long loseStoreId;
	private Long orderFormId;
	private String dayPrice;
	
	public String getDayPrice() {
		return dayPrice;
	}
	public void setDayPrice(String dayPrice) {
		this.dayPrice = dayPrice;
	}
	public Long getOrderFormId() {
		return orderFormId;
	}
	public void setOrderFormId(Long orderFormId) {
		this.orderFormId = orderFormId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Long getGetStoreId() {
		return getStoreId;
	}
	public void setGetStoreId(Long getStoreId) {
		this.getStoreId = getStoreId;
	}
	public Long getLoseStoreId() {
		return loseStoreId;
	}
	public void setLoseStoreId(Long loseStoreId) {
		this.loseStoreId = loseStoreId;
	}
	
	
	
	
}
