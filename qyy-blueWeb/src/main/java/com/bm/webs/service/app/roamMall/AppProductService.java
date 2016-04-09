package com.bm.webs.service.app.roamMall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * app漫游商城-商品信息Service
 * 
 * @author jiangl
 *         2015年9月3日
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class AppProductService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取景区列表
	 * @param param
	 * @return
	 * @throws Exception  
	 */
	public List<PageData> getScenicList(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getScenicList", param);
	}
	
	/**
	 * 获取酒店列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getHotelList(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getHotelList", param);
	}
	
	/**
	 * 获取餐饮列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCaterList(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getCaterList", param);
	}
	
	/**
	 * 获取装备列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getEquipList(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getEquipList", param);
	}
	
	/**
	 * 得到餐饮人数
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCaterMealList() throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getCaterMealList", new PageData());
	}
	
	/**
	 * 根据商户获取景区列表
	 * @param param
	 * @return
	 * @throws Exception  
	 */
	public List<PageData> getScenicByMerch(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getScenicByMerch", param);
	}
	
	/**
	 * 根据商户获取酒店列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getHotelByMerch(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getHotelByMerch", param);
	}
	
	/**
	 * 根据商户获取餐饮列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCaterByMerch(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getCaterByMerch", param);
	}
	
	/**
	 * 根据商户获取装备列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getEquipByMerch(PageData param) throws Exception{
		return (List<PageData>) dao.findForList("PCProductMapper.getEquipByMerch", param);
	}
	
}
