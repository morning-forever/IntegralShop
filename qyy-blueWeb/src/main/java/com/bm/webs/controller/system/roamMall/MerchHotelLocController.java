package com.bm.webs.controller.system.roamMall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.MerchBrand;
import com.bm.webs.bean.MerchTheme;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.bean.WebSimpleHotelStar;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchBrandService;
import com.bm.webs.service.businessSystem.MerchThemeService;
import com.bm.webs.service.roamMall.MerchHotelLocService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebSimpleHotelStarService;

/**
 * 漫游商城-酒店位置管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/hotelLoc")
public class MerchHotelLocController extends BaseController {

	@Autowired
	private MerchHotelLocService merchHotelLocService;//酒店位置

	@Autowired
	private WebCitysService webCitysService;//城市
	
	@Autowired
	private MerchBrandService merchBrandService;//品牌
	
	@Autowired
	private MerchThemeService merchThemeService;//主题
	
	@Autowired
	private WebSimpleHotelStarService webSimpleHotelStarService;//星级
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = super.getModelAndView();
		try {
			List<MerchBrand> brandList = merchBrandService.allList();
			List<WebSimpleHotelStar> starList = webSimpleHotelStarService.allList();
			List<MerchTheme> themeList = merchThemeService.allList();
			List<WebPriceSearch> priceList = webPriceSearchService.getList("hotel");
			mav.addObject("brandList", brandList);//酒店品牌
			mav.addObject("starList", starList);//酒店星级
			mav.addObject("themeList", themeList);//酒店主题
			mav.addObject("priceList", priceList);//价格筛选
			mav.setViewName("system/roamMall/hotel_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 获取酒店位置列表
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = this.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json = JSONObject.parseObject(str);
				param.put("provinceId",
						HString.isEmpty(json.get("provinceId")) ? "" : json
								.get("provinceId"));
				param.put("cityId", HString.isEmpty(json.get("cityId")) ? ""
						: json.get("cityId"));
//				param.put("countyId", HString.isEmpty(json.get("countyId")) ? ""
//						: json.get("countyId"));
				param.put("locId", HString.isEmpty(json.get("locId")) ? ""
						: json.get("locId"));
			}
			res = merchHotelLocService.getAdminLocList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存酒店位置
	 * 
	 * @return
	 */
	@RequestMapping("/saveLoc")
	@ResponseBody
	public PageData saveLoc() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Integer count = merchHotelLocService.getAdminLocNum(param);
			if (count == 0) {
				String locId = param.getString("locId");
				// 新增
				if (HString.isEmpty(locId)) {
					merchHotelLocService.insertLoc(param);
				}
				// 更新
				else {
					merchHotelLocService.updateLoc(param);
				}
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 编辑酒店位置
	 * 
	 * @return
	 */
	@RequestMapping("/editLoc")
	@ResponseBody
	public PageData editLoc() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String id = param.getString("id");
			if (HString.isEmpty(id)) {
				res.putStatus(XConst.ERROR);
				return res;
			}
			PageData data = merchHotelLocService.getLocById(new Long(id));
			res.put("data", data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除酒店位置
	 * 
	 * @return
	 */
	@RequestMapping("/deleteLoc")
	@ResponseBody
	public PageData deleteLoc() {
		PageData res = super.getSysPageData();
		try {
			PageData param = getPageData();
			merchHotelLocService.deleteLoc(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取酒店位置
	 * @return
	 */
	@RequestMapping("/getLoc")
	@ResponseBody
	public PageData getLoc() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			if (!HString.isEmpty(param.get("cityId"))) {
				List<PageData> locList = merchHotelLocService.getListByCityId(param.getLong("cityId"));
				if (!HString.isEmpty(locList)) {
					res.put("list", locList);
					res.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
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
