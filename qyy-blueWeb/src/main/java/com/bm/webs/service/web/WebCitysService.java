package com.bm.webs.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebCitysService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回所有的省
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findProvinceList() throws Exception {
		return (List<PageData>) dao.findForList("WebCitysMapper.findProvinceList", null);
	}

	/**
	 * 
	 * 返回城市
	 * 
	 * @param provinceId
	 * @param cityId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCitysList(Long provinceId, Long cityId) throws Exception {
		PageData param = new PageData();
		if (!HString.isEmpty(provinceId)) {
			param.put("provinceId", provinceId);
		}
		if (!HString.isEmpty(cityId)) {
			param.put("cityId", cityId);
		}
		return (List<PageData>) dao.findForList("WebCitysMapper.findCitysList", param);

	}

	/**
	 * 返回区列表 <br>
	 * 参数： <br>
	 * 分页 参数<br>
	 * provinceId 省id<br>
	 * cityId 市id<br>
	 * countyId 区id
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAllList(PageData param) throws Exception {
		List<PageData> data = (List<PageData>) dao.findForList("WebCitysMapper.findAllList", param);
		Integer total = (Integer) dao.findForObject("WebCitysMapper.pageListTotalCount", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 根据id返回一条数据
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebCitysMapper.getById", param);
	}

	/**
	 * 更新某条数的名字
	 * 
	 * @param name
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updateCitys(String name, Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("name", name);
		Integer count = (Integer) dao.update("WebCitysMapper.updateCitys", param);
		return count > 0;
	}

	/**
	 * 更新多个城市信息
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public boolean updateBatch(List<PageData> list) throws Exception {
		int i = 0;
		for (PageData param : list) {
			Integer count = (Integer) dao.update("WebCitysMapper.updateCitys", param);
			i += count;
		}
		if (i == list.size())
			return true;
		return false;
	}

	/**
	 * 插入数据
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean insertCitys(PageData param) throws Exception {
		Integer count = (Integer) dao.save("WebCitysMapper.insertCitys", param);
		return count > 0;
	}

	/**
	 * 
	 * 查询子级城市
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findChildCity(Long id) throws Exception {
		return (List<PageData>) dao.findForList("WebCitysMapper.findChildCity", id);
	}

	/**
	 * 检查是否存在
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean checkIsHave(PageData param) throws Exception {
		Integer count = (Integer) dao.findForObject("WebCitysMapper.checkIsHave", param);
		return count < 1;
	}

	/**
	 * 返回一条完整的省市区信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findAllObject(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebCitysMapper.findAllObject", param);
	}

	/**
	 * 检查是否存在
	 * 
	 * @param name
	 * @param ctype
	 * @param id
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public boolean checkEditIsHave(String name, String ctype, Long id, Long parentId) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("name", name);
		param.put("ctype", ctype);
		if (!HString.isEmpty(parentId))
			param.put("parentId", parentId);
		Integer count = (Integer) dao.findForObject("WebCitysMapper.checkEditIsHave", param);
		return count < 1;
	}

	/**
	 * 
	 * 根据区ID查询出父级城市和父级的父级城市ID
	 * 
	 * @param atAreaId
	 * @return
	 * @throws Exception
	 */
	public PageData findPGId(Long atAreaId) throws Exception {
		PageData map = new PageData();
		map.put("id", atAreaId);
		return (PageData) dao.findForObject("WebCitysMapper.findPGId", map);
	}

	/**
	 * 根据当前的父id和需要被选中的id来查询地址列表
	 * 
	 * @param parentId
	 * @param selectId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListByParentId(Long parentId, Long selectId) throws Exception {
		PageData map = new PageData();
		map.put("parentId", parentId);
		map.put("selectId", selectId);
		return (List<PageData>) dao.findForList("WebCitysMapper.getListByParentId", map);
	}

	/**
	 * 返回所有的id
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findAllId(Long id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		return (PageData) dao.findForObject("WebCitysMapper.findAllId", map);
	}

	/**
	 * 
	 * 根据区ID返回全地址名
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String getSpecificAddress(Long id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		return (String) dao.findForObject("WebCitysMapper.getSpecificAddress", map);
	}

	/**
	 * 根据类型返回数据
	 * 
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findListByType(String type) throws Exception {
		return (List<PageData>) dao.findForList("WebCitysMapper.findListByType", type);
	}

	/**
	 * 返回门店信息
	 * 
	 * @param countyId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findStoreList(Long countyId, String type) throws Exception {
		PageData map = new PageData();
		map.put("countyId", countyId);
		map.put("type", type);
		return (List<PageData>) dao.findForList("WebCitysMapper.findStoreList", map);
	}

	/**
	 * 根据城市id，获取区域列表
	 * 
	 * @param cityId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCountyByCityId(Long cityId) throws Exception {
		PageData map = new PageData();
		map.put("cityId", cityId);
		return (List<PageData>) dao.findForList("WebCitysMapper.findCountyByCityId", map);
	}

	/**
	 * 
	 * 查询酒店地址省List
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHotelAddrList() throws Exception {
		PageData map = new PageData();
		return (List<PageData>) dao.findForList("WebCitysMapper.findHotelAddrList", map);
	}

	/**
	 * 
	 * 
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHotelCityList(Long id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		return (List<PageData>) dao.findForList("WebCitysMapper.findHotelCityList", map);
	}

	/**
	 * 查询所有区级城市
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findAllCounty() throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebCitysMapper.findAllCounty", new HashMap<String, Object>());
	}

	/**
	 * 根据父级ID查询所有城市
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findAllCity(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebCitysMapper.findAllCity", pd);
	}

	/**
	 * 删除一个区域
	 * 
	 * @param param
	 *            （addrId）
	 * @return 0:成功 1:占用 2:失败
	 * @throws Exception
	 */
	public int delCitys(PageData param) throws Exception {
		// 1.深度游
		int count = (int) dao.findForObject("WebCitysMapper.checkDepthAddr", param);
		if (count > 0)
			return 1;
		count = (int) dao.findForObject("WebCitysMapper.checkDepthPoint", param);
		if (count > 0)
			return 1;
		// 2.互动
		count = (int) dao.findForObject("WebCitysMapper.checkTravels", param);
		if (count > 0)
			return 1;
		// 3.车
		count = (int) dao.findForObject("WebCitysMapper.checkCartAddr", param);
		if (count > 0)
			return 1;
		int num = (int) dao.delete("WebCitysMapper.delCitys", param);
		if (num > 0)
			return 0;
		return 2;
	}

	/**
	 * 查询所有省份
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findAllProvince() throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebCitysMapper.findAllProvince", new HashMap<String, Object>());
	}

	/**
	 * 修改省名字
	 * @param res
	 * @throws Exception 
	 */
	public void updateProvince(PageData pd) throws Exception {
		dao.update("WebCitysMapper.updateProvince", pd);
	}

}
