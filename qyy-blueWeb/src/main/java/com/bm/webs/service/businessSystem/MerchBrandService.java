package com.bm.webs.service.businessSystem;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchBrand;
import com.bm.webs.bean.MerchBrand;
import com.bm.webs.bean.MerchTheme;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户品牌Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchBrandService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<MerchBrand> allList() throws Exception{
		return (List<MerchBrand>) dao.findForList("MerchBrandMapper.allList", new PageData());
	}
	
	/**
	 * 获取商户品牌列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminBrandList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchBrandMapper.getAdminBrandList", param);
		Integer total = (Integer) dao.findForObject("MerchBrandMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取商户品牌总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchBrandMapper.getAdminResultNum", page);
	}
	
	/**
	 * 根据id 获取商户品牌
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchBrandMapper.getById", id);
	}
	
	/**
	 * 修改商户品牌
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("MerchBrandMapper.update", pd);
	}
	
	/**
	 * 删除商户品牌
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		dao.delete("MerchBrandMapper.delete", id);
	}
	
	/**
	 * 新增商户品牌
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("MerchBrandMapper.insert", pd);
	}
	
}
