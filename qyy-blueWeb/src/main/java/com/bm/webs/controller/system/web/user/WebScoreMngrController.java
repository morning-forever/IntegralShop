package com.bm.webs.controller.system.web.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebScoreService;

/**
 * 
 * 会员积分管理
 * 
 * 
 * @author mike <br>
 *         2015年8月14日
 */
@SuppressWarnings("unchecked")
@Controller
@RequestMapping(value = "admin/webscoremngr")
public class WebScoreMngrController extends BaseController {

	@Autowired
	private WebScoreService webScoreService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/user/score_main");
		try {
			List<PageData> dataEx = webScoreService.findExList();
			List<PageData> dataTrem = webScoreService.findTremList();
			List<PageData> dataObtain = webScoreService.findObtainList();

			mav.addObject("exList", dataEx);
			mav.addObject("tremList", dataTrem);
			mav.addObject("obtainList", dataObtain);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "saveEx")
	@ResponseBody
	public PageData saveEx() {
		PageData pd = super.getPageData();

		try {
			List<PageData> params = new ArrayList<PageData>();
			PageData param = null;
			ConcurrentHashMap<String, String> map = new ConcurrentHashMap<String, String>();
			map.putAll(pd);
			Set<String> keys = map.keySet();
			for (String key : keys) {
				String skey = null;
				param = new PageData();
				if (key.contains("ex_rmb")) {
					param.put("exRmb", map.get(key));
					skey = key.replace("rmb", "score");
					param.put("ruleScore", map.get(skey));
				} else {
					param.put("ruleScore", map.get(key));
					skey = key.replace("score", "rmb");
					param.put("exRmb", map.get(skey));

				}
				keys.remove(key);
				keys.remove(skey);
				Long id = Long.valueOf(key.substring(key.lastIndexOf("_") + 1, key.length()));
				param.put("id", id);
				params.add(param);
				if (keys.isEmpty()) {
					break;
				}
			}
			boolean isSave = webScoreService.updateRuleEx(params);
			pd.clear();
			if (isSave)
				pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
			else
				pd.put(XConst.STATUS_KEY, XConst.FAIL);
		} catch (Exception e) {
			pd.put(XConst.STATUS_KEY, XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}

	@RequestMapping(value = "saveObtainAndTrem")
	@ResponseBody
	public PageData saveObtainAndTrem() {
		PageData pd = super.getPageData();
		try {
			ConcurrentHashMap<String, String> map = new ConcurrentHashMap<String, String>();
			map.putAll(pd);
			List<PageData> obtainData = new ArrayList<PageData>();
			List<PageData> tremData = new ArrayList<PageData>();
			Set<String> keys = map.keySet();
			PageData param = null;
			for (String key : keys) {
				param = new PageData();
				Long id = Long.valueOf(key.substring(key.lastIndexOf("_") + 1, key.length()));
				param.put("id", id);
				if (key.contains("obtain")) {
					param.put("ruleScore", map.get(key));
					obtainData.add(param);
				} else {
					param.put("exTrem", map.get(key));
					tremData.add(param);
				}
			}
			pd.clear();
			if (webScoreService.updateObtainAndTrem(obtainData, tremData)) {
				pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
			} else {
				pd.put(XConst.STATUS_KEY, XConst.FAIL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pd;
	}

	@RequestMapping(value = "scoreDetail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/web/user/score_detail");
		try {
			PageData pd = webScoreService.findDetail();
			mav.addObject("data", pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "saveDetail")
	@ResponseBody
	public PageData saveDetail() {
		PageData pd = super.getPageData();
		try {
			if (HString.isEmpty(pd.get("content"))) {
				pd.put(XConst.STATUS_KEY, XConst.PARAM_EMPTY);
				return pd;
			}
			String detail = pd.getString("content");
			PageData param = new PageData();
			param.put("detail", detail);
			param.put("id", pd.getString("id"));
			boolean isSave = webScoreService.updateDetail(param);
			pd.clear();
			if (isSave)
				pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
			else
				pd.put(XConst.STATUS_KEY, XConst.FAIL);
		} catch (Exception e) {
			pd.put(XConst.STATUS_KEY, XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
