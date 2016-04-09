package com.bm.common.util.sync;

import java.util.Map;

import com.bm.common.beans.XResult;

/**
 * 
 * 同步任务的处理器接口
 * 
 * @author mike <br>
 *         2015年3月25日
 */
public interface ITaskHandler {

	/**
	 * 执行操作的方法
	 * 
	 * @param params
	 * @param taskId
	 * @return
	 */
	XResult execute(Map<String, Object> params, String taskId) throws Exception;

}
