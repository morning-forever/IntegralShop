package com.bm.webs.controller.web.user;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.date.TimeHelper;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.common.weibo4j.model.User;
import com.bm.common.weibo4j.org.json.JSONObject;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.controller.util.QzoneAuthorize;
import com.bm.webs.controller.util.SMSHelper;
import com.bm.webs.controller.util.WechatAuthorize;
import com.bm.webs.controller.util.WeiboAuthorize;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.system.UserCountService;
import com.bm.webs.service.web.MessageService;
import com.bm.webs.service.web.WebScoreService;
import com.bm.webs.service.web.user.WebThreeBuildService;
import com.bm.webs.service.web.user.WebUserLoginService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 前台用于登录
 * 
 * @author mike <br>
 *         2015年9月1日
 */
@Controller(value = "webLoginController")
@RequestMapping(value = "/pc/login")
public class LoginController extends BaseController {

	@Autowired
	private WebUserService userService;
	@Autowired
	private WebUserLoginService userLoginService;
	@Autowired
	private WebThreeBuildService threebuildService;

	@Autowired
	private HomeService appHomeService;

	@Autowired
	private MessageService messageService;
	@Autowired
	private WebScoreService scoreService;
	
	@Autowired
	private UserCountService userCountService;
	

	/**
	 * 跳转登录页面
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toLogin" })
	public ModelAndView toLogin() {
		ModelAndView mav = new ModelAndView("web/login");
		return mav;
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=login" })
	@ResponseBody
	public PageData login() {
		PageData pageData = null;
		try {
			pageData = super.getPageData();
			String data = pageData.getString("DATA");
			String[] userData = data.split(",");
			pageData = new PageData();
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
								SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
								if (null != set) {
									WebUser user = set.getWebUser();
									if (null != user) {
										String thridUid = user.getThreeUid();
										if (!HString.isEmpty(thridUid)) {
											Long userId = loginUser.getLong("id");
											PageData param = new PageData();
											param.put("userId", userId);
											param.put("thridFrom", user.getThridFrom());
											param.put("thridUid", user.getThreeUid());
											userService.updateBuildUser(param);
										}
									}
								}
								SystemSet sysset = new SystemSet();
								// 1.配置要放入session中的数据
								WebUser user = new WebUser();
								user.setId(loginUser.getLong("id"));
								user.setNickname(loginUser.getString("nickname"));
								user.setIsMaster(loginUser.getInt("isMasterFlag"));
								user.setEmail(loginUser.getString("email"));
								user.setHeadImg(loginUser.getString("headImg"));
								user.setPhone(loginUser.getString("phone"));
								user.setUserLevelId(loginUser.getLong("userLevelId"));
								user.setAtAreaId(loginUser.getLong("atAreaId"));
								sysset.setWebUser(user);

								PageData pd = new PageData();
								pd.put("loginIp", super.getRemortIP());
								pd.put("loginPrevIp", login.getString("login_ip"));
								pd.put("loginPrevTime", login.getString("update_time"));
								pd.put("userId", user.getId());
								userLoginService.loginSuccess(pd);

								PageData res = messageService.findUnreadLine(pd);

								@SuppressWarnings("unchecked")
								List<PageData> unread = (List<PageData>) res.getData().get("unread");
								if (!HString.isEmpty(unread)) {
									for (PageData pageData2 : unread) {
										super.getRequest().getSession().setAttribute(pageData2.getString("msgType"), pageData2.get("unreadLine"));
									}
								} else {
									super.getRequest().getSession().setAttribute("comment", 0);
									super.getRequest().getSession().setAttribute("notice", 0);
								}
								
								
								
								PageData param1 = new PageData();
								param1.put("userId", user.getId());
								param1.put("opers", "OBTAIN_L_WEB");
								boolean isLoged = scoreService.checkIsLoginScore(param1);
								if(isLoged){
									PageData rule = scoreService.findRule(null, "OBTAIN_L_WEB");
									addScoreObtain(user.getId() ,rule);
									sendMessage(user.getId() ,rule);
								}
								userCountService.insertLoginCount(user.getId(), "web");
								
								super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
								pageData.clear();// 先清空pageData中的数据
								pageData.put("flag", XConst.SUCCESS);
							} else {
								pageData.put("flag", XConst.LOGIN_IS_BAN);
							}
						} else {
							pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
						}
					} else {
						pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
					}
				} else {
					pageData.put("flag", XConst.LOGIN_USER_PASS_ERR);
				}
			}
			String redirect = (String) super.getRequest().getSession().getAttribute("redirect");
			if (!HString.isEmpty(redirect)) {
				String redirectUrl=URLDecoder.decode(redirect, "utf-8");
				if(!redirectUrl.startsWith("http")){
					redirectUrl=redirectUrl.substring(1);
				}
				pageData.put("redirect", redirectUrl);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return pageData;
	}
	
	//添加消息 (#{message},#{msgType},#{msgSource},#{fromUserId},#{toUserId},#{biuldId},#{biuldTitle},#{biuldImg})
	public void sendMessage(Long userId,PageData rule) throws Exception{
		Integer ruleScore = rule.getInt("ruleScore");
		if(HString.isEmpty(ruleScore))
			ruleScore = 0;
		PageData param = new PageData();
		
		param.put("message", "登录网站获得"+ruleScore+"个桃子");
		param.put("msgType", "notice");
		param.put("msgSource", "score");
		param.put("fromUserId", 0);
		param.put("toUserId", userId);
		param.put("biuldId", 0);
		param.put("biuldTitle", "登录网站获得"+ruleScore+"个桃子");
		param.put("biuldImg", "");
		messageService.addMessage(param);
	}
	
	//添加积分详细(opers==>ruleKey,userId)
	public void addScoreObtain(Long userId,PageData rule) throws Exception{
		PageData param = new PageData();
		param.clear();
		param.put("userId", userId);
		param.put("opers", rule.getString("ruleKey"));
		scoreService.addScoreObtain(param);
	}
	
	/**
	 * 退出登录
	 * 
	 * @return
	 */
	@RequestMapping("/outLogin")
	@ResponseBody
	public PageData outLogin() {
		PageData reqData = super.getPageData();
		try {
			/*
			 * WebUser webUser = new WebUser(); webUser.setThreeUid("3197496877"); webUser.setNickname("小柒"); webUser.setHeadImg("http://tp2.sinaimg.cn/3197496877/180/5732454381/1"); webUser.setThridFrom("weibo");
			 */
			super.updateSessionUser(null);
			reqData.clear();
			reqData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reqData;
	}

	/**
	 * 跳转注册页面
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toRegiste" })
	public ModelAndView toRegiste() {
		ModelAndView mav = new ModelAndView("web/registe");
		return mav;
	}

	@RequestMapping(params = { "op=toRegProtocol" })
	public ModelAndView toRegProtocol() {
		ModelAndView mav = new ModelAndView("web/reg_protocol");
		return mav;
	}

	@RequestMapping(params = { "op=toEmailVildate" })
	public ModelAndView toEmailVildate() {
		ModelAndView mav = new ModelAndView("web/email_validate");
		mav.addObject("mailAddr", super.getRequest().getSession().getAttribute("mailAddr"));
		mav.addObject("email", super.getRequest().getSession().getAttribute("email"));
		return mav;
	}

	@RequestMapping(params = { "op=toThirdLogin" })
	@ResponseBody
	public PageData toThirdLogin() {
		PageData res = new PageData(true);
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			HttpServletResponse response = super.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PageData param = super.getPageData();
			String ruls = null;
			String type = param.getString("type");
			if ("qq".equals(type)) {
				ruls = QzoneAuthorize.getAuthorizeUrl();
			} else if ("wechat".equals(type)) {
				ruls = WechatAuthorize.getAuthorizeUrl();
			} else if ("weibo".equals(type)) {
				ruls = WeiboAuthorize.getAuthorizeUrl();
			}
			if (!HString.isEmpty(ruls)) {
				res.put("urls", ruls);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(params = { "op=weiboLogin" })
	public String weiboLogin() {
		try {
			PageData param = super.getPageData();
			System.out.println("----------------------------------------weibo:" + param);
			User user = WeiboAuthorize.getUserinfo(param.getString("code"));
			if (null != user) {
				// param.put("userId", user.getId());
				param.put("buildFrom", "weibo");
				param.put("thridUid", user.getId());
				param.put("accessToken", user.getAccessToken());
				PageData res = threebuildService.insertUserBuild(param);
				SystemSet sysset = new SystemSet();
				WebUser webUser = new WebUser();
				if ("three_build".equals(res.getString(XConst.STATUS_KEY))) {
					// 1.配置要放入session中的数据
					PageData loginUser = (PageData) res.get("loginUser");
					webUser.setId(loginUser.getLong("id"));
					webUser.setNickname(loginUser.getString("nickname"));
					webUser.setIsMaster(loginUser.getInt("isMasterFlag"));
					webUser.setEmail(loginUser.getString("email"));
					webUser.setHeadImg(loginUser.getString("headImg"));
					webUser.setPhone(loginUser.getString("phone"));
					webUser.setUserLevelId(loginUser.getLong("userLevelId"));
					webUser.setAtAreaId(loginUser.getLong("atAreaId"));
					PageData login = userLoginService.getDetail(loginUser.getString("id"));
					PageData pd = new PageData();
					pd.put("loginIp", super.getRemortIP());
					pd.put("loginPrevIp", login.getString("login_ip"));
					pd.put("loginPrevTime", login.getString("update_time"));
					pd.put("userId", webUser.getId());
					userLoginService.loginSuccess(pd);
					sysset.setWebUser(webUser);
					super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
					
					PageData param1 = new PageData();
					param1.put("userId", webUser.getId());
					param1.put("opers", "OBTAIN_L_WEB");
					boolean isLoged = scoreService.checkIsLoginScore(param1);
					if(isLoged){
						PageData rule = scoreService.findRule(null, "OBTAIN_L_WEB");
						addScoreObtain(webUser.getId() ,rule);
						sendMessage(webUser.getId() ,rule);
					}
					userCountService.insertLoginCount(webUser.getId(), "web");
					return "redirect:/";
				} else {
					webUser.setThreeUid(user.getId());
					webUser.setNickname(user.getScreenName());
					webUser.setHeadImg(user.getAvatarLarge());
					webUser.setAccessToken(user.getAccessToken());
					webUser.setThridFrom("weibo");
				}
				sysset.setWebUser(webUser);
				super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
//		return "redirect:/pc/login?op=biuld";
	}

	@RequestMapping(params = { "op=wechatLogin" })
	public String weichatLogin() {
		try {
			PageData param = super.getPageData();
			System.out.println("----------------------------------------weixin:" + param);
			// WechatAuthorize.getAccessToken(param.getString("code"));

			JSONObject user = WechatAuthorize.getUserinfo(param.getString("code"), null, null);
			if (null != user) {
				param.put("buildFrom", "wechat");
				param.put("thridUid", user.getString("openid"));
				param.put("accessToken", user.getString("access_token"));
				PageData res = threebuildService.insertUserBuild(param);
				SystemSet sysset = new SystemSet();
				WebUser webUser = new WebUser();
				if ("three_build".equals(res.getString(XConst.STATUS_KEY))) {
					// 1.配置要放入session中的数据
					PageData loginUser = (PageData) res.get("loginUser");
					webUser.setId(loginUser.getLong("id"));
					webUser.setNickname(loginUser.getString("nickname"));
					webUser.setIsMaster(loginUser.getInt("isMasterFlag"));
					webUser.setEmail(loginUser.getString("email"));
					webUser.setHeadImg(loginUser.getString("headImg"));
					webUser.setPhone(loginUser.getString("phone"));
					webUser.setUserLevelId(loginUser.getLong("userLevelId"));
					webUser.setAtAreaId(loginUser.getLong("atAreaId"));
					PageData login = userLoginService.getDetail(loginUser.getString("id"));
					PageData pd = new PageData();
					pd.put("loginIp", super.getRemortIP());
					pd.put("loginPrevIp", login.getString("login_ip"));
					pd.put("loginPrevTime", login.getString("update_time"));
					pd.put("userId", webUser.getId());
					userLoginService.loginSuccess(pd);
					sysset.setWebUser(webUser);
					super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
					
					PageData param1 = new PageData();
					param1.put("userId", webUser.getId());
					param1.put("opers", "OBTAIN_L_WEB");
					boolean isLoged = scoreService.checkIsLoginScore(param1);
					if(isLoged){
						PageData rule = scoreService.findRule(null, "OBTAIN_L_WEB");
						addScoreObtain(webUser.getId() ,rule);
						sendMessage(webUser.getId() ,rule);
					}
					userCountService.insertLoginCount(webUser.getId(), "web");
					return "redirect:/";
				} else {
					webUser.setThreeUid(user.getString("openid"));
					webUser.setNickname(user.getString("nickname"));
					webUser.setHeadImg(user.getString("headimgurl"));
					webUser.setAccessToken(user.getString("access_token"));
					webUser.setThridFrom("wechat");
				}
				sysset.setWebUser(webUser);
				super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
//		return "redirect:/pc/login?op=biuld";
	}

	@RequestMapping(params = { "op=qzoneLogin" })
	public String qzoneLogin() {
		try {
			PageData param = super.getPageData();
			System.out.println("----------------------------------------qq:" + param);
			JSONObject user = QzoneAuthorize.getUserinfo(param.getString("code"), null);
			if (null != user) {
				param.put("buildFrom", "qzone");
				param.put("thridUid", user.getString("openid"));
				param.put("accessToken", user.getString("access_token"));
				PageData res = threebuildService.insertUserBuild(param);
				SystemSet sysset = new SystemSet();
				WebUser webUser = new WebUser();
				if ("three_build".equals(res.getString(XConst.STATUS_KEY))) {
					// 1.配置要放入session中的数据
					PageData loginUser = (PageData) res.get("loginUser");
					webUser.setId(loginUser.getLong("id"));
					webUser.setNickname(loginUser.getString("nickname"));
					webUser.setIsMaster(loginUser.getInt("isMasterFlag"));
					webUser.setEmail(loginUser.getString("email"));
					webUser.setHeadImg(loginUser.getString("headImg"));
					webUser.setPhone(loginUser.getString("phone"));
					webUser.setUserLevelId(loginUser.getLong("userLevelId"));
					webUser.setAtAreaId(loginUser.getLong("atAreaId"));
					PageData login = userLoginService.getDetail(loginUser.getString("id"));
					PageData pd = new PageData();
					pd.put("loginIp", super.getRemortIP());
					pd.put("loginPrevIp", login.getString("login_ip"));
					pd.put("loginPrevTime", login.getString("update_time"));
					pd.put("userId", webUser.getId());
					userLoginService.loginSuccess(pd);
					sysset.setWebUser(webUser);
					super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
					
					PageData param1 = new PageData();
					param1.put("userId", webUser.getId());
					param1.put("opers", "OBTAIN_L_WEB");
					boolean isLoged = scoreService.checkIsLoginScore(param1);
					if(isLoged){
						PageData rule = scoreService.findRule(null, "OBTAIN_L_WEB");
						addScoreObtain(webUser.getId() ,rule);
						sendMessage(webUser.getId() ,rule);
					}
					userCountService.insertLoginCount(webUser.getId(), "web");
					return "redirect:/";
				} else {
					webUser.setThreeUid(user.getString("openid"));
					webUser.setNickname(user.getString("nickname"));
					webUser.setHeadImg(user.getString("figureurl_2"));
					webUser.setAccessToken(user.getString("access_token"));
					webUser.setThridFrom("qzone");
				}
				sysset.setWebUser(webUser);
				super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
//		return "redirect:/pc/login?op=biuld";
	}

	@RequestMapping(params = { "op=biuld" })
	public ModelAndView thridBiuldUser() {
		ModelAndView mav = new ModelAndView("web/registe");
		return mav;
	}

	/**
	 * 手机注册
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=register" })
	@ResponseBody
	public PageData register() {
		PageData res = new PageData(true);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			String emmail = pd.getString("email");
			String nickName = pd.getString("nickName");
			String loginPwd = pd.getString("loginPwd");
			String rloginPwd = pd.getString("rloginPwd");

			if (HString.isEmpty(phone)) {
				phone = emmail;
			}
			if (ValidateHelper.isNullOrEmpty(nickName) || ValidateHelper.isNullOrEmpty(loginPwd)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				if (!rloginPwd.equals(loginPwd)) {
					res.putMessage("r_password_err");
				} else {
					PageData loginUser = userService.getByPhoneOrEmail(phone);
					if (HString.isEmpty(loginUser)) {

						SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
						if (null != set) {
							WebUser user = set.getWebUser();
							if (null != user) {
								String from = user.getThridFrom();
								String headImg = user.getHeadImg();
								nickName = user.getNickname();
								pd.put("thridUid", user.getThreeUid());
								pd.put("thridFrom", from);
								pd.put("headImg", headImg);
								pd.put("nickname", nickName);
							}
						}
						pd.put("loginPwd", EncryptionUtil.md532Encryption(loginPwd));
						res = userService.addRegiste(pd, super.getRequest());
						userCountService.insertRegisterCount(pd.getLong("userId"), "web");
					} else {
						res.putMessage(XConst.USER_IS_CONTAIN);
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
	 * 发送注册短信
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=sendSMS" })
	@ResponseBody
	public PageData sendSMS() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			String vPhoneCode = "";
			for (int j = 0; j < 6; j++) {
				vPhoneCode += Math.round(Math.random() * 9);
			}
			String phone = param.getString("phone");
			PageData user = userService.getByPhoneOrEmail(phone);
			if(!HString.isEmpty(user)){
				res.putStatus(XConst.EXISTS);
				return res;
			}
			String checkSend = checkSendCode(phone, "phone");
			if (XConst.SUCCESS.equals(checkSend)) {
				String content = "您正在注册黔易游会员，手机注册码为:" + vPhoneCode + " ,如果不是您自己操作，请忽略。";
				String msg = SMSHelper.sendSMS(phone, content);
				appHomeService.insertValidateCode(phone, vPhoneCode, "phone");
				System.out.println("msg：" + msg);
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.API_TIMEOUT);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 检查注册手机验证码
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=checkPhoneCode" })
	@ResponseBody
	public PageData checkPhoneCode() {
		PageData res = new PageData(true);
		try {
			PageData pd = super.getApiPageData();
			String phone = pd.getString("phone");
			String code = pd.getString("vPhoneCode");
			if (ValidateHelper.isNullOrEmpty(phone) || ValidateHelper.isNullOrEmpty(code)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				PageData dbCode = appHomeService.getCodeByPhone(phone, "phone");
				if (ValidateHelper.isNullOrEmpty(dbCode)) {
					res.putMessage("code_null");
				} else {
					if (dbCode.get("vcode").equals(code)) {
						Long tenMinute = (long) (10 * 60 * 1000);
						Long nowTime = System.currentTimeMillis();
						Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
						if (nowTime - codeTime > tenMinute) {
							res.putMessage("code_time_out");
						} else {
							res.putFlag(true);
							res.putMessage(XConst.SUCCESS);
						}
					} else {
						res.putMessage("code_error");
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
	 * 跳转到下一步
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toRegNext" })
	public ModelAndView toRegNext() {
		ModelAndView mav = new ModelAndView("web/reg_next");
		try {
			String thridUid = super.getRequest().getParameter("thridUid");
			String emailCode = super.getRequest().getParameter("emailCode");
			String email = super.getRequest().getParameter("email");
			if (!HString.isEmpty(email)) {
				if (!HString.isEmpty(emailCode)) {
					PageData dbCode = appHomeService.getCodeByPhone(email, "email_pc_reg");
					Long tenMinute = (long) (10 * 60 * 1000);
					Long nowTime = System.currentTimeMillis();
					Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
					if (HString.isEmpty(dbCode) || !dbCode.getString("vcode").equals(emailCode) || (nowTime - codeTime > tenMinute)) {
						return new ModelAndView("404");
					}
				} else {
					return new ModelAndView("404");
				}
			}
			mav.addObject("phone", super.getRequest().getParameter("phone"));
			mav.addObject("email", super.getRequest().getParameter("email"));
			mav.addObject("regtype", super.getRequest().getParameter("rtype"));

			if (!HString.isEmpty(thridUid)) {
				SystemSet sysset = new SystemSet();
				WebUser webUser = new WebUser();
				String nickname = super.getRequest().getParameter("nickname");
				String newNickname = "";
				newNickname = new String(nickname.getBytes("ISO-8859-1"), "utf-8");
				webUser.setNickname(newNickname);
				webUser.setEmail(super.getRequest().getParameter("email"));
				webUser.setThreeUid(super.getRequest().getParameter("thridUid"));
				webUser.setHeadImg(super.getRequest().getParameter("headImg"));
				webUser.setThridFrom(super.getRequest().getParameter("thridFrom"));
				sysset.setWebUser(webUser);
				super.getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, sysset);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 检查邮箱并发送邮件
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=checkEmail" })
	@ResponseBody
	public PageData checkEmail() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String email = pd.getString("email");
			if (ValidateHelper.isNullOrEmpty(email)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {

				PageData loginUser = userService.getByPhoneOrEmail(email);
				if (!HString.isEmpty(loginUser)) {
					res.putMessage(XConst.USER_IS_CONTAIN);
					return res;
				}
				String checkSend = checkSendCode(email, "email_pc_reg");
				if (XConst.SUCCESS.equals(checkSend)) {
					String url = ConfigLoad.getStringValue("webapp.site") + "pc/login?op=toRegNext&rtype=email";
					String emailCode = EncryptionUtil.md532Encryption(email);
					SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
					if (null != set) {
						WebUser user = set.getWebUser();
						if (null != user) {
							emailCode += "_" + user.getThreeUid() + "_" + user.getThridFrom();
							url += "&thridUid=" + user.getThreeUid() + "&thridFrom=" + user.getThridFrom() + "&nickname=" + user.getNickname() + "&headImg=" + user.getHeadImg();
						}
					}
					url += "&email=" + email + "&emailCode=" + emailCode;
					// 数据库中备份
					appHomeService.insertValidateCode(email, emailCode, "email_pc_reg");

					String content = "请点击以下网址进入设置您的密码信息：<br><br>" + "<a style='padding-left:100px;' href='" + url + "'>点击这里设置密码</a><br><br>" + "如果上面无法点击，可以复制以下网址到浏览器中操作："
							+ "<span style='padding-left:100px;'>&nbsp;<br>" + url + "</span>" + "<br><br><br>";
					SimpleMailSender.sendEmail(email, "黔易游邮箱注册验证", content, "2");
					String mailAddr = email.substring(email.lastIndexOf("@") + 1, email.length());
					res.put("mailAddr", mailAddr);
					super.getRequest().getSession().setAttribute("email", email);
					super.getRequest().getSession().setAttribute("mailAddr", mailAddr);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				} else {
					res.putMessage(XConst.API_TIMEOUT);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 跳入找回密码的页面
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toFindPwd" })
	public ModelAndView toFindPwd() {
		ModelAndView mav = new ModelAndView("web/find_pwd");
		return mav;
	}

	/**
	 * 发送找回密码的手机短信
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=sendSMSOfFind" })
	@ResponseBody
	public PageData sendSMSOfFind() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = super.getPageData();
			String vPhoneCode = "";
			for (int j = 0; j < 6; j++) {
				vPhoneCode += Math.round(Math.random() * 9);
			}
			String phone = param.getString("phone");
			PageData loginUser = userService.getByPhoneOrEmail(phone);
			if (HString.isEmpty(loginUser)) {
				res.putMessage("user_not_found");
			} else {
				String checkSend = checkSendCode(phone, "phone");
				if (XConst.SUCCESS.equals(checkSend)) {
					String content = "您正在找回黔易游会员，手机验证码为:" + vPhoneCode + " ,如果不是您自己操作，请忽略。";
					String msg = SMSHelper.sendSMS(phone, content);
					appHomeService.insertValidateCode(phone, vPhoneCode, "phone");
					System.out.println("msg：" + msg);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				} else {
					res.putMessage(XConst.API_TIMEOUT);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
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
	 * 跳入密码提交页面
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=toFindconfrim" })
	public ModelAndView toFindconfrim() {
		ModelAndView mav = new ModelAndView("web/find_pwd_confrim");
		try {

			String phone = super.getRequest().getParameter("phone");
			String email = super.getRequest().getParameter("email");
			mav.addObject("phone", phone);
			if (HString.isEmpty(phone))
				phone = email;
			if (HString.isEmpty(phone)) {
				return new ModelAndView("404");
			}
			mav.addObject("email", email);
			if (!HString.isEmpty(email)) {
				String emailCode = super.getRequest().getParameter("emailCode");
				if (!HString.isEmpty(emailCode)) {
					PageData dbCode = appHomeService.getCodeByPhone(email, "email_pc_find");
					Long tenMinute = (long) (10 * 60 * 1000);
					Long nowTime = System.currentTimeMillis();
					Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
					if (HString.isEmpty(dbCode) || !dbCode.getString("vcode").equals(emailCode) || (nowTime - codeTime > tenMinute)) {
						return new ModelAndView("404");
					}
				} else {
					return new ModelAndView("404");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("404");
		}
		return mav;
	}

	/**
	 * 找回密码
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=updatePassword" })
	@ResponseBody
	public PageData updatePassword() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getPageData();
			String phone = param.getString("phone");
			String email = param.getString("email");
			String loginPwd = param.getString("loginPwd");
			String rphone = phone;
			if (HString.isEmpty(phone)) {
				phone = email;
			}
			if (HString.isEmpty(phone) || HString.isEmpty(loginPwd) || !loginPwd.equals(param.getString("rloginPwd"))) {
				res.putMessage(XConst.PARAM_ERR);
				return res;
			}

			if (!HString.isEmpty(rphone)) {
				PageData dbCode = appHomeService.getCodeByPhone(phone, "phone");
				if (!HString.isEmpty(dbCode)) {
					Long tenMinute = (long) (10 * 60 * 1000);
					Long nowTime = System.currentTimeMillis();
					Long codeTime = TimeHelper.charConvertDate(dbCode.get("create_time").toString()).getTime();
					if (nowTime - codeTime > tenMinute) {
						res.putMessage("time_out");
						return res;
					}
				}
			}
			PageData loginUser = userService.getByPhoneOrEmail(phone);
			if (!HString.isEmpty(loginUser)) {
				param.put("userId", loginUser.getLong("id"));
				String pwd = EncryptionUtil.md532Encryption(param.getString("loginPwd"));
				param.put("password", pwd);
				userLoginService.updatePassword(param);
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
			}

		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}

		return res;
	}

	/**
	 * 找回密码设置
	 * 
	 * @return
	 */
	@RequestMapping(params = { "op=checkEmailFind" })
	@ResponseBody
	public PageData checkEmailFind() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData pd = super.getApiPageData();
			String email = pd.getString("email");
			if (ValidateHelper.isNullOrEmpty(email)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {

				String code = pd.getString("vcode");
				String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");
				
				
				
				if (HString.isEmpty(code) || !code.toLowerCase().equals(vcode)) {
					res.putMessage("code_err");
					return res;
				}
				PageData loginUser = userService.getByPhoneOrEmail(email);
				if (HString.isEmpty(loginUser)) {
					res.putMessage("user_not_found");
					return res;
				}

				String checkSend = checkSendCode(email, "email_pc_find");
				if (XConst.SUCCESS.equals(checkSend)) {
					String url = ConfigLoad.getStringValue("webapp.site") + "pc/login?op=toFindconfrim";
					String emailCode = EncryptionUtil.md532Encryption(email);
					url += "&email=" + email + "&emailCode=" + emailCode;
					// 数据库中备份
					appHomeService.insertValidateCode(email, emailCode, "email_pc_find");
					String content = "请点击以下网址进入设置您的密码信息：<br><br>" + "<a style='padding-left:100px;' href='" + url + "'>点击这里设置密码</a><br><br>" + "如果上面无法点击，可以复制以下网址到浏览器中操作："
							+ "<span style='padding-left:100px;'>&nbsp;<br>" + url + "</span>" + "<br><br><br>";
					SimpleMailSender.sendEmail(email, "黔易游密码找回设置", content, "2");
					String mailAddr = email.substring(email.lastIndexOf("@") + 1, email.length());
					res.put("mailAddr", mailAddr);
					super.getRequest().getSession().setAttribute("email", email);
					super.getRequest().getSession().setAttribute("mailAddr", mailAddr);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				} else {
					res.putMessage(XConst.API_TIMEOUT);
				}
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 设置登录回调地址
	 * 
	 * @return
	 */
	@RequestMapping(value = "setBackUrl", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData setBackUrl() {
		PageData pd = getApiPageData();
		try {
			String url = pd.getString("backUrl");
			String projectName = getRequest().getContextPath();
			url = url.substring(url.indexOf(projectName) + projectName.length());
			getRequest().getSession().setAttribute("redirect", url);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
