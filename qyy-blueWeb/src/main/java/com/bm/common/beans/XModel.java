package com.bm.common.beans;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * basemodel
 * (基类，每个bean都需要来继承此类)
 * @author mike
 *
 */
public class XModel implements Serializable {

	private static final long serialVersionUID = -6662258321008059437L;

	protected Integer id;
	protected String state;
	protected Timestamp created;

	public XModel() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

}
