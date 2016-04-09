package com.bm.webs.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 帮助中心管理
 * 
 * @author mike <br>
 *         2015年10月22日
 */
@Service
@Transactional
public class WebAdvertService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 用于后台管理list
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAdvertList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebAdvertMapper.findAdvertListCount", param);
		param.put("data", dao.findForList("WebAdvertMapper.findAdvertList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 
	 * 详情
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData detail(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebAdvertMapper.detail", param);
	}

	/**
	 * 添加帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean addAdvert(PageData param) throws Exception {
		Integer count = (Integer) dao.save("WebAdvertMapper.addAdvert", param);
		return count > 0;
	}

	/**
	 * 更新帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateAdvert(PageData param) throws Exception {
		Integer count = (Integer) dao.update("WebAdvertMapper.updateAdvert", param);
		return count > 0;
	}

	/**
	 * 删除帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean delAdvert(PageData param) throws Exception {
		Integer count = (Integer) dao.findForObject("WebAdvertMapper.checkIsUsed", param);
		if(count <= 0){
			count = (Integer) dao.delete("WebAdvertMapper.delAdvert", param);
			return true;
		}
		return false;
	}

}
