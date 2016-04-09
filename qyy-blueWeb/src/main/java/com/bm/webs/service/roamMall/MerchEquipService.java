package com.bm.webs.service.roamMall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.Page;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户装备分类Service
 * 
 * @author jiangl
 * 2015年8月31日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchEquipService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<PageData> allList() throws Exception{
		return (List<PageData>)dao.findForList("MerchEquipMapper.allList", new PageData());
	}
	
	/**
	 * 获取装备分类列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminEquipList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchEquipMapper.getAdminEquipList", param);
		Integer total = (Integer) dao.findForObject("MerchEquipMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 根据id 获取装备分类
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchEquipMapper.getById", id);
	}
	
	/**
	 * 获取装备分类总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchEquipMapper.getAdminResultNum", page);
	}
	
	/**
	 * 修改装备分类
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("MerchEquipMapper.update", pd);
	}
	
	/**
	 * 删除装备分类
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		dao.delete("MerchEquipMapper.delete", id);
	}
	
	/**
	 * 新增装备分类
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("MerchEquipMapper.insert", pd);
	}
	
}
