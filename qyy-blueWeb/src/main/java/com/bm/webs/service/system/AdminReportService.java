package com.bm.webs.service.system;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 举报管理Service
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class AdminReportService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 查询举报列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findList(PageData param) throws Exception {
		Integer total=(Integer) dao.findForObject("AdminReportMapper.findListCount", param);
		List<Map<String, Object>> list=(List<Map<String, Object>>) dao.findForList("AdminReportMapper.findList", param);
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 添加举报
	 * @param pd
	 * @throws Exception 
	 */
	public void insertReport(PageData pd) throws Exception {
		dao.save("AdminReportMapper.insertReport", pd);
	}

	/**
	 * 删除评论
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public PageData deleteReply(PageData param) throws Exception {
		PageData pd=new PageData();
		dao.update("AdminReportMapper.deleteReply", param);
		pd.putStatus(XConst.SUCCESS);
		return pd;
	}

}
