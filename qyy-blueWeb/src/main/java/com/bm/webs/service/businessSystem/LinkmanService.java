package com.bm.webs.service.businessSystem;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchLinkman;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
public class LinkmanService {

	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 更新联系人信息
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void updateLinkman(PageData map) throws Exception{
		dao.update("LinkmanMapper.updateLinkman", map);
	}

	/**
	 * 
	 * 查询联系人
	 * 
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public MerchLinkman findLinkMan(PageData map) throws Exception {
		return (MerchLinkman) dao.findForObject("LinkmanMapper.findLinkMan", map);
	}
	
	
}
