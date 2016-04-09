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
import com.bm.webs.service.businessSystem.MerchBrandService;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchThemeService;
import com.bm.webs.service.roamMall.MerchHotelLocService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebSimpleHotelStarService;

/**
 * 酒店模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年9月29日
 */
@Controller
@RequestMapping(value = "app/roamMall/hotel")
public class AppHotelController extends BaseController {

	@Autowired
	private AppProductService appProductService;//商品
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	@Autowired
	private WebSimpleHotelStarService webSimpleHotelStarService;//星级
	
	@Autowired
	private MerchBrandService merchBrandService;//品牌
	
	@Autowired
	private MerchThemeService merchThemeService;//主题
	
	@Autowired
	private MerchHotelLocService merchHotelLocService;//位置
	
	@Autowired
	private MerchGoodsService merchGoodsService;//商品
	
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
			res.setData("list", appProductService.getHotelList(param));
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取星级列表
	 * @return
	 */
	@RequestMapping(value = "starList")
	@ResponseBody
	public AppData starList() {
		AppData res = new AppData();
		try {
			res.setData("list", webSimpleHotelStarService.allList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取品牌列表
	 * @return
	 */
	@RequestMapping(value = "brandList")
	@ResponseBody
	public AppData brandList() {
		AppData res = new AppData();
		try {
			res.setData("list", merchBrandService.allList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取主题列表
	 * @return
	 */
	@RequestMapping(value = "themeList")
	@ResponseBody
	public AppData themeList() {
		AppData res = new AppData();
		try {
			res.setData("list", merchThemeService.allList());
			res.setStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 根据城市获取位置列表
	 * @return
	 */
	@RequestMapping(value = "getLoc")
	@ResponseBody
	public AppData getLoc() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long cityId = param.getLong("cityId");
			if (ValidateHelper.isNullOrEmpty(cityId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("list", merchHotelLocService.getListByCityId(cityId));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 根据位置获取具体位置
	 * @return
	 */
	@RequestMapping(value = "getLocDet")
	@ResponseBody
	public AppData getLocDet() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long locId = param.getLong("locId");
			if (ValidateHelper.isNullOrEmpty(locId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("list", merchHotelLocService.getListByLocId(locId));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取酒店详情
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
				res.setData("hotel", merchGoodsService.findGoodsHotelById(goodsId));
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
