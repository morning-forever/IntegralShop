package com.bm.webs.controller.web.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.date.TimeHelper;
import com.bm.common.util.file.FileUpload;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.common.util.su.EncryptionUtil;
import com.bm.webs.bean.AreaAll;
import com.bm.webs.bean.CollectionItem;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.controller.util.SMSHelper;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.common.AreaAllService;
import com.bm.webs.service.depth.WebUserCollectionService;
import com.bm.webs.service.web.MessageService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebScoreService;
import com.bm.webs.service.web.WebUserMasterService;
import com.bm.webs.service.web.forum.WebComplaintService;
import com.bm.webs.service.web.forum.WebQuestionService;
import com.bm.webs.service.web.forum.WebTravelsService;
import com.bm.webs.service.web.user.WebUserLoginService;
import com.bm.webs.service.web.user.WebUserService;

@Controller(value = "webUserController")
@RequestMapping(value = "pc/user")
public class UserController extends BaseController {

	@Autowired
	private WebUserService userService;

	@Autowired
	private AreaAllService areaAllService;

	@Autowired
	private WebTravelsService webTravelsService;

	@Autowired
	private WebComplaintService webComplaintService;

	@Autowired
	private WebQuestionService webQuestionService;

	@Autowired
	private WebUserCollectionService webUserCollectionService;

	@Autowired
	private WebCitysService webCitysService;

	@Autowired
	private WebUserMasterService webUserMasterService;

	@Autowired
	private WebUserLoginService userLoginService;

	@RequestMapping(value = "home")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData webUser = null;
			PageData param = super.getPageData();
			Integer examine_state = null;
			Long userId = param.getLong("id");
			if (HString.isEmpty(userId)) {
				SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
				WebUser user = set.getWebUser();
				webUser = userService.getDetail(user.getId());
				mav.addObject("user", webUser);
			} else {
				examine_state = 1;
				webUser = userService.getDetail(userId);
				mav.addObject("user", webUser);
			}
			if(webUser==null){
				mav.setViewName("web/registe");
				getRequest().getSession().setAttribute("redirect", "/#");
				System.out.println("错误账号");
				return mav;
			}
			userId = webUser.getLong("id");
			param = new PageData();

			param.put("userId", userId);
			param.put("examine_state", examine_state);
			param.put("personal", 0);
			param.put("startLine", 0);
			param.put("showLine", 5);
			param.put("orderType", 0);

			// 查询首页List,前5个文章、问答和吐槽
			param.put("travelType", 1);// 精彩游记
			List<Map<String, Object>> travelsList = webTravelsService.findStrategyList(param);
			mav.addObject("travelsList", travelsList);
			mav.addObject("travelsCount", param.get("recordsTotal"));
			param.put("travelType", 2);// 达人攻略
			List<Map<String, Object>> strategyList = webTravelsService.findStrategyList(param);
			mav.addObject("strategyList", strategyList);
			mav.addObject("strategyCount", param.get("recordsTotal"));
			param.put("travelType", 3);// 玩伴招募
			List<Map<String, Object>> friendList = webTravelsService.findStrategyList(param);
			mav.addObject("friendList", friendList);
			mav.addObject("friendCount", param.get("recordsTotal"));
			// 吐槽
			List<Map<String, Object>> complaintList = webComplaintService.findList(param);
			mav.addObject("complaintList", complaintList);
			mav.addObject("complaintCount", param.get("recordsTotal"));
			// 问答
			List<Map<String, Object>> questionList = webQuestionService.findList(param);
			mav.addObject("questionList", questionList);
			mav.addObject("questionCount", param.get("recordsTotal"));

			//收藏列表
			List<CollectionItem> collectionList = webUserCollectionService.findAllCollectionList(param);
			mav.addObject("collectionList", collectionList);

			//收藏统计
			Long collectionCount = webUserCollectionService.findCollectionCount(param);
			mav.addObject("collectionCount", collectionCount);

			Long replyCount = webQuestionService.findRootReplyCount(param);
			param.put("adopt", 0);
			Long adoptCount = webQuestionService.findRootReplyCount(param);
			Long percent;
			if (replyCount != 0) {
				percent = adoptCount * 100 / replyCount;
			} else {
				percent = 0l;
			}
			mav.addObject("replyCount", replyCount);
			mav.addObject("percent", percent);

			mav.setViewName("web/user/user_home");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 跳转到达人申请主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "applyMaster")
	public ModelAndView goApplyMaster() {
		ModelAndView mav = new ModelAndView();
		try {
			WebUser user = getWebLoginUserObj();
			if (user == null) {
				goLogin(mav);
			} else {
				PageData pd = new PageData();
				pd.put("userId", user.getId());
				pd.put("state", "ADD");
				List<Map<String, Object>> cityList = webCitysService.findAllProvince();
				Map<String, Object> map = webUserMasterService.findMasterDetialByUserId(pd);
				if (map != null) {
					List<Map<String, Object>> areaList = webUserMasterService.findMasterArea(pd);
					mav.addObject("map", map);
					mav.addObject("areaList", areaList);
					mav.addObject("phone", user.getPhone());
					mav.addObject("mail", user.getEmail());
				}
				mav.addObject("cityList", cityList);
				mav.setViewName("web/user/apply_master");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询收藏深度游列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "depthCollectionList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData depthCollectionList(Long userId) {
		PageData pd = getApiPageData();
		try {
			// Long userId = getWebLoginUser();
			pd.put("userId", userId);
			List<Map<String, Object>> list = webUserCollectionService.findDepthCollectionList(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 获取收藏文章列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "strategyCollectionList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData strategyCollectionList(Long userId) {
		PageData pd = getApiPageData();
		try {
			// Long userId = getWebLoginUser();
			pd.put("userId", userId);
			Long type = pd.getLong("type");
			if (type == 7) {
				type = 2l;
			} else if (type == 8) {
				type = 1l;
			} else if (type == 9) {
				type = 3l;
			}
			pd.put("travelsType", type);
			List<Map<String, Object>> list = webUserCollectionService.findTravelsCollectionList(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 查询自己游记列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "travlesList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData travlesList(Long userId) {
		PageData pd = getApiPageData();
		try {
			Long loginUserId = getWebLoginUser();
			pd.put("personal", 0);
			pd.put("userId", userId);
			if (loginUserId != userId) {
				pd.put("examine_state", 1);
			}
			List<Map<String, Object>> list = webTravelsService.findStrategyList(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 获取问答列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "questionList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData questionList(Long userId) {
		PageData pd = getApiPageData();
		try {
			// Long userId = getWebLoginUser();
			pd.put("personal", 0);
			pd.put("userId", userId);
			List<Map<String, Object>> list = webQuestionService.findList(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 获取回答的问答列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "questionReplyList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData questionReplyList(Long userId) {
		PageData pd = getApiPageData();
		try {
			// Long userId = getWebLoginUser();
			pd.put("personal", 0);
			pd.put("userId", userId);
			List<Map<String, Object>> list = webQuestionService.findReplyListByUserId(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 获取吐槽列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "complaintList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData complaintList(Long userId) {
		PageData pd = getApiPageData();
		try {
			// Long userId = getWebLoginUser();
			pd.put("personal", 0);
			pd.put("userId", userId);
			List<Map<String, Object>> list = webComplaintService.findList(pd);
			pd.putStatus(XConst.SUCCESS);
			pd.put("list", list);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 个人资料
	 * 
	 * @return
	 */
	@RequestMapping(value = "info")
	public ModelAndView infoIndex() {
		ModelAndView mav = new ModelAndView("web/user/user_info");
		try {
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);

			List<AreaAll> areaList = areaAllService.findAreaByParentId(0l);
			mav.addObject("areaList", areaList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 账户设置
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/setting")
	public ModelAndView accountSettingIndex() {
		ModelAndView mav = new ModelAndView("web/user/user_account_setting");

		try {
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 设置邮箱和电话
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/settingSave")
	@ResponseBody
	public PageData settingSave() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			if ("phone".equals(param.getString("type"))) {
				String oldPhone = webUser.getString("phone");

				String oldPhoneCode = param.getString("oldPhoneCode");
				String newPhone = param.getString("newPhone");
				String newPhoneCode = param.getString("newPhoneCode");

				if (!HString.isEmpty(oldPhone)) {
					String oldCheck = checkCode(oldPhone, oldPhoneCode, param.getString("type"));
					if (!XConst.SUCCESS.equals(oldCheck)) {
						res.putStatus("old_" + oldCheck);
						return res;
					}
				}

				if (HString.isEmpty(newPhone)) {
					res.putStatus("newPhone_not_found");
					return res;
				}

				String newCheck = checkCode(newPhone, newPhoneCode, param.getString("type"));
				if (!XConst.SUCCESS.equals(newCheck)) {
					res.putStatus("new_" + newCheck);
					return res;
				}

				PageData updateParam = new PageData();
				updateParam.put("userId", user.getId());
				updateParam.put("phone", newPhone);

				if (userService.checkPhoneOrEmail(updateParam)) {
					res = userService.updateUserOfPhoneOrEmail(updateParam);
				} else {
					res.putStatus(XConst.EXISTS);
				}
			} else if ("email".equals(param.getString("type"))) {
				String email = param.getString("email");
				String emailCode = param.getString("modcode");

				String mailCheck = checkCode(email, emailCode, "email");
				if (!XConst.SUCCESS.equals(mailCheck)) {
					res.putStatus(mailCheck);
					return res;
				}

				PageData updateParam = new PageData();
				updateParam.put("userId", user.getId());
				updateParam.put("email", email);
				if (userService.checkPhoneOrEmail(updateParam)) {
					res = userService.updateUserOfPhoneOrEmail(updateParam);
					if (XConst.SUCCESS.equals(res.getString("status"))) {
						res.put("userId", user.getId());
						res.put("email", email);
						res.put("emailUrl",
								"http://mail." + email.substring(email.lastIndexOf("@") + 1, email.length()));

						String valPath = ConfigLoad.getStringValue("webapp.site");
						String content = "黔易游修改邮箱提示信息<br><br><a href='" + valPath + "pc/user/info?id=" + user.getId()
								+ "'>点击返回</a>";
						SimpleMailSender.sendEmail(email, "黔易游邮箱修改提示", content, "2");
					}
				} else {
					res.putStatus(XConst.EXISTS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	public String checkCode(String text, String code, String type) throws Exception {
		PageData opc = appHomeService.getCodeByPhone(text, type);
		if (ValidateHelper.isNullOrEmpty(opc)) {
			return "code_null";
		} else {
			if (opc.get("vcode").equals(code)) {
				Long tenMinute = (long) (10 * 60 * 1000);
				Long nowTime = System.currentTimeMillis();
				Long codeTime = TimeHelper.charConvertDate(opc.get("create_time").toString()).getTime();
				if (nowTime - codeTime > tenMinute) {
					return "code_time_out";
				} else {
					return XConst.SUCCESS;
				}
			} else {
				return "code_error";
			}
		}
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
	 * 检查邮件是否绑定
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/checkSetting")
	@ResponseBody
	public PageData checkSetting() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			String email = param.getString("email");
			String code = param.getString("code");
			String checkEmail = checkCode(email, code, "email");
			res.putStatus(checkEmail);
			return res;
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/sendMailSMS")
	@ResponseBody
	public PageData sendMailSMS() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			String email = param.getString("email");
			String checkSend = checkSendCode(email, "email");
			if (XConst.SUCCESS.equals(checkSend)) {
				String code = EncryptionUtil.md532Encryption(email + (new Date()).getTime());
				appHomeService.insertValidateCode(email, code, "email");
				String content = "您获取的邮箱验证码为：" + code;
				SimpleMailSender.sendEmail(email, "黔易游邮箱修改验证", content, "2");
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

	@Autowired
	private HomeService appHomeService;

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
			String checkSend = checkSendCode(phone, "phone");
			if (XConst.SUCCESS.equals(checkSend)) {
				String content = "您正在修改黔易游会员手机号，手机验证码为:" + vPhoneCode + " ,如果不是您自己操作，请检查自己的账户信息。";
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

	@Autowired
	private WebScoreService scoreService;

	/**
	 * 账户明细
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/detail")
	public ModelAndView accountDetail() {
		ModelAndView mav = new ModelAndView("web/user/user_account_detail");
		try {
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "account/detailList")
	@ResponseBody
	public PageData accountDetailList() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			param.put("userId", user.getId());
			Long pageNo = param.getLong("pageNo");
			Long total = scoreService.findScoreListCount(param);
			Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
			pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
			param.put("startLine", (pageNo - 1) * XConst.PAGE_SIZE);
			param.put("showLine", XConst.PAGE_SIZE);
			res = scoreService.findScoreList(param);
			res.putMessage(XConst.SUCCESS);
			res.putData("totalPage", totalPage);
			res.putData("pageNo", pageNo);
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
	@RequestMapping(value = "account/detailRule")
	public ModelAndView accountDetailRule() {
		ModelAndView mav = new ModelAndView("web/user/user_account_rule");
		try {
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);
			PageData ruleDetail = scoreService.findDetail();
			mav.addObject("ruleDetail", ruleDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@Autowired
	private MessageService messageService;

	/**
	 * 桃子规则
	 * 
	 * @return
	 */
	@RequestMapping(value = "message")
	public ModelAndView message() {
		ModelAndView mav = new ModelAndView("web/user/user_message");
		try {
			PageData param = super.getPageData();
			String type = param.getString("type");
			if ("notice".equals(type)) {
				mav = new ModelAndView("web/user/user_message_1");
			} else {
				type = "comment";
			}

			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);
			param.put("userId", user.getId());
			param.put("msgType", type);
			messageService.updateReadByType(param);
			super.getRequest().getSession().setAttribute(type, 0);
			PageData ruleDetail = scoreService.findDetail();
			mav.addObject("ruleDetail", ruleDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 通知消息
	 * 
	 * @return
	 */
	@RequestMapping(value = "message/notice")
	@ResponseBody
	public PageData notice() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = this.getApiPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			param.put("userId", user.getId());
			boolean isCheck = super.checkParam("comment", param, new String[] { "userId" }, new String[] { "用户id" });
			param.put("msgType", "notice");
			Long pageNo = param.getLong("pageNo");
			Long total = messageService.messageListCount(param);
			Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
			pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
			param.put("startLine", (pageNo - 1) * XConst.PAGE_SIZE);
			param.put("showLine", XConst.PAGE_SIZE);

			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res = messageService.messageList(param);
				res.putData("totalPage", totalPage);
				res.putData("pageNo", pageNo);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}

		return res;
	}

	/**
	 * 评论消息
	 * 
	 * @return
	 */
	@RequestMapping(value = "message/comment")
	@ResponseBody
	public PageData comment() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = this.getApiPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			param.put("userId", user.getId());
			boolean isCheck = super.checkParam("comment", param, new String[] { "userId" }, new String[] { "用户id" });
			param.put("msgType", "comment");
			Long pageNo = param.getLong("pageNo");
			Long total = messageService.messageListCount(param);
			Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
			pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
			param.put("startLine", (pageNo - 1) * XConst.PAGE_SIZE);
			param.put("showLine", XConst.PAGE_SIZE);
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res = messageService.messageList(param);
				res.putData("totalPage", totalPage);
				res.putData("pageNo", pageNo);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 删除消息
	 * 
	 * @return
	 */
	@RequestMapping(value = "delMsg")
	@ResponseBody
	public PageData delMsg() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			param.put("userId", user.getId());
			boolean isCheck = super.checkParam("delMsg", param, new String[] { "userId", "msgId" }, new String[] {
					"用户id", "消息id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res = messageService.delMessage(param);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交达人申请
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitMaster", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitMaster() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("userId", userId);
			Map<String, Object> DBMaster = webUserMasterService.findMasterDetialByUserId(pd);
			if (DBMaster != null) {
				webUserMasterService.updateMaster(pd);
			} else {
				webUserMasterService.applyMaster(pd);
			}
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	private final static String FILE_SAVE_PATH = "uploadFiles/uploadImgs/head";

	/**
	 * 
	 * @param request
	 * @return
	 */
	/*
	 * @RequestMapping(value = "uploadHead", produces = XConst.JSON_PRODUCES)
	 * 
	 * @ResponseBody public PageData uploadHead(HttpServletRequest request) {
	 * PageData res = new PageData(); res.putFlag(false);
	 * res.putMessage(XConst.FAIL); try { String fileType = null, fileName =
	 * null; File files = null; MultipartHttpServletRequest multipartRequest =
	 * (MultipartHttpServletRequest) request; MultipartFile file =
	 * multipartRequest.getFile("headImg"); if (file != null && file.getSize() >
	 * 0) { fileType = file.getOriginalFilename().toLowerCase(); res.put("name",
	 * fileType.substring(0, fileType.lastIndexOf("."))); fileType =
	 * fileType.substring(fileType.lastIndexOf(".")); fileName = FILE_SAVE_PATH
	 * + "/" + FileHelper.getTimeFileName() + fileType; files = new
	 * File(XConst.WEB_ROOT_PATH + fileName); File dir = files.getParentFile();
	 * if (!dir.isDirectory()) { dir.mkdirs(); }
	 * FileCopyUtils.copy(file.getBytes(), files); res.put("imgUrl", fileName);
	 * res.putStatus(XConst.SUCCESS); SystemSet set = (SystemSet)
	 * request.getSession().getAttribute(XConst.SESSION_SYSSET);
	 * set.getWebUser().setHeadImg(fileName);
	 * 
	 * PageData param = new PageData(); param.put("userId",
	 * set.getWebUser().getId()); param.put("headImg", fileName);
	 * userService.updateAppUser(param);
	 * request.getSession().setAttribute(XConst.SESSION_SYSSET, set); } } catch
	 * (Exception e) { res.putMessage(XConst.EXCEPTION); e.printStackTrace(); }
	 * return res; }
	 */

	@RequestMapping(value = "uploadHead")
	public void uploadHead(@RequestParam("img") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) {
		PageData reqData = super.getPageData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		try {
			String oldName = file.getOriginalFilename();
			String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath = request.getSession().getServletContext().getRealPath("") + "/" + FILE_SAVE_PATH;
			String fileName = sdf.format(new Date()) + suffix;
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);

			String url = FILE_SAVE_PATH + "/" + fileName;
			reqData.put("imgUrl", url);

			// 修改session里的头像
			SystemSet set = (SystemSet) request.getSession().getAttribute(XConst.SESSION_SYSSET);
			set.getWebUser().setHeadImg(url);
			request.getSession().setAttribute(XConst.SESSION_SYSSET, set);

			PageData param = new PageData();
			param.put("userId", set.getWebUser().getId());
			param.put("headImg", url);
			userService.updateAppUser(param);
			response.setContentType("text/plain");
			response.getWriter().print(reqData);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(value = "modPass")
	@ResponseBody
	public PageData modPass() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = super.getPageData();

			String password = param.getString("password");
			String newPassword = param.getString("newPassword");
			String rnewPassword = param.getString("rnewPassword");

			if (HString.isEmpty(password) || HString.isEmpty(newPassword) || HString.isEmpty(rnewPassword)) {
				res.putStatus(XConst.PARAM_ERR);
				return res;
			}
			Long userId = getWebLoginUser();
			if (!HString.isEmpty(userId)) {
				PageData login = userLoginService.getDetail(userId + "");
				String ecPass = EncryptionUtil.md532Encryption(password);
				if (ecPass.equals(login.getString("login_pwd"))) {
					if (newPassword.equals(rnewPassword)) {
						param.put("userId", userId);
						param.put("password", EncryptionUtil.md532Encryption(newPassword));
						boolean isUpdate = userLoginService.updatePassword(param);
						if (isUpdate) {
							res.putStatus(XConst.SUCCESS);
						}
					} else {
						res.putStatus("re_pass_err");
					}
				} else {
					res.putStatus(XConst.LOGIN_USER_PASS_ERR);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存用户个人资料
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveInfo")
	@ResponseBody
	public PageData saveInfo() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			param.put("id", getWebLoginUser());
			res = userService.updateWebUser(param);

			// 修改session里的昵称
			SystemSet set = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			set.getWebUser().setNickname(param.getString("nickname"));
			getRequest().getSession().setAttribute(XConst.SESSION_SYSSET, set);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询消息条数
	 * 
	 * @return
	 */
	@RequestMapping(value = "findUnread", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData findUnread() {
		PageData pd = new PageData();
		try {
			pd.put("userId", getWebLoginUser());
			PageData res = messageService.findUnreadLine(pd);

			@SuppressWarnings("unchecked")
			List<PageData> unread = (List<PageData>) res.getData().get("unread");
			pd.put("list", unread);
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
