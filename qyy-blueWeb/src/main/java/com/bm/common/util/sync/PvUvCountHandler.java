package com.bm.common.util.sync;

import java.util.Map;

import com.bm.common.beans.XResult;
import com.bm.common.listener.SpringContextListener;
import com.bm.webs.service.system.PvUvCountService;

public class PvUvCountHandler implements ITaskHandler {

	private static final String PV_UV_TASK_ADD = "add";

	@Override
	public XResult execute(Map<String, Object> params, String taskId) throws Exception {
		if (PV_UV_TASK_ADD.equals(taskId)) {
			add(params.get("accessIp").toString(), params.get("accessUrl").toString());
		}
		return null;
	}

	protected boolean add(String accessIp, String accessUrl) throws Exception {
		PvUvCountService pvuvCountService = SpringContextListener.getSpringContext().getBean(PvUvCountService.class);
		if (pvuvCountService == null)
			return false;
		return pvuvCountService.addPvUvCount(accessIp, accessUrl);
	}

}
