package com.bm.webs.bean;

import com.bm.webs.bean.base.BaseBean;

public class AuthCode extends BaseBean{

	private String phone; //手机号码
	private String code; //验证码
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
}
