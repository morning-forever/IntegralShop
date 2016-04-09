package com.bm.common.beans;

import java.util.HashMap;
import java.util.Map;

/**
 * 封装传输数据
 * 
 * @author mike
 * 
 */
public class XResult {
	
	private String flag;
	
	private Map<String, Object> map;

	public XResult() {
		this.flag = XConst.DATA_EMPTY;// 默认为空
	}

	public XResult(String flag) {
		this.flag = flag;
	}

	public XResult(String flag, Map<String, Object> map) {
		this.flag = flag;
		this.map = map;
	}

	public void put(String key, Object val) {
		if (map == null)
			map = new HashMap<String, Object>();
		map.put(key, val);
	}

	public Object get(String key) {
		if (map != null)// && flag.indexOf("success") >= 0
			return map.get(key);
		return null;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

}
