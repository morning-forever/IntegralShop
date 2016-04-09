package com.bm.webs.controller.app.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.AppData;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.roamMall.AppProductService;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchRestaurantService;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 餐饮模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月9日
 */
@Controller
@RequestMapping(value = "app/roamMall/cater")
public class AppCaterController extends BaseController {

	@Autowired
	private AppProductService appProductService;//商品
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	@Autowired
	private MerchRestaurantService merchRestaurantService;//餐饮
	
	@Autowired
	private MerchGoodsService merchGoodsService;//商品

	/**
	 * 获取列表
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public AppData list() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			//转换价格区间
			Long priceId = param.getLong("priceId");
			if(priceId != null){
				WebPriceSearch webPrice = webPriceSearchService.getById(priceId);
				param.put("priceStart", webPrice.getPriceStart());
				param.put("priceEnd", webPrice.getPriceEnd());
			}
			res.setData("list", appProductService.getCaterList(param));
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取餐饮分类列表
	 * @return
	 */
	@RequestMapping(value = "restList")
	@ResponseBody
	public AppData restList() {
		AppData res = new AppData();
		try {
			res.setData("list", merchRestaurantService.allList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取餐饮人数列表
	 * @return
	 */
	@RequestMapping(value = "mealList")
	@ResponseBody
	public AppData mealList() {
		AppData res = new AppData();
		try {
			res.setData("list", appProductService.getCaterMealList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取餐饮详情
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public AppData detail() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long goodsId = param.getLong("id");
			if (ValidateHelper.isNullOrEmpty(goodsId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("cater", merchGoodsService.findGoodsCaterById(goodsId));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
