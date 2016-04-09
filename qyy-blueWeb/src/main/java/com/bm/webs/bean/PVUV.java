package com.bm.webs.bean;

import java.io.Serializable;

/**
 * 统计pvuv的类
 * 
 * @author mike <br>
 *         2015年12月15日
 * @version 1.0
 */
public class PVUV implements Serializable {

	private static final long serialVersionUID = -2117415801124316982L;

	private String accessTime;
	private long pvTotalCount;
	private long uvTotalCount;

	public String getAccessTime() {
		return accessTime;
	}

	public void setAccessTime(String accessTime) {
		this.accessTime = accessTime;
	}

	public long getPvTotalCount() {
		return pvTotalCount;
	}

	public void setPvTotalCount(long pvTotalCount) {
		this.pvTotalCount = pvTotalCount;
	}

	public long getUvTotalCount() {
		return uvTotalCount;
	}

	public void setUvTotalCount(long uvTotalCount) {
		this.uvTotalCount = uvTotalCount;
	}

}
