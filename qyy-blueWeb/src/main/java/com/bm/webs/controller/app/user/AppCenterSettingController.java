package com.bm.webs.controller.app.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.system.AppVersionService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.center.FeedbackService;
import com.bm.webs.service.web.center.WebHelperService;
import com.bm.webs.service.web.user.WebUserLoginService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 个人中心设置
 * 
 * @author mike <br>
 *         2015年10月19日
 */
@Controller(value = "appCenterSettingController")
@RequestMapping(value = "app/center/setting")
public class AppCenterSettingController extends BaseController {

	@Autowired
	private FeedbackService feedbackService;

	@Autowired
	private WebUserLoginService userLoginService;

	@Autowired
	private WebHelperService helperService;

	@Autowired
	private AppVersionService versionService;

	@Autowired
	private WebCitysService webCitysService;

	@Autowired
	private WebUserService userService;
	
	@Autowired
	private HomeService appHomeService;

	/**
	 * 意见反馈
	 * 
	 * @return
	 */
	@RequestMapping(value = "feedback")
	@ResponseBody
	public PageData feedback() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super
					.checkParam("feedback", data, new String[] { "email", "phone", "username", "message" },
							new String[] { "邮箱", "电话", "姓名", "反馈信息" });
			if (isCheck) {
				boolean isSave = feedbackService.addFeedback(data);
				if (isSave) {
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				} else {
					res.putMessage(XConst.FAIL);
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
	 * 帮助中心
	 * 
	 * @return
	 */
	@RequestMapping(value = "helper")
	@ResponseBody
	public PageData helpCenter() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			res = helperService.helperList(param);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(value = "modPwd")
	@ResponseBody
	public PageData modPwd() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super.checkParam("modPwd", data, new String[] { "userId", "oldToken", "oldPassword",
					"password", "rpassword" }, new String[] { "用户id", "token", "旧密码", "新密码", "确认新密码" });

			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
				return res;
			}

			if (!isTokenSuccess(data))// 检查token
				return data;

			// 确认密码错误
			if (!data.getString("password").equals(data.getString("rpassword"))) {
				res.putMessage("twice_no");
				return res;
			}

			PageData login = userLoginService.getDetail(data.getString("userId"));
			if (!HString.isEmpty(login)) {
				String ecPass = EncryptionUtil.md532Encryption(data.getString("oldPassword"));
				if (!ecPass.equals(login.getString("login_pwd"))) {
					res.putMessage("resouce_err");
				} else {
					data.put("password", EncryptionUtil.md532Encryption(data.getString("password")));
					boolean isSave = userLoginService.updatePassword(data);
					if (isSave) {
						res.putFlag(true);
						res.putMessage(XConst.SUCCESS);
					}
				}
			}

		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}

		return res;
	}

	/**
	 * 绑定手机
	 * 
	 * @return
	 */
	@RequestMapping(value = "bindPhone")
	@ResponseBody
	public PageData binding() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super.checkParam("binding", data,
					new String[] { "userId", "oldToken", "phone", "vcode" }, new String[] { "用户id", "token", "电话",
							"验证码" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				if (!isTokenSuccess(data))// 检查token
					return data;
				String phone=data.getString("phone");
				String code=data.getString("vcode");
				PageData dbCode = appHomeService.getCodeByPhone(phone, "phone");
				if (dbCode!=null&&dbCode.get("vcode").equals(code)) {
					PageData login = userLoginService.getDetail(data.getString("userId"));
					Integer checkNumber = userLoginService.checkPhoneOnly(data.getString("phone"));
					if (checkNumber == 0) {

						if (!HString.isEmpty(login)) {
							res = userLoginService.updateUserPhone(data);
							if (res.getBoolean("flag")) {
								// 更新token
								updateNewToken(data);
								String newToken = data.getString(XConst.API_TOKEN_KEY);
								res.putData(XConst.API_TOKEN_KEY, newToken);
							}
						}
					} else {
						res.putFlag(false);
						res.putMessage(XConst.EXISTS);
					}
				}else{
					res.putFlag(false);
					res.putMessage("code_error");
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取版本信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "version")
	@ResponseBody
	public PageData version() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			boolean isCheck = super.checkParam("version", param, new String[] { "type" }, new String[] { "app类型" });
			if (isCheck) {
				res = versionService.findAppNewVersion(param.getString("type"));
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
	 * 返回管理城市列表 后台可以编辑的城市
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData cityList() {
		PageData result = new PageData();
		result.putFlag(false);
		result.putMessage(XConst.FAIL);
		try {
			List<Map<String, Object>> list = webCitysService.findAllCounty();
			result.putData("cityList", list);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 返回管理城市列表 后台可以编辑的城市
	 * 
	 * @return
	 */
	@RequestMapping(value = "provinceList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData provinceList() {
		PageData result = new PageData();
		result.putFlag(false);
		result.putMessage(XConst.FAIL);
		try {
			List<Map<String, Object>> list = webCitysService.findAllProvince();
			result.putData("provinceList", list);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 返回所有城市列表
	 * 
	 * @return
	 * @author Hham
	 */
	@RequestMapping(value = "AllCityList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getAllCityList() {
		PageData result = new PageData();
		result.putMessage(XConst.FAIL);
		result.putFlag(false);
		try {
			PageData pd = getApiPageData();
			Integer cityId = pd.getInt("cityId");
			if (cityId == null) {
				pd.put("cityId", 0);
			}
			List<Map<String, Object>> list = webCitysService.findAllCity(pd);
			result.putData("allCityList", list);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 更改所在地
	 * 
	 * @return
	 */
	@RequestMapping(value = "nowAddr")
	@ResponseBody
	public PageData updateNowAddr() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super.checkParam("updateNowAddr", data, new String[] { "userId", "oldToken", "nowAddr" },
					new String[] { "用户id", "token", "所在地" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				if (!isTokenSuccess(data))// 检查token
					return data;
				res = userService.updateNowAddr(data);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(data);
					String newToken = data.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "userBuilds")
	@ResponseBody
	public PageData userBuilds() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super.checkParam("userBuilds", data, new String[] { "userId" }, new String[] { "用户id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res = userService.findUserBuilds(data);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
