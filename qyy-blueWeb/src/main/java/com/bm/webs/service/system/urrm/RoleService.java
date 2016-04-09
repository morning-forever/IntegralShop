package com.bm.webs.service.system.urrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service
@Transactional
public class RoleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 根据key或者id来查询一个role信息
	 * 
	 * @param roleKey
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public PageData findRoleByKeyOrId(String roleKey, Long roleId) throws Exception {
		PageData param = new PageData();
		param.put("roleKey", roleKey);
		param.put("roleId", roleId);
		return (PageData) dao.findForObject("AdminRoleMapper.findRoleByKeyOrId", param);
	}

	/**
	 * 返回父的角色
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getParentRoleList() throws Exception {
		return (List<PageData>) dao.findForList("AdminRoleMapper.findRoleListByKey", null);
	}

	/**
	 * 返回子的角色
	 * 
	 * @param roleKey
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getSubRoleList(String roleKey) throws Exception {
		PageData param = new PageData();
		param.put("parentKey", roleKey);
		return (List<PageData>) dao.findForList("AdminRoleMapper.findRoleListByKey", param);
	}

	/**
	 * 返回所有的role
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListAllRole() throws Exception {
		return (List<PageData>) dao.findForList("AdminRoleMapper.findRoleAllList", null);
	}

	/**
	 * 返回所有的role
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListAllSRole() throws Exception {
		return (List<PageData>) dao.findForList("AdminRoleMapper.findSRoleAllList", null);
	}

	/**
	 * 后台进行维护的列表
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findRoleList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("AdminRoleMapper.findRoleListCount", param);
		param.put("data", dao.findForList("AdminRoleMapper.findRoleList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 更新保存角色信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData saveRole(PageData param) throws Exception {
		PageData res = new PageData(true);
		// 1.判断是否有id
		Long roleId = param.getLong("roleId");
		int roleState = param.getInt("roleState");
		String parentKey = param.getString("parentKey");
		if (!HString.isEmpty(roleId)) {
			// 更改用户登录
			List<PageData> userIdList = (List<PageData>) dao.findForList("AdminUserMapper.findUserListByRoleKey", param);
			if (!HString.isEmpty(userIdList)) {
				PageData userParam = new PageData();
				for (PageData userId : userIdList) {
					userParam.put("userId", userId.getLong("id"));
					if (roleState == 0) {// 设置有效
						userParam.put("account_state", 0);
					} else {// 设置无效
						userParam.put("account_state", 1);
					}
					dao.update("AdminUserMapper.updateUser", userParam);
				}
			}
			Integer count = (Integer) dao.update("AdminRoleMapper.updateRole", param);
			if (count > 0) {
				res.putStatus(XConst.SUCCESS);
				return res;
			}
		} else {
			// 获取一个新的role key
			List<PageData> slist = getSubRoleList(parentKey);
			PageData last = null;
			if (HString.isEmpty(slist)) {
				last = findRoleByKeyOrId(parentKey, null);
			} else {
				int inx = slist.size();
				last = slist.get(inx - 1);
			}

			long id = last.getLong("id");
			String newKey = parentKey.concat("_" + id);
			param.put("roleKey", newKey);
			param.put("menuRightModel", last.getString("menuRightModel"));
			Integer count = (Integer) dao.save("AdminRoleMapper.insertRole", param);
			if (count > 0) {
				res.putStatus(XConst.SUCCESS);
				return res;
			}
		}
		return res;
	}

	/**
	 * 删除角色
	 * 
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public PageData delsRole(Long roleId) throws Exception {
		PageData res = new PageData(true);
		PageData param = new PageData();
		param.put("roleId", roleId);
		Integer count = (Integer) dao.findForObject("AdminRoleMapper.checkRoleUsed", param);
		if (count <= 0) {
			dao.delete("AdminRoleMapper.delsRole", param);
			res.putStatus(XConst.SUCCESS);
		} else {
			res.putStatus(XConst.EXISTS);
		}
		return res;
	}

	public boolean updateRoleState(String roleKey) throws Exception {
		PageData param = new PageData();
		param.put("roleKey", roleKey);
		PageData role = findRoleByKeyOrId(roleKey, null);
		int roleState = role.getInt("roleState");
		param.put("roleId", role.getLong("id"));
		// 更改用户登录
		List<PageData> userIdList = (List<PageData>) dao.findForList("AdminUserMapper.findUserListByRoleKey", param);
		if (!HString.isEmpty(userIdList)) {
			PageData userParam = new PageData();
			for (PageData userId : userIdList) {
				userParam.put("userId", userId.getLong("id"));
				if (roleState == 1) {// 设置有效
					userParam.put("account_state", 0);
				} else {// 设置无效
					userParam.put("account_state", 1);
				}
				dao.update("AdminUserMapper.updateUser", userParam);
			}
		}
		int count = (int) dao.update("AdminRoleMapper.updateRoleState", param);
		return count > 0;
	}

}
