package com.bm.webs.service.businessSystem;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchRestaurant;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户餐饮分类Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchRestaurantService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<MerchRestaurant> allList() throws Exception{
		return (List<MerchRestaurant>) dao.findForList("MerchRestaurantMapper.allList", new PageData());
		
	}
	
	/**
	 * 获取餐饮分类列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchRestaurantMapper.getAdminList", param);
		Integer total = (Integer) dao.findForObject("MerchRestaurantMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 根据id 获取餐饮分类
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchRestaurantMapper.getById", id);
	}
	
	/**
	 * 获取餐饮分类总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchRestaurantMapper.getAdminResultNum", page);
	}
	
	/**
	 * 修改餐饮分类
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("MerchRestaurantMapper.update", pd);
	}
	
	/**
	 * 删除餐饮分类
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		dao.delete("MerchRestaurantMapper.delete", id);
	}
	
	/**
	 * 新增餐饮分类
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("MerchRestaurantMapper.insert", pd);
	}
	
}
