package com.bm.webs.service.web.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.http.HttpClientHelper;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 前端会员信息管理
 * 
 * @author mike <br>
 *         2015年8月14日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebUserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 查找详情
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public PageData getDetail(Long userId) throws Exception {
		PageData user = (PageData) dao.findForObject("WebUserMapper.getAllDetail", userId);
		if(!HString.isEmpty(user)){
			PageData lvlParam = new PageData();
			lvlParam.put("userScore", user.getInt("score"));
			Long levelId = (Long) dao.findForObject("WebUserMapper.findUserLevelOfScore", lvlParam);
			if(!HString.isEmpty(levelId) && (levelId != user.getLong("userLevelId"))){
				PageData param = new PageData();
				param.put("userId", user.getLong("id"));
				param.put("levelId", levelId);
				updateUserLevel(param);
			}
		}
		return (PageData) dao.findForObject("WebUserMapper.getAllDetail", userId);
	}

	/**
	 * 查找详情ByPhoneOrEmail
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public PageData getByPhoneOrEmail(String loginname) throws Exception {
		PageData user = (PageData) dao.findForObject("WebUserMapper.getByPhoneOrEmail", loginname);
		if(!HString.isEmpty(user)){
			PageData lvlParam = new PageData();
			lvlParam.put("userScore", user.getInt("score"));
			Long levelId = (Long) dao.findForObject("WebUserMapper.findUserLevelOfScore", lvlParam);
			if(!HString.isEmpty(levelId) && (levelId != user.getLong("userLevelId"))){
				PageData param = new PageData();
				param.put("userId", user.getLong("id"));
				param.put("levelId", levelId);
				updateUserLevel(param);
			}
		}
		return (PageData) dao.findForObject("WebUserMapper.getByPhoneOrEmail", loginname);
	}
	
	/**
	 * 更新等级信息
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateUserLevel(PageData param) throws Exception{
		int count = (int) dao.update("WebUserMapper.updateUserLevel", param);
		return count > 0;
	}
	
	/**
	 * 分页查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getList(PageData pd) throws Exception {
		List<PageData> data = (List<PageData>) dao.findForList("WebUserMapper.pageList", pd);
		Integer total = (Integer) dao.findForObject("WebUserMapper.pageListTotalCount", pd);
		pd.clear();
		pd.put("data", data);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return pd;
	}

	/**
	 * 重置密码
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean resetPwd(PageData param) throws Exception {
		param.put("loginPwd", EncryptionUtil.md532Encryption(XConst.DEFAULT_PWD));
		param.put("userId", param.getString("id"));
		Integer count = (Integer) dao.update("WebUserMapper.resetPwd", param);
		return count > 0;
	}

	/**
	 * 禁用或者启用用户
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateBanUser(PageData param) throws Exception {
		PageData user = getDetail(Long.valueOf(param.getString("id")));
		if (HString.isEmpty(user))
			return false;
		if (0 == Long.valueOf(user.get("isBan").toString()))
			param.put("isBan", 1);
		else
			param.put("isBan", 0);
		Integer count = (Integer) dao.update("WebUserMapper.updateBanUser", param);
		return count > 0;
	}

	/**
	 * 查找分数
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Integer findScore(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (Integer) dao.findForObject("WebUserMapper.findScore", param);
	}

	/**
	 * 更新分数
	 * 
	 * @param id
	 * @param updateScore
	 * @return
	 * @throws Exception
	 */
	public boolean updateScore(Long id, int updateScore) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("updateScore", updateScore);
		int count = (int) dao.update("WebUserMapper.updateScore", param);
		return count > 0;
	}

	/**
	 * 申请达人成功,更新用户数据
	 * 
	 * @param id
	 * @param updateIsMaster
	 * @return
	 * @throws Exception
	 */
	public boolean updateIsMaster(Long id, int updateIsMaster) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("isMaster", updateIsMaster);
		int count = (int) dao.update("WebUserMapper.updateIsMaster", param);
		return count > 0;
	}

	/**
	 * 删除用户，非物理删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delUser(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("state", XConst.DATA_STATE.DEL.toString());
		int count = (int) dao.update("WebUserMapper.delUser", param);
		return count > 0;
	}

	public PageData findById(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebUserMapper.findById", param);
	}

	/**
	 * 查找用户的级别
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findUserLevelById(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebUserMapper.findUserLevelById", param);
	}

	/**
	 * 根据用户名查询用户List 只返回了用户ID和昵称
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findUserListByUserNickName(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebUserMapper.findUserListByUserNickName", pd);
	}

	/**
	 * 查询达人动态
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findMasterUserDynamic() throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebUserMapper.findMasterUserDynamic", new HashMap<String, Object>());
	}

	/**
	 * 从手机端插入用户数据
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData insertWebUserByApp(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		
		if(!checkPhoneOrEmail(param)){
			res.putMessage(XConst.USER_IS_CONTAIN);
			return res;
		}
		
		int count = (int) dao.save("WebUserMapper.insertWebUserByApp", param);
		if (count > 0) {
			dao.save("WebUserLoginMapper.insertLogin", param);
			
			//添加注册积分
			param.put("opers", "OBTAIN_REG");
			addScoreObtain(param);
			//消息
			PageData rule = (PageData) dao.findForObject("WebScoreRuleMapper.findScoreRuleByKey", param);
			
			Integer ruleScore = rule.getInt("ruleScore");
			if(HString.isEmpty(ruleScore))
				ruleScore = 0;
			this.updateScore(param.getLong("userId"), ruleScore);
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
		return res;
	}

	/**
	 * 更新用户信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData updateAppUser(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		int count = (int) dao.update("WebUserMapper.updateAppUser", param);
		if (count > 0) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		}
		return res;
	}

	/**
	 * 当前所在地
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData updateNowAddr(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		int count = (int) dao.findForObject("WebUserMasterMapper.checkIsMaster", param);
		Long ignore = param.getLong("ignore");

		if ((!HString.isEmpty(ignore) && ignore == 1) || (count < 1)) {
			Long areaId = (Long) dao.findForObject("WebUserMasterMapper.finaAreaIdByName", param);
			param.put("nowAddr", areaId);
			dao.update("WebUserMasterMapper.updateUserNowAddr", param);
		} else {
			dao.update("WebUserMasterMapper.updateMasterNowAddr", param);
		}
		if (count != 9) {
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
		}
		return res;
	}

	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData addRegiste(PageData param, HttpServletRequest request) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		if (null != param.getString("thridUid")) {
			String headImg = param.getString("headImg");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String realPath = request.getSession().getServletContext().getRealPath("") + "/uploadFiles/uploadImgs/head";
			String fileName = sdf.format(new Date()) + ".jpg";
			HttpClientHelper.download(headImg, realPath, fileName, null);
			param.put("headImg", "uploadFiles/uploadImgs/head/" + fileName);
		}
		int count = (int) dao.save("WebUserMapper.registe", param);
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
			this.updateScore(param.getLong("userId"), ruleScore);
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
	/**
	 * 邦定用户
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateBuildUser(PageData param) throws Exception {
		return ((int) dao.update("WebUserMapper.buildUser", param)) > 0;
	}

	/**
	 * 邦定用户
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateUnBuildUser(PageData param) throws Exception {
		return ((int) dao.update("WebUserMapper.unbuildUser", param)) > 0;
	}

	/**
	 * 查询活跃用户
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findActiveList(PageData param) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebUserMapper.findActiveList", param);
	}

	/**
	 * 更改用户的电话号码和邮箱
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData updateUserOfPhoneOrEmail(PageData param) throws Exception {
		PageData res = new PageData(true);
		int count = (int) dao.update("WebUserMapper.updateUserOfPhoneOrEmail", param);
		if (count > 0) {
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}
	
	/**
	 * 检查用户或者手机是否存在，除了当前用户的
	 * 
	 * true 是不存在，可以保存
	 * false 是存在，不可以保存
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean checkPhoneOrEmail(PageData param) throws Exception {
		int count = (int) dao.findForObject("checkPhoneOrEmail", param);
		return count < 1;
	}
	
	/**
	 * 查找用户绑定的所有第三方信息
	 * @param param（userId）
	 * @return 
	 * @throws Exception
	 */
	public PageData findUserBuilds(PageData param)throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<PageData> list = (List<PageData>) dao.findForList("WebThreeBuildMapper.findUserBuilds", param);
		if(!HString.isEmpty(list)){
			res.putData("list", list);
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
		}
		return res;
	}
	
	/**
	 * pc端更新用户个人资料
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData updateWebUser(PageData param) throws Exception {
		PageData res = new PageData();
		if(ValidateHelper.isNullOrEmpty(param.get("atAreaId"))){
			param.put("atAreaId", 0);
		}
		int count = (int) dao.update("WebUserMapper.updateWebUser", param);
		if (count > 0) {
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}
}
