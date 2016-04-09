package com.bm.webs.controller.app.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.MessageService;

/**
 * 个人中心 消息
 * 
 * @author mike <br>
 *         2015年10月19日
 */
@Controller(value = "appCenterMsgController")
@RequestMapping(value = "app/center/msg")
public class AppCenterMsgController extends BaseController {

	@Autowired
	private MessageService messageService;

	/**
	 * 通知消息
	 * 
	 * @return
	 */
	@RequestMapping(value = "notice")
	@ResponseBody
	public PageData notice() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			boolean isCheck = super.checkParam("notice", param, new String[] { "userId" }, new String[] { "用户id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				param.put("msgType", "notice");
				res = messageService.messageList(param);
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
	@RequestMapping(value = "comment")
	@ResponseBody
	public PageData comment() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			boolean isCheck = super.checkParam("comment", param, new String[] { "userId" }, new String[] { "用户id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				param.put("msgType", "comment");
				res = messageService.messageList(param);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 读取消息
	 * 
	 * @return
	 */
	@RequestMapping(value = "read")
	@ResponseBody
	public PageData read() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			boolean isCheck = super.checkParam("comment", param, new String[] { "userId", "id" }, new String[] { "用户id", "消息id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res = messageService.readMessage(param);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回未读条数
	 * 
	 * @return
	 */
	@RequestMapping(value = "unreadLine")
	@ResponseBody
	public PageData unreadLine() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			
			boolean isCheck = super.checkParam("comment", param, new String[] { "userId" }, new String[] { "用户id" });
			if(isCheck){
				res = messageService.findUnreadLine(param);
			}else{
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
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
			boolean isCheck = super.checkParam("delMsg", param, new String[] { "userId", "msgId" }, new String[] { "用户id", "消息id" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				if (!isTokenSuccess(param))// 检查token
					return param;
				res = messageService.delMessage(param);
				if (res.getBoolean("flag")) {
					// 更新token
					updateNewToken(param);
					String newToken = param.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				}
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
