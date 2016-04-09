package com.bm.webs.controller.app.forum;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebPraiseService;
import com.bm.webs.service.web.forum.WebQuestionService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * APP端问答Controller
 * 
 * @author Hham
 *
 */
@Controller(value = "appQuestionController")
@RequestMapping(value = "app/question")
public class QuestionController extends BaseController {

	@Autowired
	private WebQuestionService webQuestionService;

	@Autowired
	private WebPraiseService webPraiseService;

	@Autowired
	private WebUserService webUserService;

	private static final String QUESTION_TABLE = "web_question_answer";

	/**
	 * 请求提问列表List
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId" };
			String[] tips = new String[] { "用户ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				String orderType = pd.getString("orderType");
				String personal = pd.getString("personal");
				if (ValidateHelper.isNullOrEmpty(orderType)) {
					pd.put("orderType", 0);
				}
				if (ValidateHelper.isNullOrEmpty(personal)) {
					pd.put("personal", 1);
				}
				List<Map<String, Object>> list = webQuestionService.findList(pd);
				result.putData("questionList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查询提问详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "questionDetial", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData questionDetial() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "questionId" };
			String[] tips = new String[] { "用户ID", "提问ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				Map<String, Object> map = webQuestionService.findQuestionDetial(pd);
				if (map != null) {
					result.putData("question", map);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putFlag(false);
					result.putMessage(XConst.NO_EXISTS);
				}
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查询详情回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "questionReplyList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData questionReplyList() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "pageNo", "questionId", "userId" };
			String[] tips = new String[] { "页数", "问题ID", "用户ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				List<Map<String, Object>> list = webQuestionService.findReplyList(pd);
				StringBuffer idsBuffer = new StringBuffer();
				for (int i = 0; i < list.size(); i++) {
					if (!"0".equals(list.get(i).get("replyCount").toString())) {
						idsBuffer.append(list.get(i).get("id").toString());
						idsBuffer.append(",");
					}
				}
				List<Map<String, Object>> secondaryList = null;
				int lastIndex = idsBuffer.length() - 1;
				if (lastIndex > 0) {
					pd.put("ids", idsBuffer.substring(0, lastIndex));
					pd.put("groupTop", 2);
					secondaryList = webQuestionService.findSecondaryList(pd);
				} else {
					secondaryList = new ArrayList<Map<String, Object>>();
				}
				Map<String, Object> listMap = new HashMap<String, Object>();
				listMap.put("questionReplyList", list);
				listMap.put("secondaryReplyList", secondaryList);
				result.putData("listMap", listMap);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 新增提问
	 * 
	 * @return
	 */
	@RequestMapping(value = "addQuestion", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addQuestion() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "content", "userId" };
			String[] tips = new String[] { "问题内容", "用户ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				PageData map = webUserService.findById(pd.getLong("userId"));
				Long userId = pd.getLong("userId");
				String userNickname = map.getString("nickname");
				pd.put("userId", userId);
				pd.put("userNickname", userNickname);
				webQuestionService.insertQuestion(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 添加问题回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "addQuestionReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addQuestionReply() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "content", "toUserId", "replyUserId", "replyId", "rootId" };
			String[] tips = new String[] { "问题内容", "被回复用户ID", "用户ID", "回复消息ID", "一级回复ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				webQuestionService.insertQuestionReply(pd);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 删除提问
	 * 
	 * @return
	 */
	@RequestMapping(value = "deleteQeustion", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteQeustion() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "questionId" };
			String[] tips = new String[] { "用户ID", "提问ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				Integer id = webQuestionService.checkDeleteQuestion(pd);
				if (id == null) {
					result.putMessage("不能删除不是自己的提问");
				} else {
					webQuestionService.deleteQuestion(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 点赞提问回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "praise", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseQuestionReply() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "replyId", "userId" };
			String[] tips = new String[] { "问题回复ID", "用户ID" };
			boolean checkParam = checkParam("deleteComplaint", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", QUESTION_TABLE);
				Integer id = webPraiseService.findPraise(pd);
				if (id == null) {
					webPraiseService.insertQuestionPraise(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putMessage("你已点过赞");
				}
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 返回指定一级回复下的所有回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "allSecondaryList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData allSecondaryList() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "replyId" };
			String[] tips = new String[] { "提问回复ID" };
			boolean checkParam = checkParam("allSecondaryList", pd, param, tips);
			if (checkParam) {
				if (ValidateHelper.isNullOrEmpty(pd.getString("pageNo"))) {
					pd.put("startLine", 0);
					pd.put("showLine", XConst.MAX_SECONDARY_NUMBER);
				}
				List<Map<String, Object>> list = webQuestionService.findAllSecondaryList(pd);
				result.putData("allSecondaryList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 邀请用户查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "memberList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData findQuestionMemberList() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "nickName" };
			String[] tips = new String[] { "用户昵称" };
			boolean checkParam = checkParam("allSecondaryList", pd, param, tips);
			if (checkParam) {
				List<Map<String, Object>> list = webUserService.findUserListByUserNickName(pd);
				result.putData("questionMemberList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 采纳答案
	 * 
	 * @return
	 */
	@RequestMapping(value = "adopt", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData adopt() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "replyId" };
			String[] tips = new String[] { "回复ID" };
			boolean checkParam = checkParam("adopt", pd, param, tips);
			if (checkParam) {
				Integer adoptId = webQuestionService.checkAdopt(pd);
				if (adoptId != null) {
					if (1 == adoptId) {
						webQuestionService.updateAdoptReply(pd);
						result.putFlag(true);
						result.putMessage(XConst.SUCCESS);
					} else {
						result.putMessage(XConst.EXISTS);
					}
				} else {
					result.putMessage(XConst.ERROR);
				}
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
