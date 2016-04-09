package com.bm.webs.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
public class WebPraiseService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 点赞吐槽回复
	 * @param pd
	 * @throws Exception
	 */
	public void insertComplaintPraise(PageData pd) throws Exception {
		dao.update("WebComplaintMapper.praiseAdd", pd);
		dao.save("WebPraiseMapper.insertPraise", pd);
	}
	
	/**
	 * 点赞问题回复
	 * @param pd
	 * @throws Exception 
	 */
	public void insertQuestionPraise(PageData pd) throws Exception {
		dao.update("WebQuestionMapper.praiseAdd", pd);
		dao.save("WebPraiseMapper.insertPraise", pd);
	}

	/**
	 * 
	 * 查询是否点赞过
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer findPraise(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebPraiseMapper.findPraise", pd);
	}

	/**
	 * 点赞游记
	 * @param pd
	 * @throws Exception
	 */
	public void insertTravelsPraise(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.praiseAdd", pd);
		dao.save("WebPraiseMapper.insertPraise", pd);
	}

	/**
	 * 点赞游记评论
	 * @param pd
	 * @throws Exception
	 */
	public void insertTravelsReplyPraise(PageData pd) throws Exception {
		dao.update("WebTravelsMapper.replyPraiseAdd", pd);
		dao.save("WebPraiseMapper.insertPraise", pd);
	}

	/**
	 * 验证是否点赞
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkPraise(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebPraiseMapper.checkPraise", pd);
	}

	/**
	 * 添加一个点赞
	 * @param formTable 来自哪张表
	 * @param formId 点赞的表id
	 * @param userId 用户id
	 * @throws Exception
	 */
	public void addPraise(String formTable, Long formId, Long userId) throws Exception {
		PageData param = new PageData();
		param.put("form_table", formTable);
		param.put("replyId", formId);
		param.put("userId", userId);
		dao.save("WebPraiseMapper.insertPraise", param);
	}
	
	
	
}
