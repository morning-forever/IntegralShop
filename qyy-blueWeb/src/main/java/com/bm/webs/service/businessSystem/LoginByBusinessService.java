package com.bm.webs.service.businessSystem;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
public class LoginByBusinessService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	
	/**
	 * 
	 * 登陆验证
	 * 
	 * @param loginName
	 * @return
	 * @throws Exception
	 */
	public AdminLogin checkLogin(String loginName) throws Exception{
		return (AdminLogin) dao.findForObject("AdminUserMapper.getByLoginName", loginName);
	}

	/**
	 * 
	 * 查询商户登陆信息
	 * 
	 * @param adminId
	 * @return
	 * @throws Exception 
	 */
	public AdminUser findUser(Long adminId) throws Exception {
		return (AdminUser) dao.findForObject("AdminUserMapper.findUser",adminId);
	}
	
}
