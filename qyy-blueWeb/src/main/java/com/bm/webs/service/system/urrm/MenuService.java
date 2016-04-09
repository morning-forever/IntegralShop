package com.bm.webs.service.system.urrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("menuService")
public class MenuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public void deleteMenuById(String id) throws Exception {
		dao.save("AdminMenuMapper.deleteMenuByKey", id);

	}

	public PageData getMenuById(PageData pageDate) throws Exception {
		return (PageData) dao.findForObject("AdminMenuMapper.getMenuByKey", pageDate);

	}

	public List<AdminMenu> listAllParentMenu() throws Exception {
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.listAllParentMenu", null);

	}

	public void saveMenu(AdminMenu menu) throws Exception {
		if (HString.isEmpty(menu.getId())) {
			dao.save("AdminMenuMapper.insertMenu", menu);
		} else {
			dao.save("AdminMenuMapper.insertMenu", menu);
		}
	}

	public List<AdminMenu> listSubMenuByParentId(String parentKey) throws Exception {
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.listSubMenuByParentKey", parentKey);

	}

	public List<AdminMenu> listAllMenu() throws Exception {
		List<AdminMenu> rl = this.listAllParentMenu();
		for (AdminMenu menu : rl) {
			List<AdminMenu> subList = this.listSubMenuByParentId(menu.getMenuKey());
			menu.setSubMenu(subList);
		}
		return rl;
	}

	public List<AdminMenu> listAllSubMenu() throws Exception {
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.listAllSubMenu", null);

	}
	
	public List<AdminMenu> getListMenuByKeys(List<String> menuKeys)throws Exception{
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.getListMenuByKeys", menuKeys);
	}

	/**
	 * 
	 * 查询商户端所有菜单
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<AdminMenu> merchListAllMenu() throws Exception {
		List<AdminMenu> rl = this.merchListAllParentMenu();
		for (AdminMenu menu : rl) {
			List<AdminMenu> subList = this.merchListSubMenuByParentId(menu.getMenuKey());
			menu.setSubMenu(subList);
		}
		return rl;
	}
	
	/**
	 * 
	 * 查询商户端所有父级菜单
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<AdminMenu> merchListAllParentMenu() throws Exception {
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.merchListAllParentMenu", null);

	}
	
	/**
	 * 
	 * 查询商户端所有子菜单
	 * 
	 * @param parentKey
	 * @return
	 * @throws Exception
	 */
	public List<AdminMenu> merchListSubMenuByParentId(String parentKey) throws Exception {
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.merchListSubMenuByParentId", parentKey);

	}
	
	/**
	 * 查询指定的菜单
	 * 
	 * @param menuKeys
	 * @return
	 * @throws Exception
	 */
	public List<AdminMenu> getmerchListMenuByKeys(List<String> menuKeys)throws Exception{
		return (List<AdminMenu>) dao.findForList("AdminMenuMapper.getmerchListMenuByKeys", menuKeys);
	}
	
}
