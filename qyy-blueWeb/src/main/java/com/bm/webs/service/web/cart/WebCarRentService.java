package com.bm.webs.service.web.cart;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebCar;
import com.bm.webs.bean.WebCarRent;
import com.bm.webs.controller.system.web.car.AdminCarRentController;
import com.bm.webs.dao.DaoSupport;


/**
 * 租车service
 * 
 * @author 
 * <br>
 * 2015年9月17日
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebCarRentService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * 查询租车列表
	 * 
	 * @param pageNo 页数
	 * @param pageSize 页大小
	 * @param typeId 类型ID
	 * @param brandId 品牌ID
	 * @param serchPrice 查询价格
	 * @param getCityId 
	 * @param getStoreId 门户ID
	 * @param loseCityId
	 * @param loseStoreId 门户ID
	 * @param sort 排序规则
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarRentList(Long pageNo, int pageSize, String typeId, String brandId,
			Long serchPrice, Long getCityId, Long getStoreId, Long loseCityId, Long loseStoreId, String sort) throws Exception {
		PageData map=new PageData();
		map.put("limistStart", (pageNo-1)*pageSize);
		map.put("pageSize", pageSize);
		map.put("typeId", typeId);
		map.put("brandId", brandId);
		map.put("serchPrice", serchPrice);
		map.put("getCityId", getCityId);
		map.put("getStoreId", getStoreId);
		map.put("loseCityId", loseCityId);
		map.put("loseStoreId", loseStoreId);
		map.put("sort", sort);
		if(ValidateHelper.isNullOrEmpty(getStoreId)&&
				ValidateHelper.isNullOrEmpty(loseStoreId)){
			map.put("areaSerchFlag", false);
		}else{
			map.put("areaSerchFlag", true);
		}
		
		return (List<PageData>) dao.findForList("WebCarRentMapper.findCarRentList", map);
	}


	/**
	 * 
	 * 查询
	 * 
	 * @param pageNo 页数
	 * @param pageSize 页大小
	 * @param typeId 类型ID
	 * @param brandId 品牌ID
	 * @param serchPrice 查询价格
	 * @param getCityId 
	 * @param getStoreId 门户ID
	 * @param loseCityId
	 * @param loseStoreId 门户ID
	 * @return
	 * @throws Exception
	 */
	public Long finCarRentListTotal(Long pageNo, int pageSize, String typeId, String brandId, Long serchPrice,
			Long getCityId, Long getStoreId, Long loseCityId, Long loseStoreId) throws Exception {
		PageData map=new PageData();
		map.put("limistStart", (pageNo-1)*pageSize);
		map.put("pageSize", pageSize);
		map.put("typeId", typeId);
		map.put("brandId", brandId);
		map.put("serchPrice", serchPrice);
		map.put("getCityId", getCityId);
		map.put("getStoreId", getStoreId);
		map.put("loseCityId", loseCityId);
		map.put("loseStoreId", loseStoreId);
		if(ValidateHelper.isNullOrEmpty(getStoreId)&&
				ValidateHelper.isNullOrEmpty(loseStoreId)){
			map.put("areaSerchFlag", false);
		}else{
			map.put("areaSerchFlag", true);
		}
		
		return (Long) dao.findForObject("WebCarRentMapper.finCarRentListTotal", map);
	}


	/**
	 * 
	 * 查询租车详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public PageData findCarRentDetialById(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (PageData) dao.findForObject("WebCarRentMapper.findCarRentDetialById", map);
	}


	/**
	 * 
	 * 查询租车列表
	 * 后台显示
	 * 
	 * @param brandId
	 * @param sysId
	 * @param seating
	 * @param price
	 * @param map2 
	 * @return 
	 * @throws Exception 
	 */
	public List<PageData> findAdminRentList(Long brandId, Long sysId, Integer seating, Double price, PageData map) throws Exception {
		map.put("brandId", brandId);
		map.put("sysId", sysId);
		map.put("seating", seating);
		map.put("price", price);
		Long count=(Long) dao.findForObject("WebCarRentMapper.findAdminRentListCount", map);
		map.put("recordsTotal", count);
		map.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebCarRentMapper.findAdminRentList", map);
	}


	/**
	 * 
	 * 删除指定租车
	 * 
	 * @param ids
	 * @param type 
	 * @throws Exception 
	 */
	public void deletesCarRent(String ids, String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("type", type);
		dao.update("WebCarRentMapper.deletesCarRent", map);
	}

	/**
	 * 
	 * 改变租车上下架状态
	 * 
	 * @param ids
	 * @param type 
	 * @param status
	 * @throws Exception 
	 */
	public void changeStatus(String ids, Integer status, String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("status", status);
		map.put("type", type);
		dao.update("WebCarRentMapper.changeStatus", map);
	}


	/**
	 * 
	 * 保存租车
	 * 
	 * @param webCar 车基本对象
	 * @param webCarRent 租车对象
	 * @param url 租车图片URL
	 * @param prices 租车租金金额
	 * @param dates 租金对应时间
	 * @param store 
	 * @param carType 
	 * @throws Exception 
	 */
	public void insertCarRent(WebCar webCar, WebCarRent webCarRent, String url, String prices, String dates, String store, String carType) throws Exception {
		dao.save("WebCarRentMapper.saveCar", webCar);//保存车基本信息
		webCarRent.setCarId(webCar.getId());
		dao.save("WebCarRentMapper.saveCarRent", webCarRent);//保存租车信息
		String[] urlArr=url.split(",");
		PageData map=new PageData();
		map.put("picFrom", AdminCarRentController.PHOTO_FROM_TYPE);
		map.put("picType", "detial");
		map.put("fromId", webCar.getId());
		for (int i = 0; i < urlArr.length; i++) {//保存图片
			if(!"".equals(urlArr[i])){
				map.put("picUrl", urlArr[i]);
				dao.save("CommonUploadMapper.savePhotoUrl", map);
				map.remove("picUrl");
			}
		}
		map.clear();
		
		map.put("fromId", webCar.getId());
		String[] priceArr=prices.split(",");
		String[] dateArr=dates.split(",");
		for (int i = 0; i < dateArr.length; i++) {//保存每天价格
			map.put("price", priceArr[i]);
			map.put("date", new Date(Long.valueOf(dateArr[i])));
			dao.save("WebCarDatePriceMapper.saveDatePrice", map);
			map.remove("price");
			map.remove("date");
		}
		map.clear();
		
		String[] storeArr=store.split(",");
		map.put("rentId", webCarRent.getId());
		for (int i = 0; i < storeArr.length; i++) {//保存地址
			map.put("store", storeArr[i]);
			dao.save("WebCarAddrsMapper.insertRentAddrCt", map);
			map.remove("store");
		}
		map.clear();
		
		String[] carTypeArr=carType.split(",");
		map.put("carId", webCar.getId());
		for (int i = 0; i < carTypeArr.length; i++) {//保存类型信息
			map.put("carTypeId", carTypeArr[i]);
			dao.save("WebCarTypeMapper.insertTypeCt", map);
			map.remove("carTypeId");
		}
		map.clear();
	}


	/**
	 * 
	 * 查询租车信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public PageData findCarRentById(Long id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		return (PageData) dao.findForObject("WebCarRentMapper.findCarRentById", map);
	}


	/**
	 * 
	 * 更新租车
	 * 
	 * @param webCar 车基本对象
	 * @param webCarRent 租车对象
	 * @param url 租车图片URL
	 * @param prices 租车租金金额
	 * @param dates 租金对应时间
	 * @param store
	 * @param carType
	 * @throws Exception 
	 */
	public void updateCarRent(WebCar webCar, WebCarRent webCarRent, String url, String prices, String dates,
			String store, String carType) throws Exception {
		dao.update("WebCarRentMapper.updateWebCar", webCar);//更新车基础信息
		dao.update("WebCarRentMapper.updateWebCarRent", webCarRent);//更新租车信息
		
		String[] urlArr=url.split(",");//更新图片
		PageData map=new PageData();
		map.put("fromId", webCar.getId());
		map.put("picFrom", AdminCarRentController.PHOTO_FROM_TYPE);//两个方法命名不一样，参数添加2遍
		map.put("from", AdminCarRentController.PHOTO_FROM_TYPE);
		map.put("picType", "detial");
		map.put("type", "detial");
		dao.delete("CommonUploadMapper.delPics", map);//清空之前的图片
		for (int i = 0; i < urlArr.length; i++) {//保存图片
			if(!"".equals(urlArr[i])){
				map.put("picUrl", urlArr[i]);
				dao.save("CommonUploadMapper.savePhotoUrl", map);
				map.remove("picUrl");
			}
		}
		map.clear();
		
		map.put("fromId", webCar.getId());
		dao.delete("WebCarDatePriceMapper.deleteDatePrice", map);//清空之前的价格
		String[] priceArr=prices.split(",");
		String[] dateArr=dates.split(",");
		for (int i = 0; i < dateArr.length; i++) {//保存每天价格
			map.put("price", priceArr[i]);
			map.put("date", new Date(Long.valueOf(dateArr[i])));
			dao.save("WebCarDatePriceMapper.saveDatePrice", map);
			map.remove("price");
			map.remove("date");
		}
		map.clear();
		
		String[] storeArr=store.split(",");
		map.put("rentId", webCarRent.getId());
		dao.delete("WebCarAddrsMapper.deleteRentAddrCt", map);//清空之前的地址
		for (int i = 0; i < storeArr.length; i++) {//保存地址
			map.put("store", storeArr[i]);
			dao.save("WebCarAddrsMapper.insertRentAddrCt", map);
			map.remove("store");
		}
		map.clear();
		
		String[] carTypeArr=carType.split(",");
		map.put("carId", webCar.getId());
		dao.delete("WebCarTypeMapper.deleteTypeCt", map);//清空之前的类型信息
		for (int i = 0; i < carTypeArr.length; i++) {//保存类型信息
			map.put("carTypeId", carTypeArr[i]);
			dao.save("WebCarTypeMapper.insertTypeCt", map);
			map.remove("carTypeId");
		}
		map.clear();
		
	}


	


	
	
	
	
}
