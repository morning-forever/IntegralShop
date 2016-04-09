package com.bm.webs.bean;

import java.io.Serializable;
import java.util.Date;

import com.bm.webs.bean.base.BaseBean;

public class UserToken  extends BaseBean{

	private static final long serialVersionUID = -3066834368375227026L;


	private Long userId; // 用户id

	private String token; // token

	private Integer timeLimit; // 有效时间


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Integer getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(Integer timeLimit) {
		this.timeLimit = timeLimit;
	}

}
