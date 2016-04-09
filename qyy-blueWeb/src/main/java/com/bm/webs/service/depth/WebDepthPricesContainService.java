package com.bm.webs.service.depth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 主题深度游-价格包含Service
 * 
 * @author jiangl
 * 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebDepthPricesContainService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 查询价格包含列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPricesContainList(Long depthId) throws Exception{
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (List<PageData>)dao.findForList("WebDepthPricesContainMapper.findPricesContainList", param);
	}
	
}
