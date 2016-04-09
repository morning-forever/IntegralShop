package com.bm.webs.service.web.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebTravelsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 查询首页达人列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findIndexMasterList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findIndexMasterList", pd);
	}

	/**
	 * 查询达人攻略List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findStrategyList(PageData pd) throws Exception {
		Integer total = (Integer) dao.findForObject("WebTravelsMapper.findStrategyCount", pd);
		Integer pageSize = pd.getInt("showLine");
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		pd.put("totalPage", total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findStrategyList", pd);
	}

	/**
	 * 保存游记
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveTravels(PageData pd) throws Exception {
		dao.save("WebTravelsMapper.saveTravels", pd);

		Map<String, Object> itemMap = new HashMap<String, Object>();
		Integer travelsId = pd.getInt("travelsId");
		Object[] itemsArray = pd.getObjectArr("items");
		Object[] itemsTypeArray = pd.getObjectArr("itemsType");
		itemMap.put("travelsId", travelsId);
		for (int i = 0; i < itemsArray.length; i++) {
			itemMap.put("items", itemsArray[i]);
			itemMap.put("itemsType", itemsTypeArray[i]);
			dao.save("WebTravelsMapper.saveTravelsItem", itemMap);
			itemMap.remove("items");
			itemMap.remove("itemsType");
		}
		// if (ValidateHelper.isNullOrEmpty(pd.getString("coverImg"))) {
		pd.put("travelsId", travelsId);
		// 设置封面图片
		dao.update("WebTravelsMapper.setTravelsCover", pd);
		// }
	}

	/**
	 * 查询游记详情
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findTravelsDetial(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.updateBrowse", pd);
		return (Map<String, Object>) dao.findForObject("WebTravelsMapper.findTravelsDetial", pd);
	}

	/**
	 * 查询游记子节点List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findTravelsDetialList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findTravelsDetialList", pd);
	}

	/**
	 * 验证删除
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Integer checkDeleteTravels(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebTravelsMapper.checkDeleteTravels", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void deleteTravels(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.deleteTravels", pd);
	}

	/**
	 * 编辑提交游记
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updateTravels(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.updateTravels", pd);

		Map<String, Object> itemMap = new HashMap<String, Object>();
		Integer travelsId = pd.getInt("travelsId");
		Object[] itemsArray = pd.getObjectArr("items");
		Object[] itemsTypeArray = pd.getObjectArr("itemsType");
		itemMap.put("travelsId", travelsId);
		dao.delete("WebTravelsMapper.deleteTravelsItem", itemMap);
		for (int i = 0; i < itemsArray.length; i++) {
			itemMap.put("items", itemsArray[i]);
			itemMap.put("itemsType", itemsTypeArray[i]);
			dao.save("WebTravelsMapper.saveTravelsItem", itemMap);
			itemMap.remove("items");
			itemMap.remove("itemsType");
		}
		// if (ValidateHelper.isNullOrEmpty(pd.getString("coverImg"))) {
		pd.put("travelsId", travelsId);
		// 设置封面图片
		dao.update("WebTravelsMapper.setTravelsCover", pd);

	}

	/**
	 * 查询游记一级回复List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findTravelsReplyList(PageData pd) throws Exception {
		Float total = (Float) dao.findForObject("WebTravelsMapper.findTravelsReplyCount", pd);
		pd.put("totalPage", Math.ceil(total / (float) pd.getInt("showLine")));
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findTravelsReplyList", pd);
	}

	/**
	 * 查询游记二级回复List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findTravelSecondartReplyList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findTravelSecondartReplyList",
				pd);
	}

	/**
	 * 添加回复
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void addReply(PageData pd) throws Exception {
		dao.save("WebTravelsMapper.addReply", pd);
		if ("0".equals(pd.getString("rootId"))) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", pd.get("userId"));
			PageData user = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("id", pd.get("toUserId"));
			PageData toUser = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("travelsId", pd.get("replyId"));
			Map<String, Object> travels=(HashMap<String, Object>) dao.findForObject("WebTravelsMapper.findTravelsDetial", param);
			PageData notice = new PageData();
			String title=(String) travels.get("title");
			if(title.length()>80){
				title=title.substring(0, 80);
			}
			notice.put("message", user.get("nickname") + "回复了你的文章");
			notice.put("msgType", "comment");
			notice.put("msgSource", "travels");
			notice.put("toUserId", toUser.get("id"));
			notice.put("fromUserId", user.get("id"));
			notice.put("biuldId", pd.get("replyId"));
			notice.put("biuldTitle", title);
			notice.put("biuldImg", travels.get("cover"));
			dao.save("WebMessageMapper.addMessage", notice);
		}
	}

	/**
	 * 查询推荐游记列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findRecommendStrategyList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findRecommendStrategyList", pd);
	}

	/**
	 * 玩伴招募List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findPlayerList(PageData pd) throws Exception {
		double total = (double) dao.findForObject("WebTravelsMapper.findPlayerCount", pd);
		pd.put("totalPage", Math.ceil(total / pd.getDouble("showLine")));
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findPlayerList", pd);
	}

	/**
	 * 查询二级回复List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findSecondaryReplyListAll(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findSecondaryReplyListAll", pd);
	}

	/**
	 * 查询有达人攻略的城市
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findTravelsCity(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findTravelsCity", pd);
	}

	/**
	 * 获取Web端达人攻略List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findWebMasterList(PageData pd) throws Exception {
		Double total = (Double) dao.findForObject("WebTravelsMapper.findWebMasterCount", pd);
		pd.put("totalPage", Math.ceil(total / pd.getDouble("showLine")));
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findWebMasterList", pd);
	}

	/**
	 * 查询Web端游记详情
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findWebTravelsDetial(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.updateBrowse", pd);
		return (Map<String, Object>) dao.findForObject("WebTravelsMapper.findWebTravelsDetial", pd);
	}

	/**
	 * 查询Web端二级回复List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findWebSecondaryReplyList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findWebSecondaryReplyList", pd);
	}

	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findWebTravelsList(PageData pd) throws Exception {
		Float total = (Float) dao.findForObject("WebTravelsMapper.findWebTravelsCount", pd);
		pd.put("totalPage", Math.ceil(total / pd.getDouble("showLine")));
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findWebTravelsList", pd);
	}

	/**
	 * 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findRecommendList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findRecommendList", pd);
	}

	/**
	 * 修改文章审核结果
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updateTravelsExamine(PageData pd) throws Exception {
		dao.save("WebTravelsMapper.insertReason", pd);
		dao.update("WebTravelsMapper.updateTravelsExamine", pd);
		Map<String, Object> map = (Map<String, Object>) dao.findForObject(
				"WebTravelsMapper.findTravelsDetial", pd);
		Integer type = (Integer) map.get("travel_type");
		Long userId = (Long) map.get("userId");
		String state = pd.getString("status");
		String[] arr = { "", "OBTAIN_T_SUC", "OBTAIN_S_SUC" };
		if ("0".equals(state) && type < 3) {
			PageData param = new PageData();
			param.put("opers", arr[type.intValue()]);
			param.put("userId", userId);
			Integer score = (Integer) dao.findForObject("WebUserMapper.findScoreNew", param);
			if (HString.isEmpty(score))
				score = 0;
			PageData rule = (PageData) dao.findForObject("WebScoreRuleMapper.findScoreRuleByKey", param);
			if (HString.isEmpty(rule)) {
				return;
			}
			long ruleId = rule.getLong("id");
			param.put("ruleId", ruleId);
			Integer ruleScore = rule.getInt("ruleScore");
			if (HString.isEmpty(ruleScore))
				ruleScore = 0;
			score += ruleScore;
			param.put("totals", score);
			int count = (int) dao.save("WebScoreRuleMapper.addScoreObtain", param);
			if (count > 0) {
				PageData uup = new PageData();
				uup.put("updateScore", ruleScore);
				uup.put("userId", param.getLong("userId"));
				count = (int) dao.update("WebUserMapper.updateScoreNew", uup);
			}
		}
	}

	/**
	 * 改变置顶状态
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updateTop(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.updateTop", pd);
	}

	public List<Map<String, Object>> findExamineList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebTravelsMapper.findExamineList", pd);
	}

	/**
	 * 删除评论
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void deleteTravelsReply(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.deleteTravelsReply", pd);
	}

}
