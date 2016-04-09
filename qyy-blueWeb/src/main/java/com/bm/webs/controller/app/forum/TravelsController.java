package com.bm.webs.controller.app.forum;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebUserCollectionService;
import com.bm.webs.service.web.WebPraiseService;
import com.bm.webs.service.web.forum.WebTravelsService;

/**
 * APP端游记管理Controller
 * 
 * @author Hham
 *
 */
@Controller(value = "appTravelsController")
@RequestMapping(value = "app/travels")
public class TravelsController extends BaseController {

	@Autowired
	private WebTravelsService webTravelsService;

	@Autowired
	private WebPraiseService webPraiseService;

	@Autowired
	private WebUserCollectionService webUserCollectionService;

	private static final String TRAVELS_TABLE = "web_travels";
	private static final String TRAVELS_REPLY_TABLE = "web_travels_reply";

	private static final String[] recommend_type={"bbs","travels","master_travels"};
	
	/**
	 * 
	 * 主页接口 返回文章最多的达人列表，返回推荐游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "master", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData masterStrategyIndex() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			pd.put("travelType", recommend_type[2]);
			List<Map<String, Object>> masterList = webTravelsService.findIndexMasterList(pd);
			List<Map<String, Object>> strategyList = webTravelsService.findRecommendStrategyList(pd);
			result.putData("indexMasterList", masterList);
			result.putData("indexStrategyList", strategyList);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 精彩游记推荐
	 * 
	 * @return
	 */
	@RequestMapping(value = "travels", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData travelsIndex() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			pd.put("travelType", recommend_type[1]);
			List<Map<String, Object>> strategyList = webTravelsService.findRecommendStrategyList(pd);
			result.putData("indexTravelsList", strategyList);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 玩伴招募
	 * 
	 * @return
	 */
	@RequestMapping(value = "player", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData recruitPlayer() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId" };
			String[] tips = new String[] { "用户ID" };
			boolean checkParam = checkParam("player", pd, param, tips);
			if (checkParam) {
				String orderType = pd.getString("orderType");
				String personal = pd.getString("personal");
				if (ValidateHelper.isNullOrEmpty(orderType)) {
					pd.put("orderType", 1);
				}else{
					pd.put("orderType", Integer.valueOf(orderType)+1);
				}
				if (ValidateHelper.isNullOrEmpty(personal)) {
					pd.put("personal", 1);
				}
				pd.put("form_table", TRAVELS_TABLE);
				List<Map<String, Object>> strategyList = webTravelsService.findPlayerList(pd);
				result.putData("indexTravelsList", strategyList);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 达人攻略list
	 * 
	 * @return
	 */
	@RequestMapping(value = "travelList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData masterList() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String orderType = pd.getString("orderType");
			String personal = pd.getString("personal");
			
			if (ValidateHelper.isNullOrEmpty(orderType)) {
				pd.put("orderType", 0);
			}
			if (ValidateHelper.isNullOrEmpty(personal)||"1".equals(personal)) {
				pd.put("personal", 1);
				pd.put("examine_state", 1);
			}
			List<Map<String, Object>> list = webTravelsService.findStrategyList(pd);
			result.putData("masterList", list);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 添加游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "addTravels", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addTravels() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = getApiPageData();
			String[] param = new String[] { "userId", "title", "travelType", "atAddr", "concludingRemark",
					"items", "itemsType", "coverImg" };
			String[] tips = new String[] { "用户ID", "标题", "游记类型", "所在城市", "结束语", "子节点内容", "子节点类型", "封面图片" };
			Object[] items=JSONObject.parseArray(pd.getString("items")).toArray();
			Object[] itemsType=JSONObject.parseArray(pd.getString("itemsType")).toArray();
			boolean checkParam = checkParam("addTravels", pd, param, tips);
			pd.put("items", items);
			pd.put("itemsType", itemsType);
			if (checkParam) {
				webTravelsService.saveTravels(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查询游记详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "detial", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData travelsDetial() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "travelsId" };
			String[] tips = new String[] { "用户ID", "游记ID" };
			boolean checkParam = checkParam("travelsDetial", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", TRAVELS_TABLE);
				Map<String, Object> map = webTravelsService.findTravelsDetial(pd);
				if(map!=null){
					List<Map<String, Object>> list = webTravelsService.findTravelsDetialList(pd);
					Map<String, Object> detial = new HashMap<String, Object>();
					detial.put("travelsDetial", map);
					detial.put("travelsDetialItemList", list);
					result.putData("detial", detial);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				}else{
					result.putFlag(false);
					result.putMessage(XConst.NO_EXISTS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 点赞游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "praise", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseTravels() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "travelsId" };
			String[] tips = new String[] { "用户ID", "游记ID" };
			boolean checkParam = checkParam("praiseTravels", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", TRAVELS_TABLE);
				// 修改参数名,之前默认评论点赞用的都是为replyId,,所以这里改一下参数
				pd.put("replyId", pd.get("travelsId"));
				Integer id = webPraiseService.findPraise(pd);
				if (id == null) {
					webPraiseService.insertTravelsPraise(pd);
					pd.remove("replyId");
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putMessage("你已点过赞");
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 删除游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "delete", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteTravels() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "travelsId" };
			String[] tips = new String[] { "用户ID", "游记ID" };
			boolean checkParam = checkParam("deleteTravels", pd, param, tips);
			if (checkParam) {
				Integer id = webTravelsService.checkDeleteTravels(pd);
				if (id == null) {
					result.putMessage("不能删除不是自己的提问");
				} else {
					webTravelsService.deleteTravels(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 更新游记
	 * 
	 * @return
	 */
	@RequestMapping(value = "update", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData updateTravels() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "travelsId", "title", "atAddr", "concludingRemark",
					"items", "itemsType", "coverImg" };
			String[] tips = new String[] { "用户ID", "游记ID", "标题", "所在城市", "结束语", "游记节点", "游记类型", "封面图片" };
			Object[] items=JSONObject.parseArray(pd.getString("items")).toArray();
			Object[] itemsType=JSONObject.parseArray(pd.getString("itemsType")).toArray();
			boolean checkParam = checkParam("list", pd, param, tips);
			pd.put("items", items);
			pd.put("itemsType", itemsType);
			if (checkParam) {
				webTravelsService.updateTravels(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 游记详情回复
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "reply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData travelsReplyDetial() throws Exception {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "pageNo", "userId", "travelsId" };
			String[] tips = new String[] { "页数", "用户ID", "游记ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", TRAVELS_REPLY_TABLE);
				List<Map<String, Object>> list = webTravelsService.findTravelsReplyList(pd);
				StringBuffer idsBuffer = new StringBuffer();
				for (int i = 0; i < list.size(); i++) {
					if (!"0".equals(list.get(i).get("replyCount").toString())) {
						idsBuffer.append(list.get(i).get("id").toString());
						idsBuffer.append(",");
					}
				}
				List<Map<String, Object>> secondaryList = null;
				int lastIndex = idsBuffer.length() - 1;
				if (lastIndex > 0) {
					pd.put("ids", idsBuffer.substring(0, lastIndex));
					pd.put("groupTop", 2);
					secondaryList = webTravelsService.findTravelSecondartReplyList(pd);
				} else {
					secondaryList = new ArrayList<Map<String, Object>>();
				}
				Map<String, Object> listMap = new HashMap<String, Object>();
				listMap.put("travelsReplyList", list);
				listMap.put("travelsSecondaryReplyList", secondaryList);
				result.putData("listMap", listMap);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查看游记回复二级List
	 * 
	 * @return
	 */
	@RequestMapping(value = "secondaryReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData secondaryReplyList() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "replyId" };
			String[] tips = new String[] { "回复ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				if (ValidateHelper.isNullOrEmpty(pd.getString("pageNo"))) {
					pd.put("startLine", 0);
					pd.put("showLine", XConst.MAX_SECONDARY_NUMBER);
				}
				List<Map<String, Object>> list = webTravelsService.findSecondaryReplyListAll(pd);
				result.putData("secondaryList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 添加回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "addReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReply() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "toUserId", "replyId", "rootId", "content" };
			String[] tips = new String[] { "回复用户ID", "被回复用户ID", "被回复消息ID", "回复根节点ID", "回复内容" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				webTravelsService.addReply(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 点赞游记评论
	 * 
	 * @return
	 */
	@RequestMapping(value = "replyPraise", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseTravelsReply() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "replyId" };
			String[] tips = new String[] { "用户ID", "回复ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", TRAVELS_REPLY_TABLE);
				// 修改参数名,之前默认评论点赞用的都是为replyId,,所以这里改一下参数
				Integer id = webPraiseService.findPraise(pd);
				if (id == null) {
					webPraiseService.insertTravelsReplyPraise(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putMessage("你已点过赞");
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查询收藏文章列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "collection", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getCollectionTravels() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "travelsType" };
			String[] tips = new String[] { "用户ID", "文章类型" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				List<Map<String, Object>> list = webUserCollectionService.findTravelsCollectionList(pd);
				result.putData("list", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取推荐列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "indexRecommend", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData indexRecommend() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "number" };
			String[] tips = new String[] { "序号" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				Integer travelsType=pd.getInt("travelsType");
				if(travelsType==null){
					travelsType=0;
				}
				pd.put("travelsType", recommend_type[travelsType]);
				List<Map<String, Object>> list = webTravelsService.findRecommendList(pd);
				result.putData("list", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			result.putFlag(false);
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
