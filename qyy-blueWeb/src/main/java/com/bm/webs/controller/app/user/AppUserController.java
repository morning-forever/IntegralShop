package com.bm.webs.controller.app.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.date.TimeHelper;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.controller.util.SMSHelper;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.system.AppVersionService;
import com.bm.webs.service.system.UserCountService;
import com.bm.webs.service.web.MessageService;
import com.bm.webs.service.web.WebScoreService;
import com.bm.webs.service.web.WebUserMasterService;
import com.bm.webs.service.web.user.WebThreeBuildService;
import com.bm.webs.service.web.user.WebUserLoginService;
import com.bm.webs.service.web.user.WebUserService;


/**
 * APP登陆模块
 * 
 * @author liuw
 * 
 */
@Controller(value = "appUserController")
@RequestMapping(value = "app/user")
public class AppUserController extends BaseController {

	@Autowired
	private HomeService appHomeService;
	@Autowired
	private WebUserService userService;
	@Autowired
	private WebUserLoginService userLoginService;
	@Autowired
	private WebUserMasterService webUserMasterService;
	@Autowired
	private WebThreeBuildService threebuildService;

	@Autowired
	private MessageService messageService;
	@Autowired
	private WebScoreService scoreService;

	@Autowired
	private AppVersionService appVersionService;
	
	@Autowired
	private UserCountService userCountService;
	
	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "login")
	@ResponseBody
	public PageData login() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData params = super.getApiPageData();
			String loginName = params.getString("loginName");
			String password = params.getString("password");

			boolean isSuccess = checkParam("login", params, new String[] { "loginName", "password" }, new String[] {
					"登录名", "密码" });
			if (isSuccess) {
				WebUser user = null;
				String[] userData = { loginName, password };
				if (!HString.isEmpty(userData) && userData.length == 2) {
					String loginname = userData[0];
					String loginPass = userData[1];
					PageData loginUser = userService.getByPhoneOrEmail(loginname);
					if (loginUser != null) {
						PageData login = userLoginService.getDetail(loginUser.getString("id"));
						if (login != null) {
							String ecPass = EncryptionUtil.md532Encryption(loginPass);
							if (ecPass.equals(login.getString("login_pwd"))) {
								if ("1".equals(loginUser.getString("isBan"))) {
									// 1.配置要放入session中的数据
									user = new WebUser();
									user.setId(loginUser.getLong("id"));
									PageData pd = new PageData();
									pd.put("loginIp", super.getRemortIP());
									pd.put("loginPrevIp", login.getString("login_ip"));
									pd.put("loginPrevTime", login.getString("update_time"));
									pd.put("userId", user.getId());
									userLoginService.loginSuccess(pd);

									res.putFlag(true);
									res.putMessage(XConst.SUCCESS);
									res.putData("user", loginUser);

									// 发送消息和添加分数

									PageData param = new PageData();
									param.put("userId", user.getId());
									PageData socreObtain = scoreService.findLastScoreObtain(param);
									PageData rule = null;
									if (HString.isEmpty(socreObtain)) {
										rule = scoreService.findRule(null, "OBTAIN_F_APP");
										param.put("opers", "OBTAIN_F_APP");
									} else {
										rule = scoreService.findRule(null, "OBTAIN_L_APP");
										param.put("opers", "OBTAIN_L_APP");
									}
									boolean isLoged = scoreService.checkIsLoginScore(param);
									if (isLoged) {
										addScoreObtain(user.getId(), rule);
										sendMessage(user.getId(), rule);
									}
									// 更新token
									params = getApiPageData(false);
									params.put("userId", user.getId());
									updateNewToken(params);
									String newToken = params.getString(XConst.API_TOKEN_KEY);
									res.putData(XConst.API_TOKEN_KEY, newToken);

								} else {
									res.putMessage(XConst.LOGIN_IS_BAN);
								}
							} else {
								res.putMessage(XConst.LOGIN_USER_PASS_ERR);
							}
						} else {
							res.putMessage(XConst.LOGIN_USER_PASS_ERR);
						}
					} else {
						res.putMessage(XConst.LOGIN_USER_PASS_ERR);
					}
				}
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
		}
		return res;
	}

	/**
	 * 注册获取短信验证码
	 * 
	 * @return
	 */
	@RequestMapping(value = "registCode")
	@ResponseBody
	public PageData registCode() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			if (ValidateHelper.isNullOrEmpty(phone)) {
				result.putMessage(XConst.PARAM_ERR);
			} else {
				PageData u = userService.getByPhoneOrEmail(phone);
				if (!ValidateHelper.isNullOrEmpty(u)) {
					result.putStatus(XConst.USER_IS_CONTAIN);
					result.putMessage(XConst.USER_IS_CONTAIN);
				} else {
					String checkSend = checkSendCode(phone, "phone");
					if (XConst.SUCCESS.equals(checkSend)) {
						String code = Long.toString(new Random().nextLong()).substring(1, 7);
						appHomeService.insertValidateCode(phone, code, "phone");
						SMSHelper.sendSMS(phone, "您的注册验证码为（" + code + "） 请及时验证。感谢您成为黔易游的会员。");
						result.putMessage(XConst.SUCCESS);
						result.putFlag(true);
					} else {
						result.putMessage(XConst.ACQUIRED_WAIT_60);// 等待60秒
					}
				}
			}
		} catch (Exception e) {
			result.putStatus(XConst.EXCEPTION);
			result.putMessage(XConst.USER_IS_CONTAIN);
			e.printStackTrace();
		}
		return result;
	}

	public String checkSendCode(String text, String type) throws Exception {
		PageData opc = appHomeService.getCodeByPhone(text, type);
		if (ValidateHelper.isNullOrEmpty(opc)) {
			return XConst.SUCCESS;
		} else {
			Long tenMinute = (long) (60 * 1000);// 60秒超时
			Long nowTime = System.currentTimeMillis();
			Long codeTime = TimeHelper.charConvertDate(opc.get("create_time").toString()).getTime();
			if (nowTime - codeTime > tenMinute) {
				return XConst.SUCCESS;
			}
		}
		return XConst.FAIL;
	}

	/**
	 * 校验注册短信验证码
	 * 
	 * @return
	 */
	@RequestMapping(value = "checkRegistCode")
	@ResponseBody
	public PageData checkRegistCode() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			String code = pd.getString("code");
			if (ValidateHelper.isNullOrEmpty(phone) || ValidateHelper.isNullOrEmpty(code)) {
				result.putMessage(XConst.PARAM_ERR);
			} else {
				PageData dbCode = appHomeService.getCodeByPhone(phone, "phone");
				if (ValidateHelper.isNullOrEmpty(dbCode)) {
					result.putMessage("code_null");
				} else {
					if (dbCode.get("vcode").equals(code)) {
						Long tenMinute = (long) (10 * 60 * 1000);
						Long nowTime = System.currentTimeMillis();
						Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
						if (nowTime - codeTime > tenMinute) {
							result.putMessage("code_time_out");
						} else {
							result.putFlag(true);
							result.putMessage(XConst.SUCCESS);
						}
					} else {
						result.putMessage("code_error");
					}
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 注册提交用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitRegist")
	@ResponseBody
	public PageData submitRegist() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			String nickName = pd.getString("nickName");
			String loginPwd = pd.getString("loginPwd");
			if (ValidateHelper.isNullOrEmpty(phone) || ValidateHelper.isNullOrEmpty(nickName)
					|| ValidateHelper.isNullOrEmpty(loginPwd)) {
				result.putMessage(XConst.PARAM_ERR);
			} else {
				PageData loginUser = userService.getByPhoneOrEmail(phone);
				if (HString.isEmpty(loginUser)) {
					pd.put("loginPwd", EncryptionUtil.md532Encryption(loginPwd));
					result = userService.insertWebUserByApp(pd);
				} else {
					result.putMessage(XConst.USER_IS_CONTAIN);
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 返回达人信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "getApplyMaster", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getApplyMaster() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = getApiPageData();
			pd.put("state", "ADD");
			Map<String, Object> masterMap = webUserMasterService.findMasterDetialByUserId(pd);
			if (masterMap != null) {
				List<Map<String, Object>> list = webUserMasterService.findMasterArea(pd);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("map", masterMap);
				map.put("list", list);
				result.putData("master", map);
			}
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 申请达人
	 * 
	 * @return
	 * @author Hham
	 */
	@RequestMapping(value = "applyMaster", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData applyMaster() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "realHeadImg", "summary", "realName", "nowlive", "occupation",
					"area", "qq", "weChat", "phone", "email" };
			String[] tips = new String[] { "用户ID", "真实头像", "个人简介", "真实姓名", "现住址", "职业", "精通地区", "QQ号", "微信号", "手机号",
					"邮箱" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				// PageData user=userService.findById(pd.getLong("userId"));
				Map<String, Object> DBMaster = webUserMasterService.findMasterDetialByUserId(pd);
				if (DBMaster != null) {
					webUserMasterService.updateMaster(pd);
				} else {
					webUserMasterService.applyMaster(pd);
				}
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 手机端发送短信
	 * 
	 * type : 'find' ,'registe'
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value = "sendAppSMS")
	@ResponseBody
	public PageData sendAppSMS() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = super.getApiPageData();
			boolean isSuccess = super.checkParam("sendAppSMS", param, new String[] { "type", "phone" }, new String[] {
					"类型", "手机号" });
			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				String type = param.getString("type");
				String phone = param.getString("phone");

				String checkSend = checkSendCode(phone, "phone");
				if (XConst.SUCCESS.equals(checkSend)) {
					String content = "";
					String vPhoneCode = Long.toString(new Random().nextLong()).substring(1, 7);
					PageData u = userService.getByPhoneOrEmail(phone);
					if ("find".equals(type)) {
						if (HString.isEmpty(u)) {
							res.putMessage("user_not_found");
							return res;
						}
						content = "您正在找回黔易游会员，手机验证码为:" + vPhoneCode + " ,如果不是您自己操作，请忽略。";
					} else {
						if (!HString.isEmpty(u)) {
							res.putMessage(XConst.USER_IS_CONTAIN);
							return res;
						}
						content = "您正在注册黔易游会员，手机注册码为:" + vPhoneCode + " ,如果不是您自己操作，请忽略。";
					}
					appHomeService.insertValidateCode(phone, vPhoneCode, "phone");
					SMSHelper.sendSMS(phone, content);
					res.putMessage(XConst.SUCCESS);
					res.putFlag(true);
				} else {
					res.putMessage(XConst.ACQUIRED_WAIT_60);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 找回密码
	 * 
	 * @return
	 */
	@RequestMapping(value = "findPassword")
	@ResponseBody
	public PageData findPassword() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = super.getApiPageData();
			boolean isSuccess = super.checkParam("findPassword", param,
					new String[] { "phone", "loginPwd", "rloginPwd" }, new String[] { "电话号码", "密码", "确认密码" });
			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
				return res;
			}
			String phone = param.getString("phone");
			PageData loginUser = userService.getByPhoneOrEmail(phone);
			if (!HString.isEmpty(loginUser)) {
				param.put("userId", loginUser.getLong("id"));
				String pwd = EncryptionUtil.md532Encryption(param.getString("loginPwd"));
				param.put("password", pwd);
				userLoginService.updatePassword(param);
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
				res.putData("msg", "修改成功。");
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * app端验证手机验证码
	 * 
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "checkCode")
	@ResponseBody
	public PageData checkCode() {
		PageData result = new PageData();
		result.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			String code = pd.getString("code");
			String type = pd.getString("type");
			PageData dbCode = appHomeService.getCodeByPhone(phone, "phone");
			if (dbCode != null && dbCode.get("vcode").equals(code)) {
				Long tenMinute = (long) (10 * 60 * 1000);
				Long nowTime = System.currentTimeMillis();
				Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
				if (nowTime - codeTime > tenMinute) {
					result.putMessage("code_time_out");
				} else {
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				}
			} else {
				result.putMessage("code_error");
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 第三方登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "thridLogin")
	@ResponseBody
	public PageData thridLogin() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = super.getPageData();
			boolean isSuccess = checkParam("thridLogin", param,
					new String[] { "thridUid", "buildFrom", "accessToken" }, new String[] { "第三方id", "第三方来源",
							"accessToken" });
			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
				return res;
			}
			// param.put("buildFrom", "weibo");
			// param.put("thridUid", user.getId());
			// param.put("accessToken", user.getAccessToken());
			res = threebuildService.insertUserBuild(param);
			if ("three_build".equals(res.getString("message"))) {
				PageData loginUser = (PageData) res.get("loginUser");
				// 发送消息和添加分数

				PageData paramScore = new PageData();
				paramScore.put("userId", loginUser.getLong("id"));
				PageData socreObtain = scoreService.findLastScoreObtain(paramScore);
				PageData rule = null;
				if (HString.isEmpty(socreObtain)) {
					rule = scoreService.findRule(null, "OBTAIN_F_APP");
					paramScore.put("opers", "OBTAIN_F_APP");
				} else {
					rule = scoreService.findRule(null, "OBTAIN_L_APP");
					paramScore.put("opers", "OBTAIN_L_APP");
				}
				boolean isLoged = scoreService.checkIsLoginScore(paramScore);
				if (isLoged) {
					addScoreObtain(loginUser.getLong("id"), rule);
					sendMessage(loginUser.getLong("id"), rule);
				}

				param = getApiPageData(false);
				param.put("userId", loginUser.getLong("id"));
				updateNewToken(param);
				String newToken = param.getString(XConst.API_TOKEN_KEY);
				res.putData(XConst.API_TOKEN_KEY, newToken);
				res.remove("loginUser");
			}else if("three_build_no_user".equals(res.getString("message"))){
				param.put("Token", get32UUID());
				updateNewToken(param);
				String newToken = param.getString(XConst.API_TOKEN_KEY);
				res.putData(XConst.API_TOKEN_KEY, newToken);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 第三方绑定
	 * 
	 * @return
	 */
	@RequestMapping(value = "thridBuild")
	@ResponseBody
	public PageData thridBuild() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();

			boolean isSuccess = checkParam("thridBuild", param, new String[] { "phone", "loginPwd", "thridUid",
					"thridFrom", "type" }, new String[] { "手机号", "密码", "第三方id", "第三方来源", "绑定类型" });

			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
				return res;
			}
			String type = param.getString("type");
			String phone = param.getString("phone");
			String loginPwd = param.getString("loginPwd");
			if ("registe".equals(type)) {
				isSuccess = checkParam("thridBuild", param, new String[] { "phone", "loginPwd", "thridUid",
						"thridFrom", "headImg", "nickName", "type" }, new String[] { "手机号", "密码", "第三方id", "第三方来源",
						"头像", "昵称", "绑定类型" });

				String rloginPwd = param.getString("rloginPwd");
				if (!rloginPwd.equals(loginPwd)) {
					res.putMessage("r_password_err");
				} else {
					PageData loginUser = userService.getByPhoneOrEmail(phone);
					if (HString.isEmpty(loginUser)) {
						param.put("loginPwd", EncryptionUtil.md532Encryption(loginPwd));
						res = userService.addRegiste(param, super.getRequest());
						//注册完成获取用户信息
						loginUser = userService.getByPhoneOrEmail(phone);
						res.putMessage(XConst.SUCCESS);
						res.putData("user", loginUser);
						// 更新token
						param = getApiPageData(false);
						param.put("userId", loginUser.getLong("id"));
						updateNewToken(param);
						String newToken = param.getString(XConst.API_TOKEN_KEY);
						res.putData(XConst.API_TOKEN_KEY, newToken);
					} else {
						res.putMessage(XConst.USER_IS_CONTAIN);
					}
				}
			} else if ("login".equals(type)) {
				PageData loginUser = userService.getByPhoneOrEmail(phone);
				if (!HString.isEmpty(loginUser)) {
					param.put("userId", loginUser.getLong("id"));
					userService.updateBuildUser(param);
					PageData login = userLoginService.getDetail(loginUser.getString("id"));
					if (login != null) {
						String ecPass = EncryptionUtil.md532Encryption(loginPwd);
						if (ecPass.equals(login.getString("login_pwd"))) {
							if ("1".equals(loginUser.getString("isBan"))) {
								// 1.配置要放入session中的数据
								WebUser user = new WebUser();
								user.setId(loginUser.getLong("id"));
								PageData pd = new PageData();
								pd.put("loginIp", super.getRemortIP());
								pd.put("loginPrevIp", login.getString("login_ip"));
								pd.put("loginPrevTime", login.getString("update_time"));
								pd.put("userId", user.getId());
								userLoginService.loginSuccess(pd);

								res.putFlag(true);
								res.putMessage(XConst.SUCCESS);
								res.putData("user", loginUser);

								// 发送消息和添加分数

								PageData paramScore = new PageData();
								paramScore.put("userId", user.getId());
								PageData socreObtain = scoreService.findLastScoreObtain(paramScore);
								PageData rule = null;
								if (HString.isEmpty(socreObtain)) {
									rule = scoreService.findRule(null, "OBTAIN_F_APP");
									param.put("opers", "OBTAIN_F_APP");
								} else {
									rule = scoreService.findRule(null, "OBTAIN_L_APP");
									param.put("opers", "OBTAIN_L_APP");
								}
								boolean isLoged = scoreService.checkIsLoginScore(paramScore);
								if (isLoged) {
									addScoreObtain(user.getId(), rule);
									sendMessage(user.getId(), rule);
								}

								// 更新token
								param = getApiPageData(false);
								param.put("userId", user.getId());
								updateNewToken(param);
								String newToken = param.getString(XConst.API_TOKEN_KEY);
								res.putData(XConst.API_TOKEN_KEY, newToken);
							} else {
								res.putMessage(XConst.LOGIN_IS_BAN);
							}
						} else {
							res.putMessage(XConst.LOGIN_USER_PASS_ERR);
						}
					} else {
						res.putMessage(XConst.LOGIN_USER_PASS_ERR);
					}
				} else {
					res.putMessage(XConst.USER_IS_NOT_FONUD);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 解绑定
	 * 
	 * @return
	 */
	@RequestMapping(value = "thridUnBuild")
	@ResponseBody
	public PageData thridUnBuild() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			boolean isSuccess = checkParam("thridBuild", param, new String[] { "userId", "thridUid", "thridFrom" },
					new String[] { "用户id", "第三方id", "第三方来源" });
			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				if (!isTokenSuccess(param))// 检查token
					return param;
				boolean unBiuldSuccess = userService.updateUnBuildUser(param);
				if (unBiuldSuccess) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 登录状态下绑定
	 * 
	 * @return
	 */
	@RequestMapping(value = "loginBuildUser")
	@ResponseBody
	public PageData loginBuildUser() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();

			if (!isTokenSuccess(param))// 检查token
				return param;
			boolean isSuccess = checkParam("loginBuildUser", param, new String[] { "userId", "thridUid", "buildFrom" },
					new String[] { "用户id", "第三方id", "第三方来源" });
			if (!isSuccess) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				String userId = param.getString("userId");
				PageData login = userLoginService.getDetail(userId);
				if (!HString.isEmpty(login)) {
					PageData buildRes = threebuildService.insertUserBuild(param);
					if (XConst.SUCCESS.equals(buildRes.getString("message"))) {
						res.putFlag(true);
						res.putMessage(XConst.SUCCESS);
					} else if ("three_build_no_user".equals(buildRes.getString("message"))) {
						param.put("userId", userId);
						param.put("thridFrom", param.getString("buildFrom"));
						boolean isBuild = userService.updateBuildUser(param);
						if (isBuild) {
							res.putFlag(true);
							res.putMessage(XConst.SUCCESS);
						}
					}else if("three_build".equals(buildRes.getString("message"))){
						res.putMessage(buildRes.getString("message"));
					}
					if (XConst.SUCCESS.equals(res.getString("message"))) {
						// 更新token
						param = getApiPageData(false);
						param.put("userId", userId);
						updateNewToken(param);
						String newToken = param.getString(XConst.API_TOKEN_KEY);
						res.putData(XConst.API_TOKEN_KEY, newToken);
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
	 * 查询是否为达人
	 * 
	 * @return
	 */
	@RequestMapping(value = "isMaster", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData isMaster() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId" };
			String[] tips = new String[] { "用户ID" };
			boolean checkParam = checkParam("isMaster", pd, param, tips);
			if (checkParam) {
				PageData isMaster = webUserMasterService.findUserMaster(pd);
				result.putData("isMaster", isMaster);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "checkVersion", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData checkVersion() {
//		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			// String[] param = new String[] { "" };
			// String[] tips = new String[] { "" };
			// boolean checkParam = checkParam("checkVersion", pd, param, tips);
			// if (checkParam) {
			PageData version=appVersionService.findAppNewVersion(XConst.ANDROID);
			result.putData("version", version);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
			// }
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 登录统计接口
	 * @param userId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="countLogin",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData countLogin(Long userId,String type){
		PageData result = new PageData();
		result.putFlag(false);
		try {
			userCountService.insertLoginCount(userId,type);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 注册统计接口
	 * @param userId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="countRegister",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData countRegister(Long userId,String type){
		PageData result = new PageData();
		result.putFlag(false);
		try {
			userCountService.insertRegisterCount(userId,type);
			result.putFlag(true);
			result.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	// 添加消息
	// (#{message},#{msgType},#{msgSource},#{fromUserId},#{toUserId},#{biuldId},#{biuldTitle},#{biuldImg})
	public void sendMessage(Long userId, PageData rule) throws Exception {
		Integer ruleScore = rule.getInt("ruleScore");
		if (HString.isEmpty(ruleScore))
			ruleScore = 0;
		PageData param = new PageData();

		param.put("message", "登录APP获得" + ruleScore + "个桃子");
		param.put("msgType", "notice");
		param.put("msgSource", "score");
		param.put("fromUserId", 0);
		param.put("toUserId", userId);
		param.put("biuldId", 0);
		param.put("biuldTitle", "登录APP获得" + ruleScore + "个桃子");
		param.put("biuldImg", "");
		messageService.addMessage(param);
	}

	// 添加积分详细(opers==>ruleKey,userId)
	public void addScoreObtain(Long userId, PageData rule) throws Exception {
		PageData param = new PageData();
		param.clear();
		param.put("userId", userId);
		param.put("opers", rule.getString("ruleKey"));
		scoreService.addScoreObtain(param);
	}
	
	/**
	 * 临时账户更新手机号
	 * @param userId
	 * @param phone
	 * @return
	 */
	@RequestMapping(value="updateUserPhone")
	@ResponseBody
	public PageData updateUserPhone(Long userId,String phone){
		PageData pd=new PageData();
		try {
			if(userLoginService.updateUserPhone(userId,phone)){
				pd.putFlag(true);
				pd.putMessage(XConst.SUCCESS);
			}else{
				pd.putFlag(false);
				pd.putMessage(XConst.ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
	
	

}
