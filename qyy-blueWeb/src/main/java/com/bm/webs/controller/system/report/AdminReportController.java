package com.bm.webs.controller.system.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.AdminReportService;

/**
 * 举报管理Controller
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="admin/report")
public class AdminReportController extends BaseController{
	
	@Autowired
	private AdminReportService adminReportService;

	/**
	 * 后台查看主页
	 * @return
	 */
	@RequestMapping(value="main")
	public ModelAndView main(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("system/report/list");
		return mav;
	}
	
	/**
	 * 查询List
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(){
		PageData pd=new PageData();
		try {
			PageData param = getSysPageData();
			pd=adminReportService.findList(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 删除被举报评论
	 * @return
	 */
	@RequestMapping(value="deletes",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete(){
		PageData pd=new PageData();
		try {
			PageData param = getSysPageData();
			String ids = param.getString("ids");
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			param.put("ids", ids);
			pd=adminReportService.deleteReply(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 添加举报
	 * @return
	 */
	@RequestMapping(value="addReport",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReport(){
		PageData pd=new PageData();
		try {
			PageData param = getSysPageData();
			adminReportService.insertReport(param);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
