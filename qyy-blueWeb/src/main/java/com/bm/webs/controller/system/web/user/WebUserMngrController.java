package com.bm.webs.controller.system.web.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 
 * 前端会员信息管理
 * 
 * 
 * @author mike <br>
 *         2015年8月14日
 */
@Controller
@RequestMapping(value = "admin/webusermngr")
public class WebUserMngrController extends BaseController {

	@Autowired
	private WebUserService webUserService;

	/**
	 * 跳转到数据中心
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/user/main");
		return mav;
	}

	/**
	 * 返回list列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			PageData rePd = super.getSysPageData();
			String search = rePd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				rePd.put("phone", HString.isEmpty(json.get("phone")) ? "" : json.get("phone"));
				rePd.put("nickname", HString.isEmpty(json.get("nickname")) ? "" : json.get("nickname"));
				rePd.put("email", HString.isEmpty(json.get("email")) ? "" : json.get("email"));
				if (!HString.isEmpty(json.get("isBan")))
					rePd.put("isBan", json.get("isBan"));
			}
			pd = webUserService.getList(rePd);
			pd.put("draw", rePd.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 重置密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "resetPwd")
	@ResponseBody
	public PageData resetPwd() {
		PageData data = super.getPageData();
		try {
			boolean isUpdate = webUserService.resetPwd(data);
			data.clear();
			if (isUpdate) {
				data.putStatus(XConst.SUCCESS);
			} else {
				data.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 启用禁用用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "banUser")
	@ResponseBody
	public PageData banUser(HttpServletRequest request) {
		PageData data = super.getPageData();
		try {
			boolean isUpdate = webUserService.updateBanUser(data);
			if (isUpdate) {
				data.putStatus(XConst.SUCCESS);
			} else {
				data.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 删除用户，非物理删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "delUser")
	@ResponseBody
	public PageData delUser() {
		PageData data = super.getPageData();
		try {
			boolean isDel = webUserService.delUser(Long.valueOf(data.getString("id")));
			if (isDel)
				data.putStatus(XConst.SUCCESS);
			else
				data.putStatus(XConst.FAIL);
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 用户信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "infoUser")
	public ModelAndView infoUser() {
		PageData data = super.getPageData();
		ModelAndView mav = new ModelAndView("system/web/user/detail");
		try {
			PageData user = webUserService.getDetail(Long.valueOf(data.getString("id")));
			if (!HString.isEmpty(user))
				mav.addObject("obj", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	
	
	
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
