package com.bm.webs.service.web.cart;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 车辆保险
 * 
 * @author jiangl<br>
 *         2015年9月21日
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class WebCarSafeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 根据类型查找保险
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findByType(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebCarSafeMapper.findByType", param);
	}
	
	/**
	 * 新增
	 * @param param
	 * @throws Exception
	 */
	public void insert(PageData param) throws Exception {
		dao.save("WebCarSafeMapper.insert", param);
	}
	
	/**
	 * 更新
	 * @param param
	 * @throws Exception
	 */
	public void update(PageData param) throws Exception {
		dao.save("WebCarSafeMapper.update", param);
	}

}
