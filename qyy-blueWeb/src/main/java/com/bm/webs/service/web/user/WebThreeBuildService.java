package com.bm.webs.service.web.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 第三方登录绑定
 * 
 * @author mike <br>
 *         2015年10月27日
 */
@Service
@Transactional
public class WebThreeBuildService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 添加绑定信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData insertUserBuild(PageData param) throws Exception {
		boolean createUserFlag=false;
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		// 1.检查绑定信息
		PageData buildInfo = (PageData) dao.findForObject("WebThreeBuildMapper.checkBuild", param);
		if (!HString.isEmpty(buildInfo)) {
			long userId = buildInfo.getLong("userId") == null ? 0 : buildInfo.getLong("userId");
			// 2.如果有绑定信息，就返回绑定用户信息
			param.put("userId", userId);
			PageData loginUser = (PageData) dao.findForObject("WebThreeBuildMapper.treeLogin", param);

			if (!HString.isEmpty(loginUser)) {
				if ("0".equals(loginUser.getString("isBan"))) {
					res.putFlag(false);
					res.putMessage(XConst.LOGIN_IS_BAN);
					return res;
				}
				res.put("loginUser", loginUser);
				res.putData("user", loginUser);
				res.putFlag(true);
				res.putStatus("three_build");
				res.putMessage("three_build");
			} else {
				createUserFlag=true;
				res.putFlag(false);
				res.putStatus("three_build_no_user");
				res.putMessage("three_build_no_user");
			}
		} else {
			// 3.如果没有绑定，就添加第三方登录信息
			int count = (int) dao.save("WebThreeBuildMapper.insertUserBuild", param);
			createUserFlag=true;
			if (count > 0) {
				res.putFlag(true);
				res.putStatus(XConst.SUCCESS);
				res.putMessage(XConst.SUCCESS);
			}
		}
		Object mobileFlag=param.get("mobileFlag");
		if(createUserFlag&&mobileFlag!=null){
			int count=(int) dao.save("WebThreeBuildMapper.insertNullUser",param);
			Long userId=param.getLong("nullUserId");
			param.put("userId", userId);
			param.put("loginPwd", EncryptionUtil.md532Encryption("123456"));//初始密码123456
			dao.save("WebThreeBuildMapper.bindThreeNullUser",param);
			if (count > 0) {
				dao.save("WebUserLoginMapper.insertLogin", param);
				dao.update("WebUserMapper.buildUser", param);
				//添加注册积分
				param.put("opers", "OBTAIN_REG");
				addScoreObtain(param);
				
				//消息
				PageData rule = (PageData) dao.findForObject("WebScoreRuleMapper.findScoreRuleByKey", param);
				
				Integer ruleScore = rule.getInt("ruleScore");
				if(HString.isEmpty(ruleScore))
					ruleScore = 0;
				updateScore(param.getLong("userId"), ruleScore);
				PageData mparam = new PageData();
				mparam.put("message", "注册成功！恭喜您获得"+ruleScore+"个桃子");
				mparam.put("msgType", "notice");
				mparam.put("msgSource", "score");
				mparam.put("fromUserId", 0);
				mparam.put("toUserId", param.getLong("userId"));
				mparam.put("biuldId", 0);
				mparam.put("biuldTitle", "注册成功！恭喜您获得"+ruleScore+"个桃子");
				mparam.put("biuldImg", "");
				addMessage(mparam);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
			res.put("userId", userId);
		}
		return res;
	}
	
	public boolean addScoreObtain(PageData param) throws Exception {
		Integer score = (Integer) dao.findForObject("WebUserMapper.findScore", param);
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
			count = (int) dao.update("WebUserMapper.updateScore", uup);
			return count > 0;
		}
		return false;
	}
	
	public boolean addMessage(PageData param) throws Exception {
		int count = (int) dao.save("WebMessageMapper.addMessage", param);
		return count > 0;
	}
	
	public boolean updateScore(Long id, int updateScore) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("updateScore", updateScore);
		int count = (int) dao.update("WebUserMapper.updateScore", param);
		return count > 0;
	}

}
