package com.bm.webs.controller.system.web.car;

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
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.cart.WebCarAddrsService;

@Controller(value = "adminCartAddrsController")
@RequestMapping(value = "admin/cart")
public class WebCartAddrsController extends BaseController {

	@Autowired
	private WebCarAddrsService carAddrsService;
	@Autowired
	private WebCitysService webCitysService;

	/**
	 * 进入地点管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrs/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/car/addrs_main");
		try {
			List<PageData> cityList = carAddrsService.findAdminCityList(null);
			List<PageData> allCityList = webCitysService.findListByType("city");
			mav.addObject("cityList", cityList);
			mav.addObject("allCityList", allCityList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 夹杂list列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrs/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("cityId", HString.isEmpty(json.get("cityId")) ? "" : json.get("cityId"));
				param.put("countyId", HString.isEmpty(json.get("countyId")) ? "" : json.get("countyId"));
				param.put("store", HString.isEmpty(json.getString("store")) ? "" : json.getString("store"));
				param.put("addrType", json.getString("carType"));// #{addrType}
			} else {
				param.put("addrType", HString.isEmpty(param.getString("carType")) ? "rent" : param.getString("carType"));
			}
			res = carAddrsService.findAddrAdminList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 区域列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrs/countyList")
	@ResponseBody
	public PageData countyList() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			List<PageData> countyList = carAddrsService.findAdminCountyList(param.getLong("cityId"));
			if (!HString.isEmpty(countyList)) {
				res.put("countyList", countyList);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 区域列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrs/storeList")
	@ResponseBody
	public PageData storeList() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			List<PageData> storeList = carAddrsService.findAdminAddrList(param.getLong("countyId"));
			if (!HString.isEmpty(storeList)) {
				res.put("storeList", storeList);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 添加或保存地点信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrs/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			boolean isOk = carAddrsService.save(param);
			if (isOk) {
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "addrs/detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			PageData data = carAddrsService.findAddrById(param.getLong("id"));
			if (!HString.isEmpty(data)) {
				res.put("detail", data);
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
