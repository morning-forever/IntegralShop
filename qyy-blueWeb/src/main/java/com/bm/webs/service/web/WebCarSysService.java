package com.bm.webs.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebCarSys;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarSysService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 根据品牌ID查询车系
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public List<WebCarSys> findCarSysByBrandId(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (List<WebCarSys>) dao.findForList("WebCarSysMapper.findCarSysByBrandId", map);
	}
	
	/**
	 * 
	 * 根据品牌类型查询车系
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> getSysList(String type) throws Exception {
		return (List<PageData>) dao.findForList("WebCarSysMapper.getSysList", type);
	}

	/**
	 * 
	 * 根据品牌类型查询车系
	 * 
	 * @param brandType
	 * @param brandName
	 * @param map2 
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findCarSysByBrandType(String brandType, String brandName, PageData map) throws Exception {
		map.put("brandName", brandName);
		map.put("brandType", brandType);
		Long count=(Long) dao.findForObject("WebCarSysMapper.findCarSysBrandTypeCount", map);
		map.put("recordsTotal", count);
		map.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebCarSysMapper.findCarSysByBrandType", map);
	}

	/**
	 * 
	 * 保存车系
	 * 
	 * @param addBrandId
	 * @param addSysName
	 * @throws Exception 
	 */
	public void insertSys(String addBrandId, String addSysName) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("addBrandId", addBrandId);
		map.put("addSysName", addSysName);
		dao.save("WebCarSysMapper.insertSys", map);
	}

	/**
	 * 
	 * 删除车系
	 * 
	 * @param ids
	 * @throws Exception 
	 */
	public void deletesCarSys(String ids) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		dao.update("WebCarSysMapper.deletesCarSys", map);
	}

	public void updateSys(Long id, String addBrandId, String addSysName) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("addBrandId", addBrandId);
		map.put("addSysName", addSysName);
		dao.update("WebCarSysMapper.updateSys", map);
	}
	

}
