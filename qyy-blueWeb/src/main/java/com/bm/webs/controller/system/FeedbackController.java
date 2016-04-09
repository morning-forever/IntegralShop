package com.bm.webs.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.center.FeedbackService;





@Controller(value ="adminFeedbackController")
@RequestMapping(value = "admin/feedback")
public class FeedbackController extends BaseController {
	
	@Autowired
	private FeedbackService feedbackService;
	
	
	@RequestMapping(value = "main")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView("system/feedback/main");
		
		return mav;
	}
	
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("startTime", HString.isEmpty(json.get("startTime")) ? "" : json.get("startTime"));
				param.put("endTime", HString.isEmpty(json.getString("endTime")) ? "" : json.getString("endTime"));
			}
			res = feedbackService.feedbackList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			res = feedbackService.feedbackDetail(param.getLong("backId"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value = "dels")
	@ResponseBody
	public PageData dels(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = feedbackService.dels(param.getLong("id"));
			if(isOk){
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
