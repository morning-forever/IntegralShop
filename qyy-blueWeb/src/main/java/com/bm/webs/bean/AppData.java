package com.bm.webs.bean;

import java.util.HashMap;
import java.util.Map;

import com.bm.common.beans.XConst;

/**
 * APP接口数据封装类
 * 
 * @author liuw
 *
 */
public class AppData {

	// 标识
	private String status;
	// 错误消息
	private String msg = null;
	// 数据
	private Object data = null;

	// 构造函数
	public AppData() {
		this.setStatus(XConst.FAIL);// 默认为失败
		this.setMsg("");// 默认没有
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object getData() {
		return data;
	}

	public void setData(String key, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(key, value);
		this.data = map;
	}
}
