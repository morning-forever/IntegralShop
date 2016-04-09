package com.bm.webs.controller.app.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.AdminReportService;

/**
 * APP举报
 * @author Hham
 *
 */
@Controller(value = "AppReportController")
@RequestMapping(value = "app/question")
public class AppReportController extends BaseController{
	
	@Autowired
	private AdminReportService adminReportService; 

	/**
	 * 添加举报
	 * @return
	 */
	@RequestMapping(value = "addReport", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReport() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "fromTable", "fromId","reportReason" };
			String[] tips = new String[] { "类型", "评论ID","举报原因" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				adminReportService.insertReport(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
