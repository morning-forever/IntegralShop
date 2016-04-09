package com.bm.webs.controller.system.web.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.WebRecommendService;
import com.bm.webs.service.web.WebAdvertService;
import com.bm.webs.service.web.WebHomeBannerService;

/**
 * 快旅出行banner
 * 
 * @author Daisy
 *
 */
@RequestMapping(value = "admin/cart/banner")
@Controller
public class CarBannerController extends BaseController {

	@Autowired
	private WebRecommendService webRecommendService;

	@Autowired
	private WebHomeBannerService webHomeBannerService;//banner
	
//	private static final String WEB_ADVERT = "web_advert";//广告表

/*	@Autowired
	private WebTravelsService webTravelsService;//互动社区
	
	@Autowired
	private WebDepthService webDepthService;//深度游

	private static final String WEB_TRAVELS = "web_travels";//互动社区表
	
	private static final String WEB_DEPTH = "web_depth";//主题深度游表
*/
	private static final String HOME_BANNER = "homeBanner";
	
	@Autowired
	private WebAdvertService advertService;//广告

	/**
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("system/car/car_banner_list");
		return mav;
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "add")
	public ModelAndView add(Long type) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("system/car/car_edit_banner");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "edit_{id}_{type}")
	public ModelAndView eidt(@PathVariable(value = "type") Long type, @PathVariable(value = "id") Long id) {
		ModelAndView mav = new ModelAndView();
		try {
			PageData pd = new PageData();
			pd.put("id", id);
			Map<String, Object> map = webHomeBannerService.findAdvertBannerDetial(pd);
			mav.addObject("map", map);
			mav.setViewName("system/car/car_edit_banner");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 请求列表List
	 * 
	 * @return
	 */
	@RequestMapping(value = "bannerList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(Long type) {
		PageData pd = getSysPageData();
		try {
			List<Map<String, Object>> list = null;
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("startDate", json.get("startDate"));
				pd.put("endDate", json.get("endDate"));
				pd.put("fromType", json.get("fromType"));
			}
			pd.put("fromType","'cart'");
			list = webHomeBannerService.findBbsBannerList(pd);
			pd.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 查询选择栏目列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "getSelectList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getSelectList() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("title", HString.isEmpty(json.get("title")) ? "" : json.get("title"));
			}
			//param.put("isEffect", "yes");
			res = advertService.findAdvertList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交推荐和Banner
	 * 
	 * @return
	 */
	@RequestMapping(value = "submit", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submit() {
		PageData pd = getApiPageData();
		pd.putStatus(XConst.ERROR);
		try {
			Long type = pd.getLong("type");
			String isShelves = pd.getString("isShelves");
			if (ValidateHelper.isNullOrEmpty(isShelves)) {
				pd.put("isShelves", 1);
			}
			Long id = pd.getLong("id");
			if (id == null) {// 新增
				pd.put("from_table", pd.getLong("from_table"));// 在Banner表中,table存的是数字,[6,7,8]都代表文章,这里只用6
				pd.put("banner_where", 1);// 发布类型,后台没有编辑发布位置,暂时写1

				pd.put("picUrl", pd.get("url"));
				pd.put("from", HOME_BANNER);
				pd.put("type", "banner");

				pd.put("picUrl", pd.get("url"));
				Integer checkId = webHomeBannerService.checkBanner(pd);
				if (checkId == null) {
					webHomeBannerService.insertBanner(pd);
					pd.putStatus(XConst.SUCCESS);
				} else {
					pd.putStatus(XConst.EXISTS);
				}
			} else {// 编辑
				pd.put("from_table", "9");// 在Banner表中,table存的是数字,9-代表广告
				pd.put("banner_where", 1);// 发布类型,后台没有编辑发布位置,暂时写1
				
				pd.put("from", HOME_BANNER);
				pd.put("type", "banner");
				pd.put("picUrl", pd.get("url"));
				Integer checkId = webHomeBannerService.checkBanner(pd);
				if (checkId == null) {
					webHomeBannerService.updateBanner(pd);
					pd.putStatus(XConst.SUCCESS);
				} else {
					pd.putStatus(XConst.EXISTS);
				}
			}

		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
