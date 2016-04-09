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
import com.bm.webs.service.web.center.WebHelperService;

@Controller(value = "adminHelperController")
@RequestMapping(value = "admin/helper")
public class HelperController extends BaseController {

	@Autowired
	private WebHelperService helperService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/helper/main");

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
				param.put("issue", HString.isEmpty(json.get("issue")) ? "" : json.get("issue"));
				param.put("answer", HString.isEmpty(json.getString("answer")) ? "" : json.getString("answer"));
			}
			res = helperService.helperAdminList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			res = helperService.detail(param);
			if (!HString.isEmpty(res)) {
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = false;
			if (param.containsKey("id") && param.getLong("id") != null) {
				isOk = helperService.updateHelper(param);
			} else {
				isOk = helperService.addHelper(param);
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
			boolean isOk = helperService.delHelper(param);
			if (isOk) {
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
