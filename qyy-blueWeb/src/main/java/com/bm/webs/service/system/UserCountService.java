package com.bm.webs.service.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 用户登录注册统计Service
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class UserCountService {

	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 添加登录统计
	 * @param userId
	 * @param type
	 * @throws Exception 
	 */
	public void insertLoginCount(Long userId, String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("type", type);
		Integer count=(Integer) dao.findForObject("UserCountMapper.checkInsertLogin", map);
		if(count==0){
			dao.save("UserCountMapper.insertLoginCount", map);
		}
	}
	
	/**
	 * 添加注册统计
	 * @param userId
	 * @param type
	 * @throws Exception 
	 */
	public void insertRegisterCount(Long userId, String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("type", type);
		Integer count=(Integer) dao.findForObject("UserCountMapper.checkInsertRegister", map);
		if(count==0){
			dao.save("UserCountMapper.insertRegisterCount", map);
		}
	}

	/**
	 * 查询登录统计
	 * @param pd
	 * @return 
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findLoginList(PageData pd) throws Exception {
		Integer total=(Integer) dao.findForObject("UserCountMapper.findLoginCountCount", pd);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("UserCountMapper.findLoginCountList", pd);
	}

	/**
	 * 查询注册统计
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findRegisterList(PageData pd) throws Exception {
		Integer total=(Integer) dao.findForObject("UserCountMapper.findRegisterCountCount", pd);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("UserCountMapper.findRegisterCountList", pd);
	}

	/**
	 * 查询在线统计
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findOnlineCount(PageData pd) throws Exception {
		Integer total=(Integer) dao.findForObject("UserCountMapper.findOnlineCountCount", pd);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("UserCountMapper.findOnlineCountList", pd);
	}
	
	
	
}
