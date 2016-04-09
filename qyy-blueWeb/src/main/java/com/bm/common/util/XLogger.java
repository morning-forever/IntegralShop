package com.bm.common.util;

import org.apache.log4j.Logger;

/**
 * 日志
 * 
 * @author mike
 * 
 */
public class XLogger {

	protected static Logger log;

	public XLogger() {
		log = Logger.getLogger(this.getClass());
	}

}
