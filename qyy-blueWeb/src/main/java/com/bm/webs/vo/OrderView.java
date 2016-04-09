package com.bm.webs.vo;

import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.integralShop.Order;

public class OrderView extends Order{
	
	private String address;
	
	private WebUser webUser;
	
	private GoodsView goods;
	
	
	public WebUser getWebUser() {
		return webUser;
	}

	public void setWebUser(WebUser webUser) {
		this.webUser = webUser;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public GoodsView getGoods() {
		return goods;
	}
	public void setGoods(GoodsView goods) {
		this.goods = goods;
	}
	
	
}
