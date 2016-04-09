package com.bm.webs.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.AreaAll;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class AreaAllService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 根据父城市ID查询所有子城市
	 * 
	 * @param parnetId
	 * @return
	 * @throws Exception 
	 */
	public List<AreaAll> findAreaByParentId(Long parnetId) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("parnetId", parnetId);
		return (List<AreaAll>) dao.findForList("AreaAllMapper.findAreaByParentId", map);
	}
	
	
	
}
