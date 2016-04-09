package com.bm.webs.controller.system.count;

import java.util.List;
import java.util.Map;

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
import com.bm.webs.service.system.UserCountService;

@Controller(value = "LoginCountController")
@RequestMapping("admin/login_count")
public class LoginCountController extends BaseController{
	
	@Autowired
	private UserCountService userCountService;
	
	
	/**
	 * 跳转到统计页面
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("system/count/login_count");
		return mav;
	}
	
	/**
	 * 查询统计List
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(){
		PageData pd=getSysPageData();
		try {
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				
				String startTime = json.getString("startTime");
				String endTime = json.getString("endTime");
				
				
				pd.put("startTime",  startTime);
				pd.put("endTime", endTime);
			}
			List<Map<String, Object>> list=userCountService.findLoginList(pd);
			pd.put("data", list);
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
