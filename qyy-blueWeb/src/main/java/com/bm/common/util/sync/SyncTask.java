package com.bm.common.util.sync;

import java.util.HashMap;
import java.util.Map;

/**
 * 同步数据加载的任务实体类
 * 
 * @author mike <br>
 *         2015年3月25日
 */
public class SyncTask {

	private String taskId;
	private Map<String, Object> params = new HashMap<String, Object>();
	private ITaskHandler taskHandler;

	public SyncTask(String taskId, Map<String, Object> params,
			ITaskHandler taskHandler) {
		this.taskId = taskId;
		this.params = params;
		this.taskHandler = taskHandler;
	}

	public ITaskHandler getTaskHandler() {
		return taskHandler;
	}

	public String getTaskId() {
		return taskId;
	}

	public Map<String, Object> getParams() {
		return params;
	}

}
