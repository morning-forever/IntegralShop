package com.bm.webs.controller.app.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarBrandService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarTypeService;

/**
 * 首页-快旅模块
 * 
 * @author liuw
 * 
 *         2015年9月25日
 */
@Controller(value = "appCartController")
@RequestMapping(value = "app/cart")
public class AppCartController extends BaseController {

	@Autowired
	private WebCarRuleService carRuleService;
	@Autowired
	private WebCarAddrsService carAddrsService;
	@Autowired
	private WebCarTypeService carTypeService;
	@Autowired
	private WebCarBrandService carBrandService;
	@Autowired
	private WebPriceSearchService carPriceSearchService;

	/**
	 * 查询用车规则列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "ruleList")
	@ResponseBody
	public PageData ruleList() {
		PageData res = new PageData();
		try {
			res.putData("ruleList", carRuleService.findListToIndex());
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询城市列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityList")
	@ResponseBody
	public PageData getCityList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> cityList = carAddrsService.findListByType(type);
				res.putData("cityList", cityList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 根据市ID查询区列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "countyList")
	@ResponseBody
	public PageData countyList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			Long cityId = pd.getLong("cityId");
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(cityId) || ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> countyList = carAddrsService.findCountyByCityId(cityId, type);
				res.putData("countyList", countyList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 根据城市ID查询所有门市
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrList")
	@ResponseBody
	public PageData addrList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			Long countyId = pd.getLong("countyId");
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(countyId) || ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> addrList = carAddrsService.findStoreByCountyId(countyId, type);
				res.putData("addrList", addrList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询车辆类型列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "typeList")
	@ResponseBody
	public PageData typeList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> typeList = carTypeService.findCarTypeList(type);
				res.putData("typeList", typeList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询车辆所有品牌列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "brandList")
	@ResponseBody
	public PageData brandList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> brandList = carBrandService.findCarBrandList(type);
				res.putData("brandList", brandList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询车辆价格区间列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "priceList")
	@ResponseBody
	public PageData getPriceList() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String type = pd.getString("type");
			if (ValidateHelper.isNullOrEmpty(type)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> priceList = carPriceSearchService.findListByType("car_" + type);
				res.putData("priceList", priceList);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
