package com.bm.webs.controller.system.businessSystem;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.LoginByBusinessService;
import com.bm.webs.service.system.urrm.MenuService;

/**
 * 
 * 商家后台登陆页面
 * 暂弃用 
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="businessSystem/login")
public class LoginByMerchController extends BaseController{
	
	@Autowired
	private LoginByBusinessService loginByBusinessService;
	
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 
	 * 跳转到商户登陆页面
	 * 
	 * @return
	 */
	@RequestMapping("login")
	public ModelAndView toLogin(){
		ModelAndView mav=super.getModelAndView();
		mav.setViewName("businessSystem/login");
		return mav;
	}
	
	
	/**
	 * 
	 * 登陆验证
	 * 
	 * @return
	 */
	@RequestMapping(value="loginCheck")
	@ResponseBody 
	public PageData loginCheck(){
		PageData pageData=null;
		SystemSet sysset=new SystemSet();
		try {
			pageData=super.getPageData();
			String loginName=pageData.getString("loginname");
			String password=pageData.getString("password");
			String code=pageData.getString("code");
			if(ValidateHelper.isNullOrEmpty(loginName)||
					ValidateHelper.isNullOrEmpty(password)||
					ValidateHelper.isNullOrEmpty(code)){
				
			}else{
				String vcode=(String) super.getRequest().getSession().getAttribute("VCODE");
				if(vcode.equals(code)){
					AdminLogin admin=loginByBusinessService.checkLogin(loginName);
					if(admin!=null){
						if(EncryptionUtil.md532Encryption(password).equals(admin.getLoginPwd())){
							AdminUser adminUser=loginByBusinessService.findUser(admin.getAdminId());
							
							List<AdminMenu> menuList=getBusinessMeAllMenu(adminUser.getMenuKeys());
							
							sysset.setWebappName(ConfigLoad.getStringValue("webapp.merchName"));
							String basePath = super.getRequest().getScheme() + "://" + super.getRequest().getServerName() + ":" + super.getRequest().getServerPort() + super.getRequest().getContextPath();
							sysset.setBasePath(basePath + "/");
							
							sysset.setU(adminUser);
							sysset.setUser(admin);
							sysset.setMeMenus(menuList);
							
							pageData.clear();// 先清空pageData中的数据
							pageData.put("userId", admin.getAdminId());
							pageData.put("loginIp", super.getRemortIP());
							pageData.put("loginTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
							
							super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
							pageData.clear();
							
							pageData.put("flag", XConst.SUCCESS);
						}else{
							pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
						}
					}else {
						pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
					}
//					System.out.println(admin);
//					pageData.put("flag", XConst.SUCCESS);
				}else{
					pageData.put("flag", XConst.V_CODE_ERROR);
				}
			}
//			System.out.println(loginName);
//			System.out.println(password);
//			System.out.println(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageData;
	}

	/**
	 * 根据我持有菜单keys来获取我的菜单列表
	 * 
	 * @param menuKeys
	 * @return
	 * @throws Exception
	 */
	List<AdminMenu> getBusinessMeAllMenu(String menuKeys) throws Exception {
		List<AdminMenu> list = null;

		// 如果是所有权限的持有者
		if (menuKeys.equals("ALL")) {
			return menuService.merchListAllMenu();
//			return menuService.listAllMenu();
		}

		List<String> parentKeys = new ArrayList<String>();
		List<String> subKeys = new ArrayList<String>();

		String[] keys = menuKeys.split(",");
		for (String key : keys) {
			if (key.length() <= 4)
				parentKeys.add(key);
			else
				subKeys.add(key);
		}
		list = menuService.getmerchListMenuByKeys(parentKeys);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setSubMenu(getBusinessMeSubMenu(list.get(i).getMenuKey(), subKeys));
		}
		return list;
	}

	/**
	 * 返回子菜单
	 * 
	 * @param parentKey
	 * @param subKeys
	 * @return
	 * @throws Exception
	 */
	List<AdminMenu> getBusinessMeSubMenu(String parentKey, List<String> subKeys) throws Exception {
		List<String> meSubKey = new ArrayList<String>();
		String checkKey = parentKey + "_";
		for (String key : subKeys) {
			if (key.indexOf(checkKey) == 0) {
				meSubKey.add(key);
			}
		}
		return menuService.getmerchListMenuByKeys(meSubKey);
	}
	
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
