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
import com.bm.webs.service.web.WebAdvertService;

@Controller(value = "adminAdvertController")
@RequestMapping(value = "admin/advert")
public class AdvertController extends BaseController {

	@Autowired
	private WebAdvertService advertService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/advert/main");

		return mav;
	}

	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("title", HString.isEmpty(json.get("title")) ? "" : json.get("title"));
				param.put("endTime", HString.isEmpty(json.getString("endTime")) ? "" : json.getString("endTime"));
			}
			res = advertService.findAdvertList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "detail")
	@ResponseBody
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/advert/detail");
		try {
			PageData param = super.getSysPageData();
			if(param.getLong("id") != 0){
				PageData res = advertService.detail(param);
				mav.addObject("detail", res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = false;
			if (param.containsKey("id") && param.getLong("id") != null) {
				isOk = advertService.updateAdvert(param);
			} else {
				isOk = advertService.addAdvert(param);
			}
			if (isOk) {
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "dels")
	@ResponseBody
	public PageData dels() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = advertService.delAdvert(param);
			if (isOk) {
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.EXISTS);
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
