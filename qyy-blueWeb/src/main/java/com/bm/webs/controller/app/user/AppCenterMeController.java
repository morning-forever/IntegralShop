package com.bm.webs.controller.app.user;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.file.FileUpload;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebScoreService;
import com.bm.webs.service.web.WebSearchService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 个人中心我的
 * 
 * @author mike <br>
 *         2015年10月19日
 */
@Controller(value = "appCenterMeController")
@RequestMapping(value = "app/center/me")
public class AppCenterMeController extends BaseController {

	@Autowired
	private WebUserService userService;

	@Autowired
	private WebScoreService scoreService;

	@Autowired
	private WebSearchService searchService;

	/**
	 * 保存昵称
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveNickname")
	@ResponseBody
	public PageData saveNikename() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("saveNickname", param, new String[] { "userId", "nickname" }, new String[] { "用户id", "昵称" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = userService.updateAppUser(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存性别
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveSex")
	@ResponseBody
	public PageData saveSex() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("saveSex", param, new String[] { "userId", "sex" }, new String[] { "用户id", "性别" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = userService.updateAppUser(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 
	 * 保存生日
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveBirthday")
	@ResponseBody
	public PageData saveBirthday() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("saveBirthday", param, new String[] { "userId", "birthday" }, new String[] { "用户id", "生日" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = userService.updateAppUser(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 账户明细
	 * 
	 * @return
	 */
	@RequestMapping(value = "account")
	@ResponseBody
	public PageData account() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("account", param, new String[] { "userId" }, new String[] { "用户id" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = scoreService.findScoreList(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 桃子规则
	 * 
	 * @return
	 */
	@RequestMapping(value = "scoreRule")
	@ResponseBody
	public PageData scoreRule() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = scoreService.findDetail();
			if (!HString.isEmpty(data)) {
				res.putData("ruleDetail", data);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 上传头像并保存
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "uploadHead")
	@ResponseBody
	public PageData uploadHead(@RequestParam("headImg") MultipartFile file, HttpServletRequest request) {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = new PageData(request);
			boolean isSuccess = checkParam("uploadHead", param, new String[] { "userId" }, new String[] { "用户id" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String oldName = file.getOriginalFilename();
				String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
				String realPath = request.getSession().getServletContext().getRealPath("") + "/uploadFiles/uploadImgs/head";
				String fileName = sdf.format(new Date()) + suffix;
				FileUpload.copyFile(file.getInputStream(), realPath, fileName);

				param.put("headImg", "uploadFiles/uploadImgs/head/" + fileName);
				res = userService.updateAppUser(param);

				if (res.getBoolean("flag")) {
					res.putData("headImg", "uploadFiles/uploadImgs/head/" + fileName);
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 
	 * 个人简介
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveSummary")
	@ResponseBody
	public PageData saveSummary() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("saveSummary", param, new String[] { "userId", "summary" }, new String[] { "用户id", "个人简介" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = userService.updateAppUser(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "search")
	@ResponseBody
	public PageData search() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			boolean isSuccess = checkParam("search", param, new String[] { "fromType" }, new String[] { "搜索类型" });
			if (isSuccess) {
				if ("home".equals(param.getString("fromType"))) {
					res = searchService.searchOfHome(param);
				} else {
					res = searchService.searchByFromType(param);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "info")
	@ResponseBody
	public PageData info() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);

		try {
			PageData param = this.getApiPageData();
			boolean isSuccess = checkParam("info", param, new String[] { "userId" }, new String[] { "用户id" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				PageData user = userService.getDetail(param.getLong("userId"));
				if (!HString.isEmpty(user)) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
					res.putData("info", user);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
