package com.bm.webs.controller.web.forum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebPraiseService;
import com.bm.webs.service.web.forum.WebQuestionService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * Web端旅行问答Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping(value = "pc/question")
public class WebQuestionController extends BaseController {

	@Autowired
	private WebQuestionService webQuestionService;

	@Autowired
	private WebPraiseService webPraiseService;
	
	@Autowired
	private WebUserService webUserService;

	private static final String WEB_QUESTION_ANSWER = "web_question_answer";
	
	/**
	 * 青铜3级以上会员可以不用输验证码
	 */
	//青铜级
	private static final Integer P_LEVEL = 1;
	//3级
	private static final Integer LEVEL = 3;
	
	

	/**
	 * 
	 * 旅行问答主页
	 * 
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView QAndA() {
		ModelAndView mav = new ModelAndView();
//		if (getWebLoginUserObj() == null) {
//			goLogin(mav);
//		} else {
			mav.setViewName("web/interact/ask_list");
//		}
		return mav;
	}
	
	/**
	 * 查询List
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("userId", userId);
			List<Map<String, Object>> list = webQuestionService.findList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 跳转到提问List页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "newQuestion", produces = XConst.JSON_PRODUCES)
	public ModelAndView newQuestion(Long toUserId,String nickName) {
		ModelAndView mav = new ModelAndView();
		try {
			Long userId=getWebLoginUser();
			if (userId == null) {
				goLogin(mav);
			} else {
				Integer isCode = isCode(userId);
				mav.setViewName("web/interact/new_question");
				mav.addObject("type", "question");
				mav.addObject("isCode", isCode);
				mav.addObject("toUserId", toUserId);
				mav.addObject("nickName", nickName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	/**
	 * 提交问题
	 * 
	 * @return
	 */
	@RequestMapping(value = "submit", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submit() {
		PageData pd = getApiPageData();
		try {
			String code = pd.getString("code");
			String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");
			Integer isCode = isCode(getWebLoginUser());
			if ( isCode==0||(HString.isEmpty(code) &&vcode.equals(code.toLowerCase()))) {
				WebUser user=getWebLoginUserObj();
				Long userId = user.getId();
				String userNickname=user.getNickname();
				pd.put("userId", userId);
				pd.put("userNickname", userNickname);
				webQuestionService.insertQuestion(pd);
				pd.putStatus(XConst.SUCCESS);
			} else {
				pd.putStatus(XConst.V_CODE_ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查询用户
	 * @return
	 */
	@RequestMapping(value="search",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData search(){
		PageData pd=getApiPageData();
		try {
			List<Map<String, Object>> list=webUserService.findUserListByUserNickName(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}

	

	/**
	 * 查看详情
	 * 
	 * @param complaintId
	 * @return
	 */
	@RequestMapping(value = "detial_{questionId}", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView detial(@PathVariable(value = "questionId") Long questionId) {
		ModelAndView mav = new ModelAndView();
		try {
			Long userId = getWebLoginUser();
			PageData pd = new PageData();
//			if (userId == null) {
//				goLogin(mav);
//			} else {
				pd.put("userId", userId);
				pd.put("questionId", questionId);
				Map<String, Object> map = webQuestionService.findQuestionDetial(pd);
				mav.addObject("question", map);
				mav.addObject("userId", userId);
				mav.setViewName("web/interact/question_detial");
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 返回回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "replyList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData replyList() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("userId", userId);
			List<Map<String, Object>> list = webQuestionService.findReplyList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 返回二级回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "secondaryReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData secondaryReply() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("userId", userId);
			List<Map<String, Object>> list = webQuestionService.findAllSecondaryList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 添加回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "addReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReply() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("userId", userId);
			webQuestionService.insertQuestionReply(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 删除问题
	 * @return
	 */
	@RequestMapping(value="delete",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete(){
		PageData pd = getApiPageData();
		try {
			Long userId=getWebLoginUser();
			pd.put("userId", userId);
			Integer checkId=webQuestionService.checkDeleteQuestion(pd);
			if(checkId!=null){
				webQuestionService.deleteQuestion(pd);;
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 点赞回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "praiseReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseReply() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("form_table", WEB_QUESTION_ANSWER);
			pd.put("userId", userId);
			Integer id = webPraiseService.findPraise(pd);
			if (id == null) {
				webPraiseService.insertQuestionPraise(pd);
				pd.putStatus(XConst.SUCCESS);
			} else {
				pd.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 采纳回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "adopt", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData adopt() {
		PageData pd = getApiPageData();
		try {
			Long userId = getWebLoginUser();
			pd.put("form_table", WEB_QUESTION_ANSWER);
			pd.put("userId", userId);
			Integer adoptId = webQuestionService.checkAdopt(pd);
			if (adoptId != null) {
				if (1 == adoptId) {
					webQuestionService.updateAdoptReply(pd);
					pd.putStatus(XConst.SUCCESS);
				} else {
					pd.putStatus(XConst.EXISTS);
				}
			} else {
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 判断是否需要输入验证码
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	private Integer isCode(Long userId) throws Exception {
		PageData user=webUserService.findById(userId);
		Integer pLevel=user.getInt("p_level_name");
		Integer level=user.getInt("level_name");
		Integer isCode=1;
		if(pLevel<P_LEVEL){
			if(level>=LEVEL){
				isCode=0;
			}
		}else{
			isCode=0;
		}
		return isCode;
	}


	@Override
	protected String getMenuKey() {
		return null;
	}

}
