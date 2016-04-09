package com.bm.webs.service.roamMall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 漫游商城-商品信息Service
 * 
 * @author jiangl
 *         2015年9月3日
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class ProductService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取景区列表
	 * @return
	 * @throws Exception
	 */
	/*public List<MerchGoodsScenic> getScenicList(PageData page) throws Exception{
		return (List<MerchGoodsScenic>) dao.findForList("ProductMapper.getScenicList", page);
	}*/
	
	public PageData getAdminScenicList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("ProductMapper.getAdminScenicList", param);
		Integer total = (Integer) dao.findForObject("ProductMapper.getAdminScenicNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取景区总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getScenicNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("ProductMapper.getAdminScenicNum", page);
	}
	
	/**
	 * 获取酒店列表
	 * @return
	 * @throws Exception
	 */
	/*public List<MerchGoodsHotel> getHotelList(PageData page) throws Exception{
		return (List<MerchGoodsHotel>) dao.findForList("ProductMapper.getHotelList", page);
	}*/
	
	public PageData getAdminHotelList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("ProductMapper.getAdminHotelList", param);
		Integer total = (Integer) dao.findForObject("ProductMapper.getAdminHotelNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取酒店总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getHotelNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("ProductMapper.getAdminHotelNum", page);
	}
	
	/**
	 * 获取餐饮列表
	 * @return
	 * @throws Exception
	 */
	/*public List<MerchGoodsCater> getCaterList(PageData page) throws Exception{
		return (List<MerchGoodsCater>) dao.findForList("ProductMapper.getCaterList", page);
	}*/
	
	public PageData getAdminCaterList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("ProductMapper.getAdminCaterList", param);
		Integer total = (Integer) dao.findForObject("ProductMapper.getAdminCaterNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取餐饮总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getCaterNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("ProductMapper.getAdminCaterNum", page);
	}
	
	/**
	 * 获取装备列表
	 * @return
	 * @throws Exception
	 */
	/*public List<MerchGoodsEquip> getEquipList(PageData page) throws Exception{
		return (List<MerchGoodsEquip>) dao.findForList("ProductMapper.getEquipList", page);
	}*/
	
	public PageData getAdminEquipList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("ProductMapper.getAdminEquipList", param);
		Integer total = (Integer) dao.findForObject("ProductMapper.getAdminEquipNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取装备总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getEquipNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("ProductMapper.getEquipNum", page);
	}
	
	/**
	 * 根据id 获取装备
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getEquipById(Long goodsId) throws Exception{
		PageData param = new PageData();
		param.put("goodsId", goodsId);
		return (List<PageData>)dao.findForList("ProductMapper.getEquipById", param);
	}
	
}
