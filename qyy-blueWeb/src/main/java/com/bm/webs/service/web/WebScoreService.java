package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 积分获取规则
 * 
 * @author mike <br>
 *         2015年8月14日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebScoreService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 获取兑换规则
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findExList() throws Exception {
		return (List<PageData>) dao.findForList("WebScoreRuleMapper.findExList", null);
	}

	/**
	 * 获取过期时间
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTremList() throws Exception {
		return (List<PageData>) dao.findForList("WebScoreRuleMapper.findTremList", null);
	}

	/**
	 * 获取获取规则
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findObtainList() throws Exception {
		return (List<PageData>) dao.findForList("WebScoreRuleMapper.findObtainList", null);
	}

	/**
	 * 根据id或者key来获取规则
	 * 
	 * @param id
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public PageData findRule(Long id, String key) throws Exception {
		PageData pd = new PageData();
		if (!HString.isEmpty(key))
			pd.put("ruleKey", key);
		else
			pd.put("id", id);
		return (PageData) dao.findForObject("WebScoreRuleMapper.findRule", pd);
	}

	/**
	 * 更新兑换规则信息
	 * 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public boolean updateRuleEx(List<PageData> params) throws Exception {
		int i = 0;
		for (PageData pageData : params) {
			dao.update("WebScoreRuleMapper.updateRuleEx", pageData);
			i++;
		}
		return i == params.size();
	}

	/**
	 * 更新有效期规则信息
	 * 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public boolean updateRuleTrem(List<PageData> params) throws Exception {
		int i = 0;
		for (PageData pageData : params) {
			dao.update("WebScoreRuleMapper.updateRuleTrem", pageData);
			i++;
		}
		return i == params.size();
	}

	/**
	 * 更新获取规则信息
	 * 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public boolean updateRuleObtain(List<PageData> params) throws Exception {
		int i = 0;
		for (PageData pageData : params) {
			dao.update("WebScoreRuleMapper.updateRuleObtain", pageData);
			i++;
		}
		return i == params.size();
	}

	/**
	 * 
	 * @param obtainList
	 * @param tremList
	 * @return
	 * @throws Exception
	 */
	public boolean updateObtainAndTrem(List<PageData> obtainList, List<PageData> tremList) throws Exception {
		if (this.updateRuleObtain(obtainList))
			return this.updateRuleTrem(tremList);
		return false;
	}

	/**
	 * 返回一个描述信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData findDetail() throws Exception {
		return (PageData) dao.findForObject("WebScoreRuleMapper.findDetail", null);
	}

	/**
	 * 更新描述信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateDetail(PageData param) throws Exception {
		Integer i = (Integer) dao.update("WebScoreRuleMapper.updateDetail", param);
		return i > 0;
	}

	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findScoreList(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<PageData> list = (List<PageData>) dao.findForList("WebScoreRuleMapper.findScoreList", param);
		if (!HString.isEmpty(list)) {
			res.putData("thisPageSize", list.size());
			res.putData("accountList", list);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		}
		return res;
	}

	public Long findScoreListCount(PageData param) throws Exception {
		return (Long) dao.findForObject("WebScoreRuleMapper.findScoreListCount", param);
	}

	/**
	 * 添加获取积分记录
	 * 
	 * @param param
	 *            (opers==>ruleKey,userId)
	 * @return
	 * @throws Exception
	 */
	public boolean addScoreObtain(PageData param) throws Exception {
		Integer score = (Integer) dao.findForObject("WebUserMapper.findScoreNew", param);
		if (HString.isEmpty(score))
			score = 0;
		PageData rule = (PageData) dao.findForObject("WebScoreRuleMapper.findScoreRuleByKey", param);
		if (HString.isEmpty(rule)) {
			return false;
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
			return count > 0;
		}
		return false;
	}

	/**
	 * 检查是否获取过登录积分了
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean checkIsLoginScore(PageData param) throws Exception {
		int count = (int) dao.findForObject("WebScoreRuleMapper.checkIsLoginScore", param);
		return count < 1;
	}

	/**
	 * 返回最后一条积分记录
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findLastScoreObtain(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebScoreRuleMapper.findLastScoreObtain", param);
	}

}
