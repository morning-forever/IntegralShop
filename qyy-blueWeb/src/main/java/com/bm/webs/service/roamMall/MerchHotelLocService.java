package com.bm.webs.service.roamMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户酒店位置Service
 * 
 * @author jiangl
 * 2015.9.28
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchHotelLocService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取酒店位置列表 后台分页
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminLocList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchHotelLocMapper.getAdminLocList", param);
		Integer total = (Integer) dao.findForObject("MerchHotelLocMapper.getAdminLocNum", param);
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
		return (List<PageData>) dao.findForList("MerchHotelLocMapper.getListByCityId", param);
	}
	
	/**
	 * 根据id 获取酒店位置
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getLocById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchHotelLocMapper.getLocById", id);
	}
	
	/**
	 * 获取酒店位置总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getAdminLocNum(PageData param) throws Exception {
		return (Integer) dao.findForObject("MerchHotelLocMapper.getAdminLocNum", param);
	}
	
	/**
	 * 修改酒店位置
	 * @param pageData
	 * @throws Exception
	 */
	public void updateLoc(PageData param) throws Exception {
		dao.update("MerchHotelLocMapper.updateLoc", param);
	}
	
	/**
	 * 删除酒店位置
	 * @param pageData
	 * @throws Exception
	 */
	public void deleteLoc(Long id) throws Exception {
		dao.delete("MerchHotelLocMapper.deleteLoc", id);
	}
	
	/**
	 * 新增酒店位置
	 * @param pageData
	 * @throws Exception
	 */
	public void insertLoc(PageData param) throws Exception {
		dao.save("MerchHotelLocMapper.insertLoc", param);
	}
	
	/**
	 * 获取酒店具体位置列表 后台分页
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminLocDetailList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchHotelLocMapper.getAdminLocDetailList", param);
		Integer total = (Integer) dao.findForObject("MerchHotelLocMapper.getAdminLocDetailNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 根据位置来筛选具体位置
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListByLocId(Long locId) throws Exception{
		PageData param = new PageData();
		param.put("locId", locId);
		return (List<PageData>) dao.findForList("MerchHotelLocMapper.getListByLocId", param);
	}
	
	/**
	 * 根据id 获取酒店具体位置
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getLocDetailById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchHotelLocMapper.getLocDetailById", id);
	}
	
	/**
	 * 获取酒店具体位置总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getAdminLocDetailNum(PageData param) throws Exception {
		return (Integer) dao.findForObject("MerchHotelLocMapper.getAdminLocDetailNum", param);
	}
	
	/**
	 * 修改酒店具体位置
	 * @param pageData
	 * @throws Exception
	 */
	public void updateLocDetail(PageData param) throws Exception {
		dao.update("MerchHotelLocMapper.updateLocDetail", param);
	}
	
	/**
	 * 新增酒店具体位置
	 * @param pageData
	 * @throws Exception
	 */
	public void insertLocDetail(PageData param) throws Exception {
		dao.save("MerchHotelLocMapper.insertLocDetail", param);
	}

	/**
	 * 
	 * 查询酒店地址
	 * 
	 * @param cityId
	 * @param parentId
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findLocation(Long cityId, Long parentId) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("parentId", parentId);
		return (List<PageData>) dao.findForList("MerchHotelLocMapper.findLocation", map);
	}

	/**
	 * 
	 * 保存酒店地址
	 * 
	 * @param map
	 * @throws Exception 
	 */
	public void saveLocCt(PageData map) throws Exception {
		dao.save("MerchHotelLocMapper.saveLocCt", map);
	}

	/**
	 * 
	 * 删除旧的酒店地址
	 * 
	 * @param map
	 * @throws Exception 
	 */
	public void removeOldLocCt(PageData map) throws Exception {
		dao.delete("MerchHotelLocMapper.removeOldLocCt", map);
	}

	public List<HashMap<String, Object>> findMerchHotelLocList(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("merchId", id);
		return (List<HashMap<String, Object>>) dao.findForList("MerchHotelLocMapper.findMerchHotelLocList", map);
	}
}
