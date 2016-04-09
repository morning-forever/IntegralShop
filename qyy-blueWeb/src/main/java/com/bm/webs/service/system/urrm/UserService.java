package com.bm.webs.service.system.urrm;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.dao.DaoSupport;

@Service("userService")
public class UserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public PageData findUserList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("AdminUserMapper.findUserListCount", param);
		param.put("data", dao.findForList("AdminUserMapper.findUserList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 根据登录名获取用户信息
	 * 
	 * @param loginName
	 * @return
	 * @throws Exception
	 */
	public AdminLogin getByLoginName(String loginName) throws Exception {
		return (AdminLogin) dao.findForObject("AdminUserMapper.getByLoginName", loginName);
	}

	/**
	 * 根据用户id获取用户信息
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public PageData getByUserId(Long userId) throws Exception {
		return (PageData) dao.findForObject("AdminUserMapper.getByUserId", userId);
	}

	/**
	 * 返回登录信息
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public PageData findLoginByUserId(Long userId) throws Exception {
		PageData param = new PageData();
		param.put("userId", userId);
		return (PageData) dao.findForObject("AdminUserMapper.findLoginByUserId", param);
	}

	/**
	 * 登录时更新ip
	 * 
	 * @param pageData
	 * @return
	 * @throws Exception
	 */
	public void updateLoginIp(PageData pageData) throws Exception {
		dao.update("AdminUserMapper.updateLoginIp", pageData);
	}

	/**
	 * 查找用户信息
	 * 
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public AdminUser findUser(Long adminId) throws Exception {
		return (AdminUser) dao.findForObject("AdminUserMapper.findUser", adminId);
	}

	/**
	 * 
	 * 更新用户信息
	 * 
	 * @param map
	 * @throws Exception
	 */
	public boolean updateUser(PageData map) throws Exception {
		Integer count = (Integer) dao.update("AdminUserMapper.updateUser", map);
		return count > 0;
	}

	/**
	 * 更新登录信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateLogin(PageData param) throws Exception {
		Integer count = (Integer) dao.update("AdminUserMapper.updateLogin", param);
		return count > 0;
	}

	/**
	 * 保存和更新用户信息，用户管理模块用
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData addUser(PageData param) throws Exception {
		PageData res = new PageData(true);
		Long adminId = param.getLong("adminId");
		String roleKey = param.getString("roleKey");
		String username = param.getString("username");
		String phone = param.getString("phone");
		if (HString.isEmpty(adminId)) {
			
			AdminLogin login = getByLoginName(param.getString("loginId"));
			if(login!=null){
				res.putStatus(XConst.EXISTS);
				return res;
			}
			
			// 1.保存用户
			PageData userParam = new PageData();
			userParam.put("roleKey", roleKey);
			PageData role = (PageData) dao.findForObject("AdminRoleMapper.findRoleByKeyOrId", userParam);
			userParam.put("accountState", role.getInt("roleState"));
			userParam.put("username", username);
			userParam.put("phone", phone);
			dao.save("AdminUserMapper.addUser", userParam);
			// 2.添加登录信息
			PageData loginParam = new PageData();
			loginParam.put("loginId", param.getString("loginId"));
			loginParam.put("loginPwd", EncryptionUtil.md532Encryption("888888"));
			loginParam.put("adminId", userParam.getLong("adminId"));
			dao.save("AdminUserMapper.addLogin", loginParam);
			res.putStatus(XConst.SUCCESS);
		} else {
			PageData userParam = new PageData();
			userParam.put("role_key", roleKey);
			userParam.put("roleKey", roleKey);
			PageData role = (PageData) dao.findForObject("AdminRoleMapper.findRoleByKeyOrId", userParam);
			userParam.put("account_state", role.getInt("roleState"));
			userParam.put("username", username);
			userParam.put("phone", phone);
			userParam.put("userId", adminId);
			dao.update("AdminUserMapper.updateUser", userParam);
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}
	
	
	public PageData updateDelsUser(Long userId) throws Exception{
		PageData res = new PageData(true);
		PageData param = new PageData();
		param.put("id", userId);
		param.put("adminId", userId);
		
		int count =  (int) dao.update("AdminUserMapper.updateDelsUser", param);
		if(count > 0){
			count = (int) dao.update("AdminUserMapper.updateDelsUserLogin", param);
			if(count < 1)
				throw new Exception("删除用户登录信息出错");
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}
	
}
