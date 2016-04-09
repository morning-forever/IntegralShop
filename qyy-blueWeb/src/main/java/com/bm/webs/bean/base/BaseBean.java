package com.bm.webs.bean.base;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private Date createDate;// 创建时间

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCreateDate() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createDate);
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
