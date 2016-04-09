package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 处理消息
 * 
 * @author mike <br>
 *         2015年10月26日
 */
@Service
@Transactional
public class MessageService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回消息的列表信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData messageList(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<PageData> list = (List<PageData>) dao.findForList("WebMessageMapper.messageList", param);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putData("thisPageSize", list.size());
			res.putFlag(true);
		}
		return res;
	}

	/**
	 * 返回消息条数
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Long messageListCount(PageData param) throws Exception {
		return (Long) dao.findForObject("WebMessageMapper.messageListCount", param);
	}

	/**
	 * 读取信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData readMessage(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		int count = (int) dao.findForObject("WebMessageMapper.checkRead", param);
		if (count > 0) {
			res.putMessage("readed");
		} else {
			count = (int) dao.update("WebMessageMapper.readMessage", param);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("readLine", count);
		}
		return res;
	}

	/**
	 * 
	 * 返回消息未读条数
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData findUnreadLine(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<PageData> data = (List<PageData>) dao.findForList("WebMessageMapper.findUnreadLine", param);
		if (!HString.isEmpty(data)) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("unread", data);
		}
		return res;
	}

	/**
	 * 删除消息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData delMessage(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		int count = (int) dao.delete("WebMessageMapper.delMessage", param);
		if (count > 0) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("delLine", count);
		}
		return res;
	}

	/**
	 * 根据类型标识已读
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData updateReadByType(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		int count = (int) dao.delete("WebMessageMapper.updateReadByType", param);
		if (count > 0) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("delLine", count);
		}
		return res;
	}

	/**
	 * 添加消息
	 * 
	 * @param param
	 *            (#{message},//消息内容
	 *            #{msgType},//消息一级类型
	 *            #{msgSource},//消息二级类型
	 *            #{fromUserId},//消息来源用户(若为系统则填0)
	 *            #{toUserId},//消息接收用户
	 *            #{biuldId},//消息跳转模块ID
	 *            #{biuldTitle},//消息标题
	 *            #{biuldImg}//消息图片
	 *            )
	 * @return
	 * @throws Exception
	 */
	public boolean addMessage(PageData param) throws Exception {
		int count = (int) dao.save("WebMessageMapper.addMessage", param);
		return count > 0;
	}

}
