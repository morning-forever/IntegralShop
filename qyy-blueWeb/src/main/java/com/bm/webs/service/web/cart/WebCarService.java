package com.bm.webs.service.web.cart;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 车辆Service
 * 
 * @author jiangl
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 新增车辆基本信息
	 * @param param
	 * @throws Exception
	 */
	public void insertCar(PageData param) throws Exception {
		dao.save("WebCarMapper.insertCar", param);
	}
	
	/**
	 * 修改车辆基本信息
	 * @param param
	 * @throws Exception
	 */
	public void updateCar(PageData param) throws Exception {
		dao.save("WebCarMapper.updateCar", param);
	}

	/**
	 * 查询班车信息
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findCarBus(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (Map<String, Object>) dao.findForObject("WebCarMapper.findCarBus", map);
	}
	
	/**
	 * 查询拼车信息
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findCarPool(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (Map<String, Object>) dao.findForObject("WebCarMapper.findCarPool", map);
	}
	
}
