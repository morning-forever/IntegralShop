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
import com.bm.webs.service.web.WebUserLevelService;

/**
 * 用户等级管理
 * 
 * @author mike <br>
 *         2015年8月14日
 */
@Controller
@RequestMapping(value = "admin/userlevelmngr")
public class WebUserLevelMngrController extends BaseController {

	@Autowired
	private WebUserLevelService userLevelService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/user/level_main");
		try {
			PageData pd = userLevelService.getAllList();
			mav.addObject("data", pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData pd = super.getPageData();
		try {
			ConcurrentHashMap<String, String> hashMap = new ConcurrentHashMap<String, String>();
			hashMap.putAll(pd);
			Set<String> set = hashMap.keySet();
			List<PageData> list = new ArrayList<PageData>();
			PageData param = null;
			for (String key : set) {
				param = new PageData();
				if(HString.isEmpty(hashMap.get(key)))
					continue;
				Integer value = Integer.parseInt(hashMap.get(key));
				Long id = Long.valueOf(key.substring(key.lastIndexOf("_") + 1, key.length()));
				param.put("id", id);
				if (key.indexOf("score_st_") >= 0) {
					param.put("requireStart", value);
					String ekey = "score_" + id;
					param.put("requireEnd", hashMap.get(ekey));
					hashMap.remove(key);
					hashMap.remove(ekey);
				} else {
					param.put("requireEnd", value);
					String skey = "score_st_" + id;
					param.put("requireStart", hashMap.get(skey));
					hashMap.remove(key);
					hashMap.remove(skey);
				}
				list.add(param);
			}
			boolean isSave = userLevelService.update(list);
			pd.clear();
			if (isSave) {
				pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
			} else {
				pd.put(XConst.STATUS_KEY, XConst.FAIL);
			}
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
