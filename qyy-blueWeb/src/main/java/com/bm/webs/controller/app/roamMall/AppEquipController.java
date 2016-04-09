package com.bm.webs.controller.app.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.AppData;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.roamMall.AppProductService;
import com.bm.webs.service.roamMall.MerchEquipService;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 装备模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月9日
 */
@Controller
@RequestMapping(value = "app/roamMall/equip")
public class AppEquipController extends BaseController {

	@Autowired
	private AppProductService appProductService;//商品
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	@Autowired
	private MerchEquipService merchEquipService;//装备分类

	/**
	 * 获取列表
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public AppData data() {
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
			res.setData("list", appProductService.getEquipList(param));
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取装备分类列表
	 * @return
	 */
	@RequestMapping(value = "equipList")
	@ResponseBody
	public AppData equipList() {
		AppData res = new AppData();
		try {
			res.setData("list", merchEquipService.allList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
