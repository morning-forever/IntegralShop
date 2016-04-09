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
 * 车辆品牌查询Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarBrandService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	public List<PageData> findCarBrandList(String brandType) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("brandType", brandType);
		return (List<PageData>) dao.findForList("WebCarBrandMapper.findforWebBrandList", map);
	}
	
	/**
	 * 
	 * 根据类型查询品牌
	 * 
	 * @param brandType
	 * @param brandName
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarBrandList(String brandType,String brandName) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("brandType", brandType);
		map.put("brandName", brandName);
		return (List<PageData>) dao.findForList("WebCarBrandMapper.findCarBrandList", map);
	}

	
	/**
	 * 
	 * 保存品牌
	 * 
	 * @param brandName
	 * @param brandType
	 * @throws Exception 
	 */
	public void insertBrand(String brandName, String brandType) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("brandName", brandName);
		map.put("brandType", brandType);
		dao.save("WebCarBrandMapper.insertBrand", map);
	}

	/**
	 * 验证添加品牌名唯一
	 * @param brandName
	 * @param brandType
	 * @return
	 * @throws Exception 
	 */
	public Long checkBrandNameOnly(String brandName, String brandType) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("brandName", brandName);
		map.put("brandType", brandType);
		return (Long) dao.findForObject("WebCarBrandMapper.checkBrandNameOnly", map);
	}
	
	
	
}
