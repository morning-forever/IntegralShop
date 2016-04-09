package com.bm.webs.controller.system.user;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.html.VerifyCodeGenerator;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.bean.system.AdminMenuRight;
import com.bm.webs.bean.system.AdminRight;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.LoginByBusinessService;
import com.bm.webs.service.system.urrm.LoginService;
import com.bm.webs.service.system.urrm.MenuRightService;
import com.bm.webs.service.system.urrm.MenuService;
import com.bm.webs.service.system.urrm.RightService;
import com.bm.webs.service.system.urrm.RoleService;
import com.bm.webs.service.system.urrm.UserService;

/**
 * 后台用户登录界面
 * 
 * @author mike <br>
 *         2015年5月28日
 */
@Controller
@RequestMapping(value = "admin/login")
public class LoginController extends BaseController {

	private final static String TAG = "LoginController";

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "roleService")
	private RoleService roleService;

	@Resource(name = "menuService")
	private MenuService menuService;

	@Resource(name = "menuRightService")
	private MenuRightService menuRightService;

	@Resource(name = "rightService")
	private RightService rightService;

	@Autowired
	private LoginByBusinessService loginByBusinessService;

	// @Autowired
	// private MenuService menuService;

	/**
	 * 跳转到用户登录页面
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toLogin" })
	public ModelAndView toLogin() {
		ModelAndView mav = super.getModelAndView();
		mav.setViewName("main/login");
		return mav;
	}

	@RequestMapping(params = { "op=outLogin" })
	public ModelAndView outLogin() {
		SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
		set.setU(null);
		set.setUser(null);
		super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, set);
		ModelAndView mav = super.getModelAndView();
		mav.setViewName("main/login");
		return mav;
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=login" }, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PageData login() {
		super.logBefore(logger, TAG, "login");
		PageData pageData = null;
		try {
			pageData = super.getPageData();
			String data = pageData.getString("DATA");
			String[] userData = data.split(",");
			pageData = new PageData();
			if (!HString.isEmpty(userData) && userData.length == 3) {
				String code = userData[2];
				String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");

				if (!vcode.equals(code)) {
					pageData.put("flag", XConst.V_CODE_ERROR);
				} else {
					String loginName = userData[0];
					String loginPass = userData[1];
					AdminLogin user = userService.getByLoginName(loginName);
					if (user != null) {
						String ecPass = EncryptionUtil.md532Encryption(loginPass);
						if (!ecPass.equals(user.getLoginPwd())) {
							pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
						} else {
							SystemSet sysset = new SystemSet();
							if ("admin".equals(user.getAdminType())) {
								// 获取用户信息与角色
								AdminUser u = userService.findUser(user.getAdminId());
								// 1.1。获取角色
								// AdminRole role = roleService.getRoleByKey(user.getRoleKey());
								// 2.初始化菜单列表
								// List<SysMenu> allmenuList = menuService.listAllMenu();
								// 2.1获取自己的菜单列表&&获取菜单权限
								List<AdminMenu> meMenuList = getMeAllMenu(u.getMenuKeys());
								// 获取权限
								// Map<String,List<SysRight>> meRightMap = setRitghtForMenu(role.getMenuRightModel(), meMenuList);
								// sysset.setMeRightMap(meRightMap);

								// 3.配置要放入session中的数据

								sysset.setWebappName(ConfigLoad.getStringValue("webapp.name"));
								String basePath = super.getRequest().getScheme() + "://" + super.getRequest().getServerName() + ":" + super.getRequest().getServerPort()
										+ super.getRequest().getContextPath();
								sysset.setBasePath(basePath + "/");

								sysset.setUser(user);

								sysset.setU(u);
								sysset.setMeMenus(meMenuList);

								pageData.clear();// 先清空pageData中的数据
								pageData.put("userId", user.getAdminId());
								pageData.put("loginIp", super.getRemortIP());
								pageData.put("loginTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
								// userService.updateLoginIp(pageData);
								// userService.updateLoginTime(pageData);
								super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
								pageData.clear();// 先清空pageData中的数据

								pageData.put("flag", XConst.SUCCESS);
							} else if ("merch".equals(user.getAdminType())) {
								AdminUser adminUser = loginByBusinessService.findUser(user.getAdminId());

								List<AdminMenu> menuList = getBusinessMeAllMenu(adminUser.getMenuKeys());

								sysset.setWebappName(ConfigLoad.getStringValue("webapp.merchName"));
								String basePath = super.getRequest().getScheme() + "://" + super.getRequest().getServerName() + ":" + super.getRequest().getServerPort()
										+ super.getRequest().getContextPath();
								sysset.setBasePath(basePath + "/");

								sysset.setU(adminUser);
								sysset.setUser(user);
								sysset.setMeMenus(menuList);

								pageData.clear();// 先清空pageData中的数据
								pageData.put("userId", user.getAdminId());
								pageData.put("loginIp", super.getRemortIP());
								pageData.put("loginTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

								super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
								pageData.clear();

								pageData.put("flag", XConst.SUCCESS);
							} else {
								pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
							}
						}
					} else {
						pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
					}
				}
			} else {
				pageData.put("flag", XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return pageData;
	}

	/**
	 * 根据我持有菜单keys来获取我的菜单列表 商户菜单
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
			// return menuService.listAllMenu();
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
	 * 返回子菜单 商户菜单
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

	/**
	 * 根据我持有菜单keys来获取我的菜单列表
	 * 
	 * @param menuKeys
	 * @return
	 * @throws Exception
	 */
	List<AdminMenu> getMeAllMenu(String menuKeys) throws Exception {
		List<AdminMenu> list = null;

		// 如果是所有权限的持有者
		if (menuKeys.equals("ALL")) {
			return menuService.listAllMenu();
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
		list = menuService.getListMenuByKeys(parentKeys);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setSubMenu(getMeSubMenu(list.get(i).getMenuKey(), subKeys));
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
	List<AdminMenu> getMeSubMenu(String parentKey, List<String> subKeys) throws Exception {
		List<String> meSubKey = new ArrayList<String>();
		String checkKey = parentKey + "_";
		for (String key : subKeys) {
			if (key.indexOf(checkKey) == 0) {
				meSubKey.add(key);
			}
		}
		return menuService.getListMenuByKeys(meSubKey);
	}

	/**
	 * 给菜单设置权限
	 * 
	 * @param rightModel
	 * @param meMenuList
	 * @return
	 * @throws Exception
	 */
	Map<String, List<AdminRight>> setRitghtForMenu(String rightModel, List<AdminMenu> meMenuList) throws Exception {
		PageData pageData = new PageData();
		List<AdminRight> rightList = null;
		Map<String, List<AdminRight>> rightMap = new HashMap<String, List<AdminRight>>();
		for (int i = 0; i < meMenuList.size(); i++) {
			pageData.put("menuKey", meMenuList.get(i).getMenuKey());
			pageData.put("model", rightModel);
			List<AdminMenuRight> menuRightList = menuRightService.getListByKeyOrModel(pageData);
			if (!HString.isEmpty(menuRightList) && menuRightList.size() > 0) {
				rightList = getRightList(menuRightList.get(0));
				meMenuList.get(i).setRights(rightList);
				rightMap.put(meMenuList.get(i).getMenuKey(), rightList);
			}
			List<AdminMenu> subMenuList = meMenuList.get(i).getSubMenu();
			for (int j = 0; j < subMenuList.size(); j++) {
				pageData.put("menuKey", subMenuList.get(j).getMenuKey());
				pageData.put("model", rightModel);
				menuRightList = menuRightService.getListByKeyOrModel(pageData);
				if (!HString.isEmpty(menuRightList) && menuRightList.size() > 0) {
					rightList = getRightList(menuRightList.get(0));
					subMenuList.get(j).setRights(rightList);
					rightMap.put(subMenuList.get(j).getMenuKey(), rightList);
				}
			}
			meMenuList.get(i).setSubMenu(subMenuList);
		}
		return rightMap;
	}

	/**
	 * 获取所有权限的
	 * 
	 * @param menuRight
	 * @return
	 * @throws Exception
	 */
	List<AdminRight> getRightList(AdminMenuRight menuRight) throws Exception {
		List<String> rightKeys = Arrays.asList(menuRight.getRightKeys().split(","));
		return rightService.getListRightKeys(rightKeys);
	}

	/**
	 * 获取验证码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "op=vcode")
	public void vcode(HttpServletResponse response) {
		super.logBefore(logger, TAG, "vcode");
		BufferedImage bi = null;
		try {
			long time = System.currentTimeMillis();
			String code = EncryptionUtil.md532Encryption(String.valueOf(time));
			VerifyCodeGenerator vcg = VerifyCodeGenerator.getInstance();
			code = code.substring(3, 7);
			bi = vcg.getImage(code);
			super.getRequest().getSession().setAttribute("VCODE", code);
			// 将ContentType设为"image/jpeg"，让浏览器识别图像格式。
			response.setContentType("image/jpeg");
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 2000);
			// 获得Servlet输出流
			ServletOutputStream outStream = response.getOutputStream();
			Graphics g = bi.getGraphics();
			g.dispose();
			ImageIO.write(bi, "JPEG", outStream);
			super.logAfter(logger);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
