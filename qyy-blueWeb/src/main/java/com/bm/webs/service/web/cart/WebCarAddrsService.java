package com.bm.webs.service.web.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 门户地址查询
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarAddrsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 根据类型查询门户所在城市ID
	 * 
	 * @param string
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findListByType(String type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findListByType", map);
	}

	/**
	 * 
	 * 根据市ID查询有门户的区ID
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCountyByCityId(Long id, String type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findCountyByCityId", map);
	}

	/**
	 * 
	 * 根据区ID查询区下所有的门户
	 * 
	 * @param id
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findStoreByCountyId(Long id, String type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findStoreByCountyId", map);
	}

	/**
	 * 
	 * 根据门户ID查询门户名字
	 * 
	 * @param getStoreId
	 * @return
	 * @throws Exception
	 */
	public String findSotreNameById(Long storeId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		return (String) dao.findForObject("WebCarAddrsMapper.findSotreNameById", map);
	}

	/**
	 * 
	 * 根据门户ID查询门户
	 * 
	 * @param getStoreId
	 * @return
	 * @throws Exception
	 */
	public PageData findSotreById(Long storeId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeId", storeId);
		return (PageData) dao.findForObject("WebCarAddrsMapper.findSotreById", map);
	}

	/**
	 * 
	 * 查询租车地址
	 * 
	 * @param objectOfValue
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findStoreByCarId(Long rentId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rentId", rentId);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findStoreByCarId", map);
	}

	/**
	 * 返回城市列表
	 * 
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdminCityList(String type) throws Exception {
		PageData res = new PageData();
		if (!HString.isEmpty(type))
			res.put("type", type);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findAdminCityList", res);
	}

	/**
	 * 根据城市id返回区域
	 * 
	 * @param cityId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdminCountyList(Long cityId) throws Exception {
		PageData res = new PageData();
		if (!HString.isEmpty(cityId))
			res.put("cityId", cityId);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findAdminCountyList", res);
	}

	/**
	 * 根据区域id返回具体门店
	 * 
	 * @param countyId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdminAddrList(Long countyId) throws Exception {
		PageData res = new PageData();
		if (!HString.isEmpty(countyId))
			res.put("countyId", countyId);
		return (List<PageData>) dao.findForList("WebCarAddrsMapper.findAdminAddrList", res);
	}

	/**
	 * 后台查找地址列表
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param addrType
	 * @return
	 * @throws Exception
	 */
	public PageData findAddrAdminList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebCarAddrsMapper.findAddrAdminListCount", param);
		param.put("data", dao.findForList("WebCarAddrsMapper.findAddrAdminList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 添加或更新地点信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean save(PageData param) throws Exception {
		Integer count = 0;
		if (HString.isEmpty(param.get("id"))) {
			if("carpool".equals(param.getString("addrType")))
				param.put("addrType", param.get("addrTypes"));
			
			count = (Integer) dao.save("WebCarAddrsMapper.insertCarAddrs", param);
		} else {
			count = (Integer) dao.save("WebCarAddrsMapper.updateCarAddrs", param);
		}
		return count > 0;
	}

	/**
	 * 根据id返回详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findAddrById(Long id) throws Exception {
		PageData res = new PageData();
		res.put("id", id);
		return (PageData) dao.findForObject("WebCarAddrsMapper.findAddrById", res);
	}

}
