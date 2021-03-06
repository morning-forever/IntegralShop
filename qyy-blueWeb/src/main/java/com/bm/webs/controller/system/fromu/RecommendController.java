package com.bm.webs.controller.system.fromu;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.bm.webs.service.web.WebHomeBannerService;
import com.bm.webs.service.web.forum.WebTravelsService;

/**
 * 后台推荐Controller
 * 
 * @author Hham
 *
 */
@RequestMapping(value = "admin/fromu")
@Controller(value = "adminRecommendController")
public class RecommendController extends BaseController {

	/**
	 * 推荐表推荐类型对应字段
	 * 
	 * travels:精彩游记推荐 travels_banner:精彩游记Banner master_travels:达人攻略推荐
	 * master_travels_banner:达人攻略Banner bbs:会员互动推荐 bbs_banner:会员互动Banner
	 */

	@Autowired
	private WebRecommendService webRecommendService;

	@Autowired
	private WebHomeBannerService webHomeBannerService;

	@Autowired
	private WebTravelsService webTravelsService;

	private static final String WEB_TRAVELS = "web_travels";

	private static final String HOME_BANNER = "homeBanner";

	private static final String[] FROM_TYPE_ARR = { "bbs", "travels", "master_travels", "bbs_banner",
			"travels_banner", "master_travels_banner" };
	private static final String[] FROM_TYPE_NAME_ARR = { "会员互动推荐", "精彩游记推荐", "达人攻略推荐", "会员互动Banner",
			"精彩游记Banner", "达人攻略Banner" };

	/**
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("system/fromu/banner_list");
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
			List<Map<String, Object>> fromTypeList = getTypeList(type);
			List<Map<String, Object>> cityList = webTravelsService.findTravelsCity(new PageData());
			mav.addObject("fromTypeList", fromTypeList);
			mav.addObject("cityList", cityList);
			mav.addObject("type", type);
			mav.setViewName("system/fromu/edit_banner");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "edit_{id}_{type}")
	public ModelAndView eidt(@PathVariable(value = "type") Long type, @PathVariable(value = "id") Long id) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Map<String, Object>> fromTypeList = getTypeList(type);
			List<Map<String, Object>> cityList = webTravelsService.findTravelsCity(new PageData());
			PageData pd = new PageData();
			pd.put("id", id);
			Map<String, Object> map;
			if (1 == type) {
				map = webRecommendService.findRecommendDetial(pd);
			} else {
				map = webHomeBannerService.findBannerDetial(pd);
			}
			mav.addObject("map", map);
			mav.addObject("fromTypeList", fromTypeList);
			mav.addObject("cityList", cityList);
			mav.addObject("type", type);
			mav.setViewName("system/fromu/edit_banner");
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
	@RequestMapping(value = "recommendList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(Long type) {
		PageData pd = getSysPageData();
		try {
			pd.put("fromTable", WEB_TRAVELS);
			List<Map<String, Object>> list = null;
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("startDate", json.get("startDate"));
				pd.put("endDate", json.get("endDate"));
				pd.put("fromType", json.get("fromType"));
			}
			if (type == 1) {
				list = webRecommendService.findWebList(pd);
			} else {
				if (ValidateHelper.isNullOrEmpty(pd.getString("fromType"))) {
					pd.put("fromType", "'travels_banner','bbs_banner','master_travels_banner'");
				}
				list = webHomeBannerService.findBbsBannerList(pd);
			}
			pd.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 修改上线状态
	 * 
	 * @param ids
	 * @param state
	 * @return
	 */
	@RequestMapping(value = "changeEnable", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData changeEnable(String ids, Long state, Long type) {
		PageData pd = getApiPageData();
		try {
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			pd.put("ids", ids);
			pd.put("state", state);
			if (type == 1) {
				webRecommendService.updateEnable(pd);
			} else {
				webHomeBannerService.updateEnable(pd);
			}
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 删除推荐或Banner
	 * 
	 * @param ids
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "deletes", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes(String ids, Long type) {
		PageData pd = getApiPageData();
		try {
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			pd.put("ids", ids);
			if (type == 1) {
				webRecommendService.deleteRecommend(pd);
			} else {
				webHomeBannerService.deleteRecommend(pd);
			}
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
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
	public PageData getSelectList(Long fromTable) {
		PageData pd = getSysPageData();
		try {
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("addrId", json.get("addrId"));
				pd.put("title", json.get("title"));
			}
			pd.put("travelType", fromTable);
			List<Map<String, Object>> list = webTravelsService.findStrategyList(pd);
			pd.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
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
				if (1 == type) {
					pd.put("from_table", WEB_TRAVELS);
					Integer checkId = webRecommendService.checkRecommend(pd);
					if (checkId == null) {
						webRecommendService.insertRecommend(pd);
						pd.putStatus(XConst.SUCCESS);
					} else {
						pd.putStatus(XConst.EXISTS);
					}
				} else if (2 == type) {
					pd.put("from_table", pd.getLong("from_table")+5);// 在Banner表中,table存的是数字,[6,7,8]都代表文章
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
				}
			} else {// 编辑
				if (1 == type) {
					pd.put("from_table", WEB_TRAVELS);
					Integer checkId = webRecommendService.checkRecommend(pd);
					if (checkId == null) {
						webRecommendService.updateRecommend(pd);
						pd.putStatus(XConst.SUCCESS);
					} else {
						pd.putStatus(XConst.EXISTS);
					}
				} else if (2 == type) {
					pd.put("from_table", pd.getLong("from_table")+5);// 在Banner表中,table存的是数字,[6,7,8]都代表文章
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
			}

		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 根绝Type生成类型列表
	 * 
	 * @param type
	 * @param startIndex
	 * @return
	 */
	private List<Map<String, Object>> getTypeList(Long type) {
		Integer startIndex = 0;
		List<Map<String, Object>> fromTypeList;
		if (type == 1) {
			startIndex = 0;
		} else if (type == 2) {
			startIndex = 3;
		}
		fromTypeList = new ArrayList<Map<String, Object>>();
		for (int i = startIndex; i < startIndex + 3; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("fromType", FROM_TYPE_ARR[i]);
			map.put("fromTypeName", FROM_TYPE_NAME_ARR[i]);
			fromTypeList.add(map);
		}
		return fromTypeList;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
