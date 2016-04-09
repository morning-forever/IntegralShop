package com.bm.webs.service.roamMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户价格筛选Service
 * 
 * @author jiangl
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebPriceSearchService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取价格筛选列表 后台分页
	 * @return
	 * @throws Exception
	 */
	public PageData getListPage(PageData param) throws Exception{
		List<WebPriceSearch> data =  (List<WebPriceSearch>) dao.findForList("WebPriceSearchMapper.getListPage", param);
		Integer total = (Integer) dao.findForObject("WebPriceSearchMapper.getResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 得到价格列表 前台展示
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<WebPriceSearch> getList(String searchType) throws Exception{
		PageData param = new PageData();
		param.put("searchType", searchType);
		return  (List<WebPriceSearch>) dao.findForList("WebPriceSearchMapper.getList", param);
	}
	
	/**
	 * 根据id 获取价格筛选
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public WebPriceSearch getById(Long id) throws Exception{
		return (WebPriceSearch)dao.findForObject("WebPriceSearchMapper.getById", id);
	}
	
	/**
	 * 获取价格筛选总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("WebPriceSearchMapper.getResultNum", page);
	}
	
	/**
	 * 修改价格筛选
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("WebPriceSearchMapper.update", pd);
	}
	
	/**
	 * 删除价格筛选
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(String ids) throws Exception {
		PageData param = new PageData();
		param.put("ids", ids);
		dao.delete("WebPriceSearchMapper.delete", param);
	}
	
	/**
	 * 新增价格筛选
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("WebPriceSearchMapper.insert", pd);
	}

	/**
	 * 
	 * 根据类型查找价格list
	 * 
	 * @param string
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findListByType(String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", type);
		return (List<PageData>) dao.findForList("WebPriceSearchMapper.findListByType", map);
	}
	
}
