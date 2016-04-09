package com.bm.webs.service.app.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 首页相关service
 * 
 * @author liuw
 *
 *         create_time 2015年9月22日
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class HomeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 获取banner图片列表数据
	 * 
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBannerList(String type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		return (List<PageData>) dao.findForList("AppHomeMapper.getBannerList",
				map);
	}

	/**
	 * 获取四种用车规则列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarRuleList() throws Exception {
		return (List<PageData>) dao.findForList(
				"AppHomeMapper.findCarRuleList", null);
	}

	/**
	 * 根据城市ID查询区下所有的门户
	 * 
	 * @param cityId
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findStoreByCityId(Long cityId, String type)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("type", type);
		return (List<PageData>) dao.findForList(
				"AppHomeMapper.findStoreByCityId", map);
	}

	/**
	 * 查询租车车辆列表
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param getStoreId
	 * @param loseStoreId
	 * @param typeId
	 * @param brandId
	 * @param priceId
	 * @param priceSort
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarRentList(Long pageNo, Long pageSize,
			String getStoreId, String loseStoreId, String typeId,
			String brandId, String priceId, String priceSort) throws Exception {
		PageData map = new PageData();
		map.put("limistStart", (pageNo - 1) * pageSize);
		map.put("pageSize", pageSize);
		map.put("getStoreId", getStoreId);
		map.put("loseStoreId", loseStoreId);
		map.put("typeId", typeId);
		map.put("brandId", brandId);
		map.put("priceId", priceId);
		map.put("priceSort", priceSort);
		return (List<PageData>) dao.findForList(
				"AppHomeMapper.findCarRentList", map);
	}

	/**
	 * 获取包车列表
	 * 
	 * @param pageSize
	 * @param pageNo
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarWrapList(Long pageSize, Long pageNo,
			PageData pd) throws Exception {
		pd.put("startLine", (pageNo - 1) * pageSize);
		pd.put("showLine", pageSize);
		return (List<PageData>) dao.findForList(
				"AppHomeMapper.findCarWrapList", pd);
	}

	/**
	 * 获取班车列表
	 * 
	 * @param pageSize
	 * @param pageNo
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarBusList(Long pageSize, Long pageNo, PageData pd)
			throws Exception {
		pd.put("startLine", (pageNo - 1) * pageSize);
		pd.put("showLine", pageSize);
		return (List<PageData>) dao.findForList("AppHomeMapper.findCarBusList",
				pd);
	}

	/**
	 * 获取拼车列表
	 * 
	 * @param pageSize
	 * @param pageNo
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarCarpoolList(Long pageSize, Long pageNo,
			PageData pd) throws Exception {
		pd.put("startLine", (pageNo - 1) * pageSize);
		pd.put("showLine", pageSize);
		return (List<PageData>) dao.findForList(
				"AppHomeMapper.findCarCarpoolList", pd);
	}

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
	public List<PageData> findPriceList(Long id, String startTime,
			String endTime) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		return (List<PageData>) dao.findForList("AppHomeMapper.findPriceList",
				map);
	}

	public void insertValidateCode(String phone, String code, String type)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("code", code);
		map.put("type", type);
		dao.delete("AppHomeMapper.delsCode", map);
		dao.save("AppHomeMapper.insertValidateCode", map);
	}

	public PageData getCodeByPhone(String phone, String type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("type", type);
		PageData code = (PageData) dao.findForObject("AppHomeMapper.getCodeByPhone", map);
		return code;
	}

	public void insertWebLoginUser(String phone, String nickName,
			String password) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("nickName", nickName);
		map.put("password", password);
		dao.save("AppHomeMapper.insertWebUser", map);
	}

}
