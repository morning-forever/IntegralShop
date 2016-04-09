package com.bm.webs.controller.system.depth;

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
import com.bm.webs.service.depth.WebDepthService;
import com.bm.webs.service.system.WebRecommendService;
import com.bm.webs.service.web.WebHomeBannerService;

/**
 * 后台推荐Controller
 * 
 * @author jiangl
 *
 */
@RequestMapping(value = "admin/depth/recommand")
@Controller
public class AdminDepthRecommendController extends BaseController {

	@Autowired
	private WebRecommendService webRecommendService;

	@Autowired
	private WebHomeBannerService webHomeBannerService;

	@Autowired
	private WebDepthService webDepthService;//深度游

	private static final String WEB_DEPTH = "web_depth";
	
	private static final String HOME_BANNER="homeBanner";
	
	/**
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		PageData param = getPageData();
		if(ValidateHelper.isNullOrEmpty(param.get("tabIndex"))){
			mav.addObject("tabIndex", 0);
		}else{
			mav.addObject("tabIndex", param.get("tabIndex"));
		}
		mav.setViewName("system/depth/depth_banner_list");
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
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			param.put("fromTable", WEB_DEPTH);
			List<Map<String, Object>> list = null;
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("startDate", json.get("startDate"));
				param.put("endDate", json.get("endDate"));
			}
			//推荐
			if (type == 1) {
				param.put("fromType", "depth_recommand");
				list = webRecommendService.findWebList(param);
			}
			//banner图
			else {
				param.put("fromType", "'depth'");
				list = webHomeBannerService.findBbsBannerList(param);
			}
			res.put("data", list);
			res.put("recordsTotal", param.get("recordsTotal"));
			res.put("recordsFiltered", param.get("recordsFiltered"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
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
			List<Map<String, Object>> fromTypeList= getTypeList(type);
			mav.addObject("fromTypeList", fromTypeList);
			mav.addObject("type", type);
			mav.setViewName("system/depth/depth_banner_info");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转到编辑页
	 * @param type
	 * @param id
	 * @return
	 */
	@RequestMapping(value="edit_{id}_{type}")
	public ModelAndView eidt(@PathVariable(value="type") Long type,@PathVariable(value="id") Long id){
		ModelAndView mav = new ModelAndView();
		try {
			List<Map<String, Object>> fromTypeList= getTypeList(type);
			PageData param = new PageData();
			param.put("id", id);
			Map<String, Object> map;
			if(1 == type){
				map = webRecommendService.findDepthRecommendDetial(param);
			}else{
				map = webHomeBannerService.findDetphBannerDetial(param);
			}
			mav.addObject("map", map);
			mav.addObject("fromTypeList", fromTypeList);
			mav.addObject("type", type);
			mav.setViewName("system/depth/depth_banner_info");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
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
		PageData res = new PageData();
		try {
			PageData param = getApiPageData();
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			param.put("ids", ids);
			param.put("state", state);
			if (type == 1) {
				webRecommendService.updateEnable(param);
			} else {
				webHomeBannerService.updateEnable(param);
			}
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return res;
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
		PageData res = new PageData();
		try {
			PageData param = getApiPageData();
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			param.put("ids", ids);
			if (type == 1) {
				webRecommendService.deleteRecommend(param);
			} else {
				webHomeBannerService.deleteRecommend(param);
			}
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询选择栏目列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "depthList")
	@ResponseBody
	public PageData depthList() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("depthName", json.get("depthName"));
			}
			param.put("isShelves", "0");
			res = webDepthService.getAdminDepthList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交推荐和Banner
	 * @return
	 */
	@RequestMapping(value = "submit", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submit() {
		PageData res = new PageData();
		try {
			PageData param = getApiPageData();
			Long type = param.getLong("type");
			String isShelves = param.getString("isShelves");
			if (ValidateHelper.isNullOrEmpty(isShelves)) {
				param.put("isShelves", 1);
			}
			Long id=param.getLong("id");
			if(id == null){//新增
				if (1 == type) {
					param.put("from_table", WEB_DEPTH);
					Integer checkId = webRecommendService.checkRecommend(param);
					if (checkId == null) {
						webRecommendService.insertRecommend(param);
						res.putStatus(XConst.SUCCESS);
					} else {
						res.putStatus(XConst.EXISTS);
					}
				} else if (2 == type) {
					param.put("from_table", 1);//在Banner表中,table存的是数字,1-代表主题深度游
					param.put("banner_where", 1);//发布类型,后台没有编辑发布位置,暂时写1
					
					param.put("picUrl", param.get("url"));
					param.put("from", HOME_BANNER);
					param.put("type", "banner");
					
					Integer checkId=webHomeBannerService.checkBanner(param);
					if (checkId == null) {
						webHomeBannerService.insertBanner(param);
						res.putStatus(XConst.SUCCESS);
					} else {
						res.putStatus(XConst.EXISTS);
					}
				}
			}else{//编辑
				if (1 == type) {
					param.put("from_table", WEB_DEPTH);
					Integer checkId = webRecommendService.checkRecommend(param);
					if (checkId == null) {
						webRecommendService.updateRecommend(param);
						res.putStatus(XConst.SUCCESS);
					} else {
						res.putStatus(XConst.EXISTS);
					}
				} else if (2 == type) {
					param.put("from_table", 1);// 在Banner表中,1-代表深度游
					param.put("banner_where", 1);// 发布类型,后台没有编辑发布位置,暂时写1
					
					param.put("picUrl", param.get("url"));
					param.put("from", HOME_BANNER);
					param.put("type", "banner");
					
					Integer checkId=webHomeBannerService.checkBanner(param);
					if (checkId == null) {
						webHomeBannerService.updateBanner(param);
						res.putStatus(XConst.SUCCESS);
					} else {
						res.putStatus(XConst.EXISTS);
					}
				}
			}
			
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 根绝Type生成类型列表
	 * @param type
	 * @param startIndex
	 * @return
	 */
	private List<Map<String, Object>> getTypeList(Long type) {
		List<Map<String, Object>> fromTypeList = new ArrayList<Map<String, Object>>();;
		Map<String, Object> map = new HashMap<String, Object>();
		if (type == 1) {
			map.put("fromType", "depth_recommand");
			map.put("fromTypeName", "主题深度游推荐");
			fromTypeList.add(map);
		} else if (type == 2) {
			map.put("fromType", "depth");
			map.put("fromTypeName", "主题深度游banner");
			fromTypeList.add(map);
		}
		return fromTypeList;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
