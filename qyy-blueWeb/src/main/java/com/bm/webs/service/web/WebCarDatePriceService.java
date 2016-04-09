package com.bm.webs.service.web;

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
 * 车辆价格表Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarDatePriceService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 根据车辆ID，开始时间，结束时间查询价格List
	 * 
	 * @param id
	 * @param startTime
	 * @param endTime
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findPriceList(Long id, String startTime, String endTime) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		return (List<PageData>) dao.findForList("WebCarDatePriceMapper.findPriceList", map);
	}
	
	
	public List<PageData> findListByDate(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("WebCarDatePriceMapper.findListByDate", param);
	}

	/**
	 * 
	 * 查询价格列表，根据车ID
	 * (用于在编辑车页面初始化日历控件的List)
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findListById(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (List<PageData>) dao.findForList("WebCarDatePriceMapper.findListById", map);
	}

}
