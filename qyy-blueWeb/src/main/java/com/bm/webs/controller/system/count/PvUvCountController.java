package com.bm.webs.controller.system.count;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PVUV;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.PvUvCountService;

@Controller(value = "pvUvCountController")
@RequestMapping("admin/puvcount")
public class PvUvCountController extends BaseController {

	@Autowired
	private PvUvCountService pvuvcountService;

	@RequestMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/count/main");
		return mav;
	}

	@RequestMapping("list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);

				String startTime = json.getString("startTime");
				String endTime = json.getString("endTime");

				if (!HString.isEmpty(json.get("startTime"))) {
					startTime = startTime + " 00:00:00";
				}
				if (!HString.isEmpty(json.get("endTime"))) {
					endTime = endTime + " 23:59:59";
				}

				param.put("startTime", startTime);
				param.put("endTime", endTime);
			}
			res = pvuvcountService.getPVUVCountList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			res.putStatus(XConst.SUCCESS);
			e.printStackTrace();
		}
		return res;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("detail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/count/pv_detail");
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String accessTime = param.getString("accessTime");
			String startTime = null;
			String endTime = null;
			if (!HString.isEmpty(accessTime)) {
				startTime = accessTime + " 00:00:00";
				endTime = accessTime + " 23:59:59";
			}
			param.put("startTime", startTime);
			param.put("endTime", endTime);
			res = pvuvcountService.getPVUVCountList(param);
			List<PVUV> pulist = (List<PVUV>) res.get("data");
			if (HString.isEmpty(pulist) && pulist.size() != 1) {
				return new ModelAndView("404");
			}
			mav.addObject("pvuv", pulist.get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("search")
	@ResponseBody
	public PageData search() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String accessTime = param.getString("accessTime");
			String startTime = null;
			String endTime = null;
			if (!HString.isEmpty(accessTime)) {
				startTime = accessTime + " 00:00:00";
				endTime = accessTime + " 23:59:59";
			}
			param.put("startTime", startTime);
			param.put("endTime", endTime);
			String accessUrl = param.getString("accessUrl");
			if (!HString.isEmpty(accessUrl)) {
				param.put("accessUrl", "'%" + accessUrl + "'");
				res = pvuvcountService.getPVDetailByUrl(param);
				if (HString.isEmpty(res)) {
					res.putStatus(XConst.FAIL);
				} else {
					res.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.putStatus(XConst.EXCEPTION);
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
