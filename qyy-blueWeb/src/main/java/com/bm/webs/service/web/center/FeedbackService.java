package com.bm.webs.service.web.center;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;


/**
 * 反馈信息操作类
 * @author mike
 * <br>
 * 2015年10月22日
 */
@Service
@Transactional
public class FeedbackService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 添加一个反馈信息
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean addFeedback(PageData param) throws Exception{
		int count = (int) dao.save("WebFeedbackMapper.addFeedback", param);
		return  count > 0;
	}
	
	/**
	 * 后台获取反馈列表
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData feedbackList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebFeedbackMapper.findFeedbackListCount", param);
		param.put("data", dao.findForList("WebFeedbackMapper.findFeedbackList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	
	public PageData feedbackDetail(Long backId) throws Exception{
		PageData param = new PageData();
		param.put("backId", backId);
		return (PageData) dao.findForObject("WebFeedbackMapper.feedbackDetail", param);
	}
	
	public boolean dels(Long backId) throws Exception{
		PageData param = new PageData();
		param.put("backId", backId);
		return (Integer)dao.delete("WebFeedbackMapper.dels", param) > 0;
	}
	
}
