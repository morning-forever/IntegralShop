package com.bm.webs.service.web.cart;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.HString;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 漫游商城-快旅包车Service
 * 
 * @author jiangl 2015年9月3日
 */
@Service
@Transactional(rollbackFor = Exception.class)
@SuppressWarnings("unchecked")
public class WebCarWrapService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 得到包车类型
	 * 
	 * @return
	 * @throws Exception
	 */

	public List<PageData> getWrapTypeList() throws Exception {
		return (List<PageData>) dao.findForList(
				"WebCarWrapMapper.getWrapTypeList", new PageData());
	}

	/**
	 * 得到车类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCarTypeList() throws Exception {
		return (List<PageData>) dao.findForList(
				"WebCarWrapMapper.getCarTypeList", new PageData());
	}

	/**
	 * 得到车品牌类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBrandTypeList() throws Exception {
		return (List<PageData>) dao.findForList(
				"WebCarWrapMapper.getBrandTypeList", new PageData());
	}

	public List<PageData> getCarWrapList(PageData param, int pageSize)
			throws Exception {
		param.put("limistStart", (Long.valueOf(param.getString("pageNo")) - 1)
				* pageSize);
		param.put("pageSize", pageSize);
		return (List<PageData>) dao.findForList(
				"WebCarWrapMapper.getCarWrapList", param);
	}

	public Long getCarWrapListTotal(PageData param) throws Exception {
		return (Long) dao.findForObject("WebCarWrapMapper.getCarWrapListTotal",
				param);
	}

	/**
	 * 根据id查询包车信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getCarWrapById(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebCarWrapMapper.getCarWrapById",
				param);
	}

	/**
	 * 新增包车信息
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertWrapInfo(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.insertWrapInfo", param);
	}

	/**
	 * 得到最新新增的包车信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public Long findLastWrapInfoId() throws Exception {
		return (Long) dao.findForObject("WebCarWrapMapper.findLastWrapInfoId",
				new PageData());
	}

	/**
	 * 新增包车路线
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertWrapRoute(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.insertWrapRoute", param);
	}
	
	/**
	 * 后台查询包车信息列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdminWrapList(PageData param) throws Exception {
		return (List<PageData>) dao.findForList(
				"WebCarWrapMapper.findAdminWrapList", param);
	}
	
	/**
	 * 后台查询包车信息数
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer findAdminWrapNum(PageData param) throws Exception {
		return (Integer) dao.findForObject("WebCarWrapMapper.findAdminWrapNum", param);
	}
	
	/**
	 * 上架和下架
	 * @param param
	 * @throws Exception
	 */
	public void updateCarShelves(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.updateCarShelves", param);
	}
	
	/**
	 * 删除
	 * @param param
	 * @throws Exception
	 */
	public void deleteCar(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.deleteCar", param);
	}
	
	/**
	 * 后台根据id查询车信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminCarWrapById(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebCarWrapMapper.findAdminCarWrapById", param);
	}

	/**
	 * 提交订单逻辑
	 * 
	 * @param param
	 * @param request
	 * @throws Exception
	 */
	public Long saveOrder(PageData param) throws Exception {
		// 新增包车信息表
		insertWrapInfo(param);
		// 新增包车路线表
		Long wrapInfoId = findLastWrapInfoId();
		String[] startAddrIds = param.getString("startAddrId").split(",");
		String[] endAddrIds = param.getString("endAddrId").split(",");
		String[] ranks = param.getString("rank").split(",");
		for (int i = 0; i < ranks.length; i++) {
			PageData pd2 = new PageData();
			pd2.put("wrapInfoId", wrapInfoId);
			pd2.put("startAddrId", HString.isEmpty(startAddrIds[i]) ? 0
					: startAddrIds[i]);
			pd2.put("endAddrId", endAddrIds[i]);
			pd2.put("rank", ranks[i]);
			insertWrapRoute(pd2);
		}
		// 新增订单表
		param.put("orderType", "carWrap");// 订单类型
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date())
				+ param.get("userId")
				+ String.format("%03d", new Random().nextInt(1000));
		param.put("orderCode", orderCode);// 订单编号
		param.put("isInvoice", HString.isEmpty(param.getString("title")) ? "1" : "0");// 如果发票抬头为空，则表示不需要发票
		dao.save("WebOrderMapper.insertOrderForm", param);
		// 新增订单条目表
		param.put("goodsId", wrapInfoId);
		dao.save("WebOrderMapper.insertOrderItem", param);
		// 新增订单条目使用人表
		param.put("personType", "adult");
		dao.save("WebOrderMapper.insertOrderItemPerson", param);
		// 新增发票
		if (!HString.isEmpty(param.getString("title"))) {
			dao.save("WebOrderMapper.insertOrderInvoice", param);
		}
		
		//修改车辆数
		PageData car = (PageData)dao.findForObject("WebCarMapper.queryById", param);
		int counts = car.getInt("counts") - param.getInt("goodsCount");//包车后，重新计算车辆数 
		param.put("counts", counts);
		dao.save("WebCarMapper.updateCar", param);
		
		//发送通知邮件
		SimpleMailSender.sendNoticeEmail(orderCode);
		
		return param.getLong("orderFormId");
	}
	
	/**
	 * 新增车的座位
	 * @param param
	 * @throws Exception
	 */
	public void insertSeat(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.insertSeat", param);
	}
	
	/**
	 * 更新车的座位
	 * @param param
	 * @throws Exception
	 */
	public void updateSeat(PageData param) throws Exception {
		dao.save("WebCarWrapMapper.updateSeat", param);
	}
	
	/**
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void saveCar(PageData param) throws Exception {
		PageData map = new PageData();
		param.put("carType", "wrap");
		param.put("isShelves", null == param.getString("isShelves")?"1":"0");
		String carId = param.getString("carId");
		//新增
		if(HString.isEmpty(carId)){
			//新增车辆基本信息(新增完后param会返回刚新增的carId)
			dao.save("WebCarMapper.insertCar", param);
			String carIdNew = param.getString("carId");
			//新增包车座位数
			map.put("carId", carIdNew);
			map.put("seating", param.getString("seating"));
			insertSeat(map);
			map.clear();
			
			//新增包车价格
			map.put("fromId", carIdNew);
			if(!HString.isEmpty(param.getString("dates")) && !HString.isEmpty(param.getString("prices"))){
				String [] dates = param.getString("dates").split(",");
				String [] prices = param.getString("prices").split(",");
				if(dates.length == prices.length){
					for (int i = 0; i < prices.length; i++) {
						map.put("date", new Date(Long.valueOf(dates[i])));
						map.put("price", prices[i]);
						dao.save("WebCarDatePriceMapper.saveDatePrice", map);
					}
				}
			}
			map.clear();
			
			//上传图片
			String url = param.getString("url");
			String[] urlArr=url.split(",");
			map.put("picFrom", "carWrap");
			map.put("picType", "banner");
			map.put("fromId", carIdNew);
			for (int i = 0; i < urlArr.length; i++) {//保存图片
				if(!"".equals(urlArr[i])){
					map.put("picUrl", urlArr[i]);
					dao.save("CommonUploadMapper.savePhotoUrl", map);
				}
			}
			map.clear();
		}
		//更新
		else{
			//更新车辆基本信息
			dao.save("WebCarMapper.updateCar", param);
			//更新包车座位数
			map.put("carId", carId);
			map.put("seating", param.getString("seating"));
			updateSeat(map);
			map.clear();
			
			//更新包车价格
			//先删除包车价格
			map.put("fromId", carId);
			dao.save("WebCarDatePriceMapper.deleteDatePrice", map);
			//然后新增包车价格
			if(!HString.isEmpty(param.getString("dates")) && !HString.isEmpty(param.getString("prices"))){
				String [] dates = param.getString("dates").split(",");
				String [] prices = param.getString("prices").split(",");
				if(dates.length == prices.length){
					for (int i = 0; i < prices.length; i++) {
						map.put("date", new Date(Long.valueOf(dates[i])));
						map.put("price", prices[i]);
						dao.save("WebCarDatePriceMapper.saveDatePrice", map);
					}
				}
			}
			map.clear();
			
			//更新图片
			//先删除已存在的图片
			map.put("from", "carWrap");
			map.put("type", "banner");
			map.put("fromId", carId);
			dao.save("CommonUploadMapper.delPics", map);
			//保存新上传的图片
			map.put("picFrom", "carWrap");
			map.put("picType", "banner");
			String url = param.getString("url");
			String[] urlArr=url.split(",");
			for (int i = 0; i < urlArr.length; i++) {//保存图片
				if(!"".equals(urlArr[i])){
					map.put("picUrl", urlArr[i]);
					dao.save("CommonUploadMapper.savePhotoUrl", map);
				}
			}
			map.clear();
		}
	}
	
}
