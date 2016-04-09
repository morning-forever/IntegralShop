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
import com.bm.webs.service.roamMall.MerchScenicDestService;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 景区模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年9月29日
 */
@Controller
@RequestMapping(value = "app/roamMall/scenic")
public class AppScenicController extends BaseController {

	@Autowired
	private AppProductService appProductService;//商品
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	@Autowired
	private MerchScenicDestService merchScenicDestService;//景区目的地
	
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
			res.setData("list", appProductService.getScenicList(param));
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 根据城市获取景区目的地列表
	 * @return
	 */
	@RequestMapping(value = "getDest")
	@ResponseBody
	public AppData getDest() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long cityId = param.getLong("cityId");
			if (ValidateHelper.isNullOrEmpty(cityId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("list", merchScenicDestService.getListByCityId(cityId));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取景区详情
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
				res.setData("scenic", merchGoodsService.findGoodsScenicById(goodsId));
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
