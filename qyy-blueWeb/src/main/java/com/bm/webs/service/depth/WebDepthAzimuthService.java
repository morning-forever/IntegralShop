package com.bm.webs.service.depth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 方位深度游-方位Service
 * 
 * @author jiangl
 * 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebDepthAzimuthService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<PageData> allList() throws Exception{
		return (List<PageData>)dao.findForList("WebDepthAzimuthMapper.allList", new PageData());
	}
	
	/**
	 * 获取方位列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("WebDepthAzimuthMapper.getAdminList", param);
		Integer total = (Integer) dao.findForObject("WebDepthAzimuthMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 根据id 获取方位
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("WebDepthAzimuthMapper.getById", id);
	}
	
	/**
	 * 获取方位总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("WebDepthAzimuthMapper.getAdminResultNum", page);
	}
	
	/**
	 * 修改方位
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("WebDepthAzimuthMapper.update", pd);
	}
	
	/**
	 * 删除方位
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		dao.delete("WebDepthAzimuthMapper.delete", id);
	}
	
	/**
	 * 新增方位
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("WebDepthAzimuthMapper.insert", pd);
	}
	
}
