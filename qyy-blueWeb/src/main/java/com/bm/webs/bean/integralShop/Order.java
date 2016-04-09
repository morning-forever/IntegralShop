package com.bm.webs.bean.integralShop;

public class Order {
	
	private Integer id;
	private Long userId;
	private Integer quantity;
	private String zipCode;
	private String consignee;
	private String tel;
	private Area area;
	private String detailStreet;
	private String time;
	private String orderId;
	private Integer exchRcdStatus;
	private String waybillNumber;
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	public String getDetailStreet() {
		return detailStreet;
	}
	public void setDetailStreet(String detailStreet) {
		this.detailStreet = detailStreet;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getExchRcdStatus() {
		return exchRcdStatus;
	}
	public void setExchRcdStatus(Integer exchRcdStatus) {
		this.exchRcdStatus = exchRcdStatus;
	}
	public String getWaybillNumber() {
		return waybillNumber;
	}
	public void setWaybillNumber(String waybillNumber) {
		this.waybillNumber = waybillNumber;
	}
	
	

}
