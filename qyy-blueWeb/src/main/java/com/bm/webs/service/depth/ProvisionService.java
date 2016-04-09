package com.bm.webs.service.depth;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 购买须知Service
 * @author Hham
 *
 */
@Service
@Transactional
public class ProvisionService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 查询购买须知
	 * @return
	 * @throws Exception 
	 */
	public String findProvision() throws Exception {
		return  (String) dao.findForObject("PayProvisionMapper.find",new HashMap<String, Object>());
	}

	/**
	 * 保存购买须知
	 * @param param
	 * @throws Exception 
	 */
	public void saveProvision(PageData param) throws Exception {
		dao.update("PayProvisionMapper.save", param);
	}
	
	
	
}
