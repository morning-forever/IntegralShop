package com.bm.webs.service.roamMall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户景区目的地Service
 * 
 * @author jiangl
 * 2015.9.8
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchScenicDestService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取景区目的地列表 后台分页
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchScenicDestMapper.getAdminList", param);
		Integer total = (Integer) dao.findForObject("MerchScenicDestMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 根据区域来筛选目的地
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListByCityId(Long cityId) throws Exception{
		PageData param = new PageData();
		param.put("cityId", cityId);
		return (List<PageData>) dao.findForList("MerchScenicDestMapper.getListByCityId", param);
	}
	
	/**
	 * 根据id 获取景区目的地
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchScenicDestMapper.getById", id);
	}
	
	/**
	 * 获取景区目的地总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchScenicDestMapper.getAdminResultNum", page);
	}
	
	/**
	 * 修改景区目的地
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("MerchScenicDestMapper.update", pd);
	}
	
	/**
	 * 删除景区目的地
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		dao.delete("MerchScenicDestMapper.delete", id);
	}
	
	/**
	 * 新增景区目的地
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("MerchScenicDestMapper.insert", pd);
	}
	
	/**
	 * 得到商品购物券列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getCouponListByGoodsId(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchScenicDestMapper.getCouponList", param);
		Integer total = (Integer) dao.findForObject("MerchScenicDestMapper.getCouponNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
}
