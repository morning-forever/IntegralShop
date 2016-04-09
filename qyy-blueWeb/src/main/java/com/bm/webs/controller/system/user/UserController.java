package com.bm.webs.controller.system.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.Page;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.urrm.LoginService;
import com.bm.webs.service.system.urrm.MenuService;
import com.bm.webs.service.system.urrm.RoleService;
import com.bm.webs.service.system.urrm.UserService;

@Controller
@RequestMapping(value = "admin/user")
public class UserController extends BaseController {

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "loginService")
	private LoginService loginService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	/**
	 * 用户首页
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("main")
	public ModelAndView main(Page page) {
		ModelAndView mav = super.getModelAndView();
		try {
			mav.setViewName("system/user/main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 角色list数据
	 * 
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("loginId", HString.isEmpty(json.get("loginId")) ? "" : json.get("loginId"));
				String roleState = HString.isEmpty(json.getString("roleState")) ? "" : json.getString("roleState");
				if (!"0".equals(roleState))
					param.put("roleState", roleState);
			}
			res = userService.findUserList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存用户（用户管理）
	 * 
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			res = userService.addUser(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 重置密码
	 * 
	 * @return
	 */
	@RequestMapping("respwd")
	@ResponseBody
	public PageData respwd() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			param.put("password", EncryptionUtil.md532Encryption("888888"));
			boolean isUp = userService.updateLogin(param);
			if (isUp) {
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 更改状态
	 * 
	 * @return
	 */
	@RequestMapping("opuser")
	@ResponseBody
	public PageData opuser() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			boolean isUp = roleService.updateRoleState(param.getString("roleKey"));
			if (isUp) {
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存用户(个人信息设置)
	 * 
	 * @return
	 */
	@RequestMapping("saveUser")
	@ResponseBody
	public PageData saveUser() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();

			// 当用户存在时，只更新用户信息（不更新login_id）
			Long userId = param.getLong("userId");
			if (!HString.isEmpty(userId)) {
				String password = param.getString("password");
				if (!password.equals(param.getString("rpassword"))) {
					res.putStatus(XConst.LOGIN_USER_PASS_ERR);// 密码错误
					return res;
				}
				param.put("password", EncryptionUtil.md532Encryption(password));
				userService.updateUser(param);
				userService.updateLogin(param);
				res.putStatus(XConst.SUCCESS);
			} else {
				AdminLogin user = userService.getByLoginName(param.getString("loginId"));
				if (user != null) {
					res.putStatus(XConst.EXISTS);// 用户已存在
					return res;
				}
			}

		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 用户修改自己信息编辑跳转
	 * 
	 * @return
	 */
	@RequestMapping("toEdit")
	public ModelAndView toEdit() {
		ModelAndView mav = super.getModelAndView();
		try {
			PageData param = super.getPageData();
			Long userId = param.getLong("userId");
			String op = param.getString("op");
			if (!HString.isEmpty(op) && HString.isEmpty(userId)) {
				mav.setViewName("404");
				return mav;
			}
			PageData user = userService.getByUserId(userId);
			PageData loginUser = userService.findLoginByUserId(userId);
			List<PageData> roleList = roleService.getListAllSRole();
			mav.addObject("user", user);
			mav.addObject("loginUser", loginUser);
			mav.addObject("roleList", roleList);
			mav.addObject("op", op);
			mav.setViewName("system/user/detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("toEdit1")
	public ModelAndView toEdit1() {
		ModelAndView mav = super.getModelAndView();
		try {
			PageData param = super.getPageData();
			Long userId = param.getLong("userId");
			String op = param.getString("op");
			PageData user = userService.getByUserId(userId);
			PageData loginUser = userService.findLoginByUserId(userId);
			List<PageData> roleList = roleService.getListAllSRole();
			mav.addObject("user", user);
			mav.addObject("loginUser", loginUser);
			mav.addObject("roleList", roleList);
			mav.addObject("op", op);
			mav.setViewName("system/user/detail_1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 不做物理删除
	 * 
	 * @return
	 */
	@RequestMapping("delsUser")
	@ResponseBody
	public PageData delsUser() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			Long userId = param.getLong("userId");
			res = userService.updateDelsUser(userId);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 角色首页
	 * 
	 * @return
	 */
	@RequestMapping("roleMain")
	public ModelAndView roleMain() {
		ModelAndView mav = super.getModelAndView();
		mav.setViewName("system/user/role_main");
		return mav;
	}

	/**
	 * 角色list数据
	 * 
	 * @return
	 */
	@RequestMapping("roleList")
	@ResponseBody
	public PageData roleList() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("roleName", HString.isEmpty(json.get("roleName")) ? "" : json.get("roleName"));
				param.put("roleState", HString.isEmpty(json.getString("roleState")) ? "" : json.getString("roleState"));
			}
			res = roleService.findRoleList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 角色详情
	 * 
	 * @return
	 */
	@RequestMapping("roleDetail")
	public ModelAndView roleDetail() {
		ModelAndView mav = super.getModelAndView();

		try {
			PageData param = super.getSysPageData();
			// 1.获取角色信息
			Long roleId = param.getLong("roleId");
			if (!HString.isEmpty(roleId)) {
				PageData role = roleService.findRoleByKeyOrId(null, roleId);
				if (HString.isEmpty(role)) {
					mav.setViewName("404");
					return mav;
				}
				mav.addObject("role", role);
				String[] meMenuKeys = role.getString("menuKeys").split(",");
				mav.addObject("meMenuKeys", meMenuKeys);
			}
			// 2.获取所有菜单信息
			List<AdminMenu> allMenuList = menuService.listAllMenu();
			mav.addObject("allMenuList", allMenuList);
			mav.setViewName("system/user/role_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 保存角色信息
	 * 
	 * @return
	 */
	@RequestMapping("saveRole")
	@ResponseBody
	public PageData saveRole() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			res = roleService.saveRole(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 删除角色信息
	 * 
	 * @return
	 */
	@RequestMapping("delsRole")
	@ResponseBody
	public PageData delsRole() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			res = roleService.delsRole(param.getLong("roleId"));
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return "0000_0001";
	}

}
