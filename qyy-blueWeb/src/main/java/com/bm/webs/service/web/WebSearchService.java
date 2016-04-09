package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.Search;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * @author mike <br>
 *         2015年10月28日
 */
@Service
@Transactional
public class WebSearchService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 首页查找
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData searchOfHome(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<Search> list = (List<Search>) dao.findForList("WebSearchMapper.searchOfHome", param);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putFlag(true);
		}
		return res;
	}

	/**
	 * 根据不同的版块进入
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData searchByFromType(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		
		String fromType = param.getString("fromType");
		if("bbs".equals(fromType)){//1:精彩游记,2:达人攻略,3:玩伴招募
			fromType = "'question','travels1','travels2','travels3','complaint'";
			param.put("fromType", fromType);
		}else{
			param.put("fromType", "'"+fromType+"'");
		}
		
		List<Search> list = (List<Search>) dao.findForList("WebSearchMapper.searchByFromType", param);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putFlag(true);
		}
		return res;
	}
	
	@SuppressWarnings("unchecked")
	public PageData searchWebByFromType(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		
		String fromType = param.getString("fromType");
		if("home".equals(fromType)){
			param.put("fromType", "");
		}else if("bbs".equals(fromType)){//1:精彩游记,2:达人攻略,3:玩伴招募
			fromType = "'question','travels1','travels2','travels3','complaint'";
			param.put("fromType", fromType);
		}else{
			param.put("fromType", "'"+fromType+"'");
		}
		
		Long pageNo = param.getLong("pageNo");
		Long total = (Long) dao.findForObject("WebSearchMapper.searchByFromTypeCount", param);
		Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
		pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
		param.put("startLine", (pageNo - 1) * XConst.PAGE_SIZE);
		param.put("showLine", XConst.PAGE_SIZE);
		List<Search> list = (List<Search>) dao.findForList("WebSearchMapper.searchByFromType", param);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putData("thisPageSize", list.size());
			res.putData("totalPage", totalPage);
			res.putData("pageNo", pageNo);
			res.putFlag(true);
		}
		return res;
	}
	
	
	
	
	
	
}
