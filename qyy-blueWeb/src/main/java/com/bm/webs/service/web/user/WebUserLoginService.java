package com.bm.webs.service.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 前端会员登录管理
 * 
 * @author tangxh <br>
 *         2015年9月17日
 */
@Service
@Transactional
public class WebUserLoginService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 查找登录信息
	 * 
	 * @param loginId
	 * @return
	 * @throws Exception
	 */
	public PageData getDetail(String loginId) throws Exception {
		return (PageData) dao.findForObject("WebUserLoginMapper.getDetail", loginId);
	}

	/**
	 * 登录成功修改数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void loginSuccess(PageData pd) throws Exception {
		dao.update("WebUserLoginMapper.loginSuccess", pd);
	}

	/**
	 * 修改密码
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updatePassword(PageData param) throws Exception {
		int count = (int) dao.update("WebUserLoginMapper.updatePassword", param);
		return count > 0;
	}
	
	/**
	 * 更新手机号
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData updateUserPhone(PageData param) throws Exception{
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		Integer count = (Integer) dao.findForObject("WebUserMapper.checkPhone", param);
		if(count > 0){
			res.putMessage("phone_exist");
		}else{
			count = (Integer) dao.update("WebUserMapper.updateUserPhone", param);
			if(count >0){
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
			}
		}
		return res;
	}

	/**
	 * 验证手机号唯一 
	 * @param string
	 * @return
	 * @throws Exception 
	 */
	public Integer checkPhoneOnly(String phone) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("phone", phone);
		return (Integer) dao.findForObject("WebUserMapper.checkPhone", map);
	}

	/**
	 * 临时用户绑定手机号
	 * @param userId
	 * @param phone
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public boolean updateUserPhone(Long userId, String phone) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("phone", phone);
		Integer phoneCheck=(Integer) dao.findForObject("WebUserMapper.updateCheckPhone", map);
		if(phoneCheck!=0){
			return false;
		}
		Map<String, Object> userMap=(Map<String, Object>) dao.findForObject("WebUserMapper.findUserPhone", map);
		if(!ValidateHelper.isNullOrEmpty(userMap.get("phone"))){
			return false;
		}
		dao.update("WebUserMapper.updateUserPhone", map);
		return true;
	}
	
	
	
	
	
	
}
