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
import com.bm.webs.service.web.forum.WebComplaintService;

/**
 * 
 * APP端吐槽专区Controller
 * 
 * @author Hham
 *
 */
@Controller(value = "appComplaintController")
@RequestMapping(value = "app/complaint")
public class ComplaintController extends BaseController {

	@Autowired
	private WebComplaintService webComplaintService;

	@Autowired
	private WebPraiseService webPraiseService;

	private static final String COMPLAINT_TABLE = "web_complaint_ment";

	/**
	 * 
	 * 查询吐槽List
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		try {
			String[] param = new String[] { "userId" };
			String[] tips = new String[] { "用户ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				Integer orderType = pd.getInt("orderType");
				String personal = pd.getString("personal");
				if (ValidateHelper.isNullOrEmpty(orderType)) {
					orderType = 0;
				}
				if (ValidateHelper.isNullOrEmpty(personal)) {
					pd.put("personal", 1);
				}
				List<Map<String, Object>> list = webComplaintService.findList(pd);
				boolean emptyFlag = false;
				if (list.size() == 0) {
					emptyFlag = true;
				}
				// result.put("emptyFlag", emptyFlag);
				// result.put("complaintList", list);
				// result.putStatus(XConst.SUCCESS);
				result.putData("emptyFlag", emptyFlag);
				result.putData("complaintList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putFlag(false);
			pd.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 查看吐槽详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "complaintDetial", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData complaintDetial() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "userId", "complaintId" };
			String[] tips = new String[] { "用户ID", "吐槽ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				Map<String, Object> map = webComplaintService.findComplaintDetial(pd);
				if (map != null) {
					result.putData("complaintvData", map);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putFlag(false);
					result.putMessage(XConst.NO_EXISTS);
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 查看吐槽详情回复List
	 * 
	 * @return
	 */
	@RequestMapping(value = "complaintDetialReplyList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData complaintDetialReplyList() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "pageNo", "complaintId", "userId" };
			String[] tips = new String[] { "页数", "吐槽ID", "用户ID" };
			boolean checkParam = checkParam("list", pd, param, tips);
			if (checkParam) {
				List<Map<String, Object>> list = webComplaintService.findReplyList(pd);
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
					secondaryList = webComplaintService.findSecondaryList(pd);
				} else {
					secondaryList = new ArrayList<Map<String, Object>>();
				}
				Map<String, Object> listMap = new HashMap<String, Object>();
				listMap.put("complaintReplylist", list);
				listMap.put("replySecondaryList", secondaryList);
				result.putData("listMap", listMap);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 添加吐槽
	 * 
	 * @return
	 */
	@RequestMapping(value = "addComplaint", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addComplaint() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "content", "userId" };
			String[] tips = new String[] { "内容", "用户ID" };
			boolean checkParam = checkParam("addComplaint", pd, param, tips);
			if (checkParam) {
				webComplaintService.addComplaint(pd);
				// pd.putStatus(XConst.SUCCESS);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			result.putFlag(false);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 新增吐槽回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "addComplaintReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addComplaintReply() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "content", "userId", "toUserId", "toComplaintId", "rootId" };
			String[] tips = new String[] { "内容", "用户ID", "被回复用户ID", "被回复消息ID", "一级回复ID" };
			boolean checkParam = checkParam("addComplaint", pd, param, tips);
			if (checkParam) {
				webComplaintService.addComplaintReply(pd);
				// pd.putStatus(XConst.SUCCESS);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 删除吐槽
	 * 
	 * @return
	 */
	@RequestMapping(value = "deleteComplaint", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteComplaint() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "complaintId", "userId" };
			String[] tips = new String[] { "吐槽ID", "用户ID" };
			boolean checkParam = checkParam("deleteComplaint", pd, param, tips);
			if (checkParam) {
				Long checkId = webComplaintService.checkDelete(pd);
				if (checkId != null) {
					webComplaintService.deleteComplaint(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putFlag(false);
					result.putMessage(XConst.ERROR);
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			result.putFlag(false);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 点赞吐槽回复
	 * 
	 * @return
	 */
	@RequestMapping(value = "praise", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseComplaintReply() {
		PageData pd = super.getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "replyId", "userId" };
			String[] tips = new String[] { "吐槽回复ID", "用户ID" };
			boolean checkParam = checkParam("deleteComplaint", pd, param, tips);
			if (checkParam) {
				pd.put("form_table", COMPLAINT_TABLE);
				Integer id = webPraiseService.findPraise(pd);
				if (id == null) {
					webPraiseService.insertComplaintPraise(pd);
					// pd.putStatus(XConst.SUCCESS);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
				} else {
					result.putMessage("你已点过赞");
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			result.putFlag(false);
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
			String[] tips = new String[] { "吐槽回复ID" };
			boolean checkParam = checkParam("allSecondaryList", pd, param, tips);
			if (checkParam) {
				if (ValidateHelper.isNullOrEmpty(pd.getString("pageNo"))) {
					pd.put("startLine", 0);
					pd.put("showLine", XConst.MAX_SECONDARY_NUMBER);
				}
				List<Map<String, Object>> list = webComplaintService.findAllSecondaryList(pd);
				result.putData("allSecondaryList", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.ERROR);
			result.putFlag(false);
			e.printStackTrace();
		}
		return result;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

	public static void main(String[] args) {

		int[] a = { 1, 2, 3, 4, 5, 6 };
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}

	}
}
