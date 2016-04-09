package com.bm.webs.service.businessSystem;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.MerchGoodsCater;
import com.bm.webs.bean.MerchGoodsEquip;
import com.bm.webs.bean.MerchGoodsHotel;
import com.bm.webs.bean.MerchGoodsScenic;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 商户商品Service
 * 
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchGoodsService {

	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 
	 * 查询景区商品列表
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @param map 
	 * @param status2 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findScenicGoodsListByMerchId(Long id, String goodsId, String goodsName, String status, PageData map) throws Exception{
		map.put("merchId", id);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (List<PageData>) dao.findForList("MerchGoodsMapper.findGoodsListByMerchId", map);
	}
	
	/**
	 * 
	 * 查询景区商品条数
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @return
	 * @throws Exception 
	 */
	public Long findScenicGoodsNumber(Long id, String goodsId, String goodsName,
			String status) throws Exception {
		PageData map=new PageData();
		map.put("merchId", id);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (Long) dao.findForObject("MerchGoodsMapper.findGoodsNumber", map);
	}

	/**
	 * 
	 * 改变商品上下架状态
	 * 
	 * @param ids
	 * @throws Exception 
	 */
	public void changeGoodsStatus(String ids,Integer status) throws Exception {
		PageData map=new PageData();
		map.put("ids", ids);
		map.put("status", status);
		dao.update("MerchGoodsMapper.changeGoodsStatus", map);
	}

	
	/**
	 * 
	 * 删除商品
	 * 
	 * @param ids
	 * @throws Exception 
	 */
	public void deleteGoods(String ids) throws Exception {
		PageData map=new PageData();
		map.put("ids", ids);
		dao.delete("MerchGoodsMapper.deleteGoods", map);
	}

	/**
	 * 
	 * 保存商品
	 * 
	 * @param goods
	 * @return
	 * @throws Exception 
	 */
	public void saveGoods(MerchGoods goods) throws Exception {
		dao.save("MerchGoodsMapper.saveGoods", goods);
	}

	/**
	 * 
	 * 
	 * 
	 * @param goodsScenic
	 * @throws Exception 
	 */
	public void saveScenicGoods(MerchGoodsScenic goodsScenic) throws Exception {
		dao.save("MerchGoodsMapper.saveScenicGoods", goodsScenic);
	}

	/**
	 * 
	 * 查询基础类商品信息
	 * 
	 * @param id
	 * @param goodsType
	 * @return
	 * @throws Exception
	 */
	public MerchGoods findGoodsById(Long id, String goodsType) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		map.put("goodsType", goodsType);
		return (MerchGoods) dao.findForObject("MerchGoodsMapper.findGoodsById", map);
	}


	/**
	 * 
	 * 查询景区商品
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public MerchGoodsScenic findGoodsScenicById(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		return (MerchGoodsScenic) dao.findForObject("MerchGoodsMapper.findGoodsScenicById", map);
	}

	/**
	 * 
	 * 更新商品基础信息
	 * 
	 * @param goods
	 * @throws Exception 
	 */
	public void updateGoods(MerchGoods goods) throws Exception {
		dao.update("MerchGoodsMapper.updateGoods", goods);
	}

	/**
	 * 
	 * 更新景区商品信息
	 * 
	 * @param goodsScenic
	 * @throws Exception 
	 */
	public void updateScenicGoods(MerchGoodsScenic goodsScenic) throws Exception {
		dao.update("MerchGoodsMapper.updateScenicGoods", goodsScenic);
	}

	/**
	 * 
	 * 查询酒店商品信息
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param serchDate
	 * @param status
	 * @param map2 
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> finHotelGoodsByMerchId(Long merchId, String goodsId,
			String goodsName, String serchDate, String status, PageData map) throws Exception {
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("serchDate", serchDate);
		map.put("status", status);
		return (List<PageData>) dao.findForList("MerchGoodsMapper.findHotelGoodsByMerchId", map);
	}

	/**
	 * 
	 * 查询酒店商户数量
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @return
	 * @throws Exception 
	 */
	public Long findHotelGoodsNumber(Long merchId, String goodsId,
			String goodsName, String serchDate, String status) throws Exception {
		PageData map=new PageData();
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("serchDate", serchDate);
		map.put("status", status);
		return (Long) dao.findForObject("MerchGoodsMapper.findHotelGoodsNumber", map);
	}

	/**
	 * 
	 * 查询酒店商品
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public MerchGoodsHotel findGoodsHotelById(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		return (MerchGoodsHotel) dao.findForObject("MerchGoodsMapper.findGoodsHotelById", map);
	}

	

	/**
	 * 
	 * 保存酒店商品
	 * 
	 * @param goodsHotel
	 * @throws Exception 
	 */
	public void saveHotelGoods(MerchGoodsHotel goodsHotel) throws Exception {
		dao.save("MerchGoodsMapper.saveHotelGoods", goodsHotel);
	}

	/**
	 * 
	 * 更新酒店商品
	 * 
	 * @param goodsHotel
	 * @throws Exception 
	 */
	public void updateHotelGoods(MerchGoodsHotel goodsHotel) throws Exception {
		dao.update("MerchGoodsMapper.updateHotelGoods", goodsHotel);
	}

	/**
	 * 
	 * 查询餐饮商品
	 * 
	 * @param merchUser
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @param map 
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findCaterGoodsByMerchId(Long merchId, String goodsId, String goodsName,
			String status, PageData map) throws Exception {
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (List<PageData>) dao.findForList("MerchGoodsMapper.findCaterGoodsByMerchId", map);
	}

	/**
	 * 
	 * 查询餐饮商品数量
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @return
	 * @throws Exception 
	 */
	public Long findCaterGoodsNumber(Long merchId, String goodsId, String goodsName, String status) throws Exception {
		PageData map=new PageData();
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (Long) dao.findForObject("MerchGoodsMapper.findCaterGoodsNumber", map);
	}

	/**
	 * 
	 * 查询
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public MerchGoodsCater findGoodsCaterById(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		return (MerchGoodsCater) dao.findForObject("MerchGoodsMapper.findGoodsCaterById", map);
	}

	/**
	 * 
	 * 更新餐饮商品
	 * 
	 * @param goodsCater
	 * @throws Exception 
	 */
	public void updateCaterGoods(MerchGoodsCater goodsCater) throws Exception {
		dao.update("MerchGoodsMapper.updateCaterGoods", goodsCater);
	}

	/**
	 * 
	 * 保存餐饮商品
	 * 
	 * @param goodsCater
	 * @throws Exception 
	 */
	public void saveCaterGoods(MerchGoodsCater goodsCater) throws Exception {
		dao.save("MerchGoodsMapper.saveCaterGoods", goodsCater);
	}

	
	/**
	 * 
	 * 查询装备商品列表
	 * 
	 * @param id
	 * @param goodsId
	 * @param goodsName
	 * @param status
	 * @param map2 
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findEquipGoodsByMerchId(Long merchId, String goodsId, String goodsName, String status, PageData map) throws Exception {
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (List<PageData>) dao.findForList("MerchGoodsMapper.findEquipGoodsByMerchId", map);
	}

	public Long findEquipGoodsNumber(Long merchId, String goodsId, String goodsName, String status) throws Exception {
		PageData map=new PageData();
		map.put("merchId", merchId);
		map.put("goodsId", goodsId);
		map.put("goodsName", goodsName);
		map.put("status", status);
		return (Long) dao.findForObject("MerchGoodsMapper.findEquipGoodsNumber", map);
	}


	
	/**
	 * 
	 * 删除装备原本规格
	 * 
	 * @param id
	 * @throws Exception 
	 */
	public void deleteEquipGoods(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		dao.delete("MerchGoodsMapper.deleteEquipGoods", map);
	}

	/**
	 * 
	 * 添加装备规格
	 * 
	 * @param goodsEquip
	 * @throws Exception 
	 */
	public void saveEquipGoods(MerchGoodsEquip goodsEquip) throws Exception {
		dao.save("MerchGoodsMapper.saveEquipGoods", goodsEquip);
	}

	public PageData findGoodsEquipStrById(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		return (PageData) dao.findForObject("MerchGoodsMapper.findGoodsEquipStrById", map);
	}
	
	/**
	 * 根据商品id查询餐饮信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findMerchGoodsCaterById(Long id) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		return (PageData) dao.findForObject("MerchGoodsMapper.findMerchGoodsCaterById", map);
	}
}
