package com.bm.webs.service.web.cart;

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
 * 车型查询Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarTypeService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 
	 * 
	 * 
	 * @param string
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findCarTypeList(String typeType) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("typeType", typeType);
		return (List<PageData>) dao.findForList("WebCarTypeMapper.findCarTypeList", map);
	}

	/**
	 * 
	 * 查询指定车的类型ID，以逗号拼接返回一个字符串
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public String findCarTypeIdsById(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (String) dao.findForObject("WebCarTypeMapper.findCarTypeIdsById", map);
	}

	/**
	 * 
	 * 返回类型列表
	 * 后台查看
	 * 
	 * @param type
	 * @param typeName 
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findAdminTypeList(String type, String typeName, PageData map) throws Exception {
		map.put("type", type);
		map.put("typeName", typeName);
		Long count=(Long) dao.findForObject("WebCarTypeMapper.findAdminTypeListCount", map);
		map.put("recordsTotal", count);
		map.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebCarTypeMapper.findAdminTypeList", map);
	}

	
	/**
	 * 
	 * 添加类型
	 * 
	 * @param addTypeName
	 * @param typeType
	 * @throws Exception 
	 */
	public void insertType(String addTypeName, String typeType) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("addTypeName", addTypeName);
		map.put("typeType", typeType);
		dao.save("WebCarTypeMapper.insertType", map);
	}

	/**
	 * 
	 * 更新类型
	 * 
	 * @param addTypeName
	 * @param typeType
	 * @param id
	 * @throws Exception 
	 */
	public void updateType(String addTypeName, String typeType, Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("addTypeName", addTypeName);
		map.put("typeType", typeType);
		map.put("id", id);
		dao.update("WebCarTypeMapper.updateType", map);
	}

	/**
	 * 
	 * 删除类型
	 * 
	 * @param ids
	 * @throws Exception 
	 */
	public void deleteType(String ids) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		dao.update("WebCarTypeMapper.deleteType", map);
	}

}
