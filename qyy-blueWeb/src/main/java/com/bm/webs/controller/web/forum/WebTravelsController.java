package com.bm.webs.controller.web.forum;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebUserCollectionService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebHomeBannerService;
import com.bm.webs.service.web.WebPraiseService;
import com.bm.webs.service.web.forum.WebTravelsService;
import com.bm.webs.service.web.user.WebUserService;

@Controller("pcWebTravelsController")
@RequestMapping("pc/travels")
public class WebTravelsController extends BaseController {

	@Autowired
	private WebUserService webUserService;

	@Autowired
	private WebTravelsService WebTravelsService;

	@Autowired
	private WebUserCollectionService webUserCollectionService;

	@Autowired
	private WebPraiseService webPraiseService;

	@Autowired
	private WebCitysService webCitysService;
	
	@Autowired
	private WebHomeBannerService homeBannerService;

	private static final String[] TRAVELS_TYPE_STRING = new String[] { "精彩游记", "达人攻略", "玩伴召募" };

	private static final String WEB_TRAVELS_REPLY = "web_travels_reply";
	private static final String WEB_TRAVELS = "web_travels";

	private static final Integer PAGE_SIEZ = 10;

	/**
	 * 跳转到达人攻略主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "masterIndex")
	public ModelAndView masterIndex() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData pd = getApiPageData();
			pd.put("examineState", 0);
			List<Map<String, Object>> masterList = webUserService.findMasterUserDynamic();
			pd.put("travelType", 2);// 游记类型
			pd.put("orderType", 1);
			pd.put("startLine", 0);
			pd.put("showLine", 5);
			pd.put("examine_state", 1);
			List<Map<String, Object>> travelsList = WebTravelsService.findStrategyList(pd);
			List<Map<String, Object>> cityList = WebTravelsService.findTravelsCity(pd);
			
			String type = "master_travels_banner";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if(!HString.isEmpty(bannerList)){
				mav.addObject("bannerList", bannerList);
				int [] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
			
			mav.addObject("cityList", cityList);
			mav.addObject("masterList", masterList);
			mav.addObject("travelsList", travelsList);
			mav.setViewName("web/interact/master_raiders");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 获取达人攻略List
	 * 
	 * @return
	 */
	@RequestMapping(value = "masterTravelsList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData masterTravelsList() {
		PageData pd = getApiPageData();
		try {
			String[] param = new String[] { "pageNo" };
			String[] tips = new String[] { "页数" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				subEndComma(pd, "addrIds");
				List<Map<String, Object>> list = WebTravelsService.findWebMasterList(pd);
				pd.put("list", list);
				pd.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
			pd.putStatus(XConst.ERROR);
		}
		return pd;
	}

	/**
	 * 跳转到精彩游记页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "travel", produces = XConst.JSON_PRODUCES)
	public ModelAndView travelsIndex() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData pd = new PageData();
			pd.put("examineState", 0);
			pd.put("travelType", 1);// 游记类型
			pd.put("orderType", 1);
			pd.put("startLine", 0);
			pd.put("showLine", 5);
			pd.put("examine_state", 0);
			List<Map<String, Object>> travelsList = WebTravelsService.findStrategyList(pd);
			List<Map<String, Object>> cityList = WebTravelsService.findTravelsCity(pd);
			
			String type = "travels_banner";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if(!HString.isEmpty(bannerList)){
				mav.addObject("bannerList", bannerList);
				int [] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
			
			
			mav.addObject("travelsList", travelsList);
			mav.addObject("cityList", cityList);
			mav.setViewName("web/interact/travel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 返回游记列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "travelsList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData travelsList() {
		PageData pd = getApiPageData();
		try {
			subEndComma(pd, "addrIds");
			List<Map<String, Object>> list = WebTravelsService.findWebTravelsList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 跳转到玩伴招募页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "player")
	public ModelAndView playerIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("web/interact/frend_enlist");
		return mav;
	}

	/**
	 * 查询玩伴招募List
	 * 
	 * @return
	 */
	@RequestMapping(value = "playerList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData playerEnlist() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("form_table", WEB_TRAVELS);
			pd.put("userId", userId);
			List<Map<String, Object>> list = WebTravelsService.findPlayerList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 跳转到游记详情页面
	 * 
	 * @param tracelsId
	 * @param userId
	 * @param travelType
	 * @return
	 */
	@RequestMapping(value = "detial/{travelType}_{travelsId}")
	public ModelAndView travelsDetial(@PathVariable(value = "travelsId") Long travelsId,
			@PathVariable(value = "travelType") Integer travelType) {
		ModelAndView mav = new ModelAndView();
		try {
			Long userId = getWebLoginUser();
			PageData pd = new PageData();
			pd.put("examineState", 0);
			pd.put("travelsId", travelsId);
			pd.put("userId", userId);
			pd.put("travelType", travelType);
			pd.put("form_table", WEB_TRAVELS_REPLY);// 查询回复列表中，判断是否点赞参数
			Map<String, Object> map = WebTravelsService.findWebTravelsDetial(pd);
			List<Map<String, Object>> itemList = WebTravelsService.findTravelsDetialList(pd);
			travelType = (Integer) map.get("travel_type");
			map.put("travelsTypeString", TRAVELS_TYPE_STRING[travelType - 1]);
			map.put("travelType", travelType);
			mav.addObject("userId", userId);
			mav.addObject("travels", map);
			mav.addObject("itemList", itemList);
			mav.addObject("travelsId", travelsId);
			mav.setViewName("web/interact/frend_enlist_detial");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 返回回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "replyList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData replyList() {
		PageData pd = getSysPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("startLine", (pd.getInt("pageNo") - 1) * PAGE_SIEZ);
			pd.put("showLine", PAGE_SIEZ);
			pd.put("userId", userId);
			pd.put("form_table", WEB_TRAVELS_REPLY);
			List<Map<String, Object>> list = WebTravelsService.findTravelsReplyList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 查询二级回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "secondaryReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData findSecondaryReplyList() {
		PageData pd = getSysPageData();
		try {
			pd.put("startLine", (pd.getInt("pageNo") - 1) * PAGE_SIEZ);
			pd.put("showLine", PAGE_SIEZ);
			List<Map<String, Object>> list = WebTravelsService.findWebSecondaryReplyList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 添加回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "addReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReply() {
		PageData pd = getSysPageData();
		try {
			WebTravelsService.addReply(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 收藏
	 * 
	 * @return
	 */
	@RequestMapping(value = "collection", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData collection() {
		PageData pd = getSysPageData();
		try {
			Long userId = getWebLoginUser();
			if (userId != null) {
				pd.put("userId", userId);
				pd.put("fromTable", WEB_TRAVELS);
				Integer collectionId = webUserCollectionService.checkCollection(pd);
				if (collectionId != null) {
					webUserCollectionService.delete(pd.getLong("fromId"), userId, WEB_TRAVELS);
					pd.putStatus(XConst.EXISTS);
				} else {
					webUserCollectionService.insert(pd.getLong("fromId"), userId, WEB_TRAVELS);
					pd.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 点赞
	 * 
	 * @return
	 */
	@RequestMapping(value = "praise", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praise() {
		PageData pd = getSysPageData();
		try {
			Long userId = getWebLoginUser();
			if (userId != null) {
				pd.put("userId", userId);
				pd.put("replyId", pd.get("travelsId"));
				if ("0".equals(pd.get("priaseType"))) {
					pd.put("form_table", WEB_TRAVELS);
				} else {
					pd.put("form_table", WEB_TRAVELS_REPLY);
				}
				Integer praiseId = webPraiseService.checkPraise(pd);
				if (praiseId != null) {
					pd.putStatus(XConst.EXISTS);
				} else {
					if ("0".equals(pd.get("priaseType"))) {
						webPraiseService.insertTravelsPraise(pd);
					} else {
						webPraiseService.insertTravelsReplyPraise(pd);
					}
					pd.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 删除游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "delete", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete() {
		PageData pd = getApiPageData();
		try {
			Integer checkId = WebTravelsService.checkDeleteTravels(pd);
			if (checkId != null) {
				WebTravelsService.deleteTravels(pd);
				pd.putStatus(XConst.SUCCESS);
			} else {
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 跳转到添加文章页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "written", produces = XConst.JSON_PRODUCES)
	public ModelAndView articleWrittenIndex() {
		ModelAndView mav = new ModelAndView();
		try {
			Long userId=getWebLoginUser();
			PageData user=webUserService.findById(userId);
			Integer isMaster = user.getInt("is_master");
			List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
			for (int i = 0; i < 3; i++) {
				if (i != 1 || isMaster == 0) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", i + 1);
					map.put("text", TRAVELS_TYPE_STRING[i]);
					typeList.add(map);
				}
			}
			List<Map<String, Object>> cityList = webCitysService.findAllProvince();
			mav.addObject("typeList", typeList);
			mav.addObject("cityList", cityList);
			mav.setViewName("web/user/user_article_written");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 保存文章
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitTravels", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitTravels(@RequestParam(value="items[]") String[] items,
			@RequestParam(value="itemsType[]") String[] itemsType) {
		PageData pd = getApiPageData();
		try {
			//subEndComma(pd, "items", "itemsType");
			Long travelsId = pd.getLong("travelsId");
			Long userId = getWebLoginUser();
			pd.put("items", items);
			pd.put("itemsType", itemsType);
			pd.put("userId", userId);
			if (userId != null) {
				if (travelsId == null) {
					WebTravelsService.saveTravels(pd);
					pd.putStatus(XConst.SUCCESS);
				} else {
					WebTravelsService.updateTravels(pd);
					pd.putStatus(XConst.SUCCESS);
				}
			} else {
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 编辑游记
	 * 
	 * @param travelsId
	 * @return
	 */
	@RequestMapping(value = "editTravels{travelType}_{id}", produces = XConst.JSON_PRODUCES)
	public ModelAndView editTravels(@PathVariable(value = "id") Long travelsId,
			@PathVariable(value = "travelType") Integer travelType) {
		ModelAndView mav = new ModelAndView();
		try {
			WebUser webUser = getWebLoginUserObj();
			if (webUser == null) {
				goLogin(mav);
			} else {
				PageData pd = new PageData();
				pd.put("travelsId", travelsId);
				pd.put("userId", webUser.getId());
				pd.put("travelType", travelType);
				pd.put("form_table", WEB_TRAVELS_REPLY);// 查询回复列表中，判断是否点赞参数
				Map<String, Object> travels = WebTravelsService.findWebTravelsDetial(pd);
				List<Map<String, Object>> itemList = WebTravelsService.findTravelsDetialList(pd);
				travelType = (Integer) travels.get("travel_type");
				travels.put("travelsTypeString", TRAVELS_TYPE_STRING[travelType-1]);
				travels.put("travelType", travelType);
				mav.addObject("userId", webUser.getId());
				mav.addObject("travels", travels);
				mav.addObject("itemList", JSONObject.toJSONString(itemList));
				mav.addObject("travelsId", travelsId);

				Integer isMaster = webUser.getIsMaster();
				List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
				for (int i = 0; i < 3; i++) {
					if (i != 1 || isMaster == 0) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("id", i + 1);
						map.put("text", TRAVELS_TYPE_STRING[i]);
						typeList.add(map);
					}
				}
				List<Map<String, Object>> cityList = webCitysService.findAllProvince();
				mav.addObject("typeList", typeList);
				mav.addObject("cityList", cityList);

				mav.setViewName("web/user/user_article_written");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * APP端分享页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value="shareTravels/{id}")
	public ModelAndView shareTravels(@PathVariable("id") Long id){
		ModelAndView mav=new ModelAndView();
		try {
			PageData pd=new PageData();
			pd.put("travelsId", id);
			pd.put("form_table", WEB_TRAVELS_REPLY);// 查询回复列表中，判断是否点赞参数
			Map<String, Object> map = WebTravelsService.findWebTravelsDetial(pd);
			List<Map<String, Object>> itemList = WebTravelsService.findTravelsDetialList(pd);
			Integer travelType = (Integer) map.get("travel_type");
			map.put("travelsTypeString", TRAVELS_TYPE_STRING[travelType - 1]);
			map.put("travelType", travelType);
			mav.addObject("travels", map);
			mav.addObject("itemList", itemList);
			mav.addObject("travelsId", id);
			mav.setViewName("web/interact/share_travels_detial");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 去除末尾逗号
	 * 
	 * @param pd
	 */
	private void subEndComma(PageData pd, String... str) throws NullPointerException {
		for (int i = 0; i < str.length; i++) {
			String addrIds = pd.getString(str[i]);
			Integer lastIndex = addrIds.lastIndexOf(",");
			if (lastIndex != -1) {
				pd.put(str[i], addrIds.subSequence(0, lastIndex));
			}
		}
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
