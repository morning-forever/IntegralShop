package com.bm.webs.service.web.cart;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.OrderNoUtil;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 拼车
 * 
 * 
 * @author mike <br>
 *         2015年9月11日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebCarCarpoolService {

	public static final int maxSeat = 56;
	public static final int minSeat = 6;

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData pageList(Long pageNo, Long fromAddrId, Long toAddrId, String startTime, String startTimeOrder) throws Exception {
		PageData params = new PageData();
		if (!HString.isEmpty(fromAddrId))
			params.put("fromAddrId", fromAddrId);
		if (!HString.isEmpty(toAddrId))
			params.put("toAddrId", toAddrId);
		if (!HString.isEmpty(startTime))
			params.put("startTime", startTime);
		if (!HString.isEmpty(startTimeOrder))
			params.put("startTimeOrder", startTimeOrder);

		Long total = (Long) dao.findForObject("WebCarCarpoolMapper.pageListCount", params);
		Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
		pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
		params.put("limistStart", (pageNo - 1) * XConst.PAGE_SIZE);
		params.put("pageSize", XConst.PAGE_SIZE);

		PageData res = new PageData(true);
		List<PageData> list = (List<PageData>) dao.findForList("WebCarCarpoolMapper.pageList", params);
		if (!HString.isEmpty(list)) {
//			res.putStatus(XConst.SUCCESS);
			res.putData("list", list);
			res.putData("thisPageSize", list.size());
			res.putData("totalPage", totalPage);
			res.putData("pageNo", pageNo);
		}
		return res;
	}

	public PageData pageList(Long pageNo, Long showLine, Long fromAddrId, Long toAddrId, String startTime, String startTimeOrder) throws Exception {
		PageData params = new PageData();
		if (!HString.isEmpty(fromAddrId))
			params.put("fromAddrId", fromAddrId);
		if (!HString.isEmpty(toAddrId))
			params.put("toAddrId", toAddrId);
		if (!HString.isEmpty(startTime))
			params.put("startTime", startTime);
		if (!HString.isEmpty(startTimeOrder))
			params.put("startTimeOrder", startTimeOrder);

		Long total = (Long) dao.findForObject("WebCarCarpoolMapper.pageListCount", params);
		Long totalPage = total % showLine == 0 ? total / showLine : total / showLine + 1;
		pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
		params.put("limistStart", (pageNo - 1) * showLine);
		params.put("pageSize", showLine);

		PageData res = new PageData(true);
		List<PageData> list = (List<PageData>) dao.findForList("WebCarCarpoolMapper.pageList", params);
		if (!HString.isEmpty(list)) {
//			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putData("thisPageSize", list.size());
			res.putData("totalPage", totalPage);
			res.putData("pageNo", pageNo);
		}
		return res;
	}

	/**
	 * 查询
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData detail(Long id) throws Exception {
		PageData mdata = new PageData();
		mdata.put("id", id);
		PageData res = (PageData) dao.findForObject("WebCarCarpoolMapper.carpoolDetail", mdata);
		if (!HString.isEmpty(res)) {
			mdata.clear();
			mdata.put("fromAddrId", res.get("startAddrId"));
			mdata.put("toAddrId", res.get("endAddrId"));
			PageData minMax = (PageData) dao.findForObject("WebCarCarpoolPriceMapper.findMaxMin", null);
			Integer mileage = (Integer) dao.findForObject("findMileage", mdata);
			Double maxPrice = minMax.getDouble("maxPrice");
			Double totalPrice = mileage * maxPrice;
			res.put("totalPrice", totalPrice);
		}
		return res;
	}

	/**
	 * 发起一个拼车
	 * 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public PageData insert(PageData params) throws Exception {
		PageData res = new PageData();
		int isRes = 1;
		// 添加拼车并添加订单
		Long poolId = params.getLong("id");
		String orderNo= OrderNoUtil.getOrderNo();
		if (HString.isEmpty(poolId)) { // 发起拼车
			// 计算最高最低价
			// 最高单价
			PageData minMax = (PageData) dao.findForObject("WebCarCarpoolPriceMapper.findMaxMin", null);
			// 获取里程（公里数）
			PageData mdata = new PageData();
			mdata.put("fromAddrId", params.get("startAddrId"));
			mdata.put("toAddrId", params.get("endAddrsId"));
			Integer mileage = (Integer) dao.findForObject("findMileage", mdata);
			Double maxPrice = Double.valueOf(minMax.get("maxPrice").toString());
			Double pMinPrice = new BigDecimal(mileage * maxPrice / maxSeat).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			Double pMaxPrice = new BigDecimal(mileage * maxPrice / minSeat).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			params.put("maxPrice", pMaxPrice);
			params.put("minPrice", pMinPrice);

			dao.save("WebCarCarpoolMapper.addCarpool", params);
			// 添加订单
			// (NOW(), #{orderType}, #{orderCode}, #{payType}, NOW(), 'WAITPAY', #{isInvoice}, 0, #{userId}, 0)
			PageData orderData = new PageData();
			orderData.put("orderType", "carpool");
			orderData.put("orderCode", orderNo);
			orderData.put("payType", "alipay");
			orderData.put("isInvoice", 0);
			orderData.put("userId", params.getLong("userId"));
			dao.save("WebOrderMapper.insertOrderForm", orderData);
			// 插入条目
			// (NOW(),NOW(), #{goodsId}, #{goodsCount}, #{realPrice}, #{isSafe}, #{safePrice}, #{orderFormId})
			Long orderFormId = orderData.getLong("orderFormId");
			poolId = params.getLong("insertPK");
			PageData itemData = new PageData();
			itemData.put("goodsId", poolId);
			itemData.put("goodsCount", 1);
			itemData.put("realPrice", params.getDouble("maxPrice"));
			itemData.put("isSafe", 1);
			itemData.put("safePrice", 0);
			itemData.put("orderFormId", orderFormId);
			dao.save("WebOrderMapper.insertOrderItem", itemData);
			// 插入人员信息
			// (NOW(), #{orderItemId}, #{personName}, #{personType}, #{cardNo}, #{cardType}, #{personPhone},${bankName},${bankCard})
			PageData personData = new PageData();
			personData.put("orderItemId", itemData.getLong("orderItemId"));
			personData.put("personName", params.get("publishName"));
			personData.put("personType", "adult");
			personData.put("cardNo", params.get("publishCard"));
			personData.put("cardType", params.get("publishCardType"));
			personData.put("personPhone", params.get("publishPhone"));
			personData.put("bankName", params.get("bankName"));
			personData.put("bankCard", params.get("bankCard"));
			dao.save("WebOrderMapper.insertOrderItemPerson", personData);
			// this.updatePoolDss(poolId, 1);
			res.putData("orderId", orderFormId);
			isRes = 0;
		} else {// 拼车订单
			PageData carPool = this.detail(poolId);
			if (!HString.isEmpty(carPool)) {
				int poolDss = carPool.getInt("poolDss");
				int goodsCount = params.getInt("goodsCount");
				int totalCount = poolDss + goodsCount;
				int count = (int) dao.update("WebCarCarpoolMapper.getIsTimeout", params);
				if (count == 1) {
					isRes = 4; // 当前时间不允许拼车
				} else if (totalCount <= 56) {
					// 添加基础订单信息
					PageData orderData = new PageData();
					orderData.put("orderType", "carpool");
					orderData.put("orderCode", orderNo);
					orderData.put("payType", "alipay");
					orderData.put("isInvoice", HString.isEmpty(params.get("isInvoice")) ? 1 : params.get("isInvoice"));
					orderData.put("userId", params.getLong("userId"));
					dao.save("WebOrderMapper.insertOrderForm", orderData);

					// 订单条目
					PageData itemData = new PageData();
					itemData.put("goodsId", poolId);
					itemData.put("goodsCount", params.get("goodsCount"));
					itemData.put("realPrice", params.get("realPrice"));
					String isSafe = params.getString("isSafe");
					if ("0".equals(isSafe)) {// 是否有保险
						itemData.put("isSafe", 0);
						itemData.put("safePrice", params.get("safePrice"));
					} else {
						itemData.put("isSafe", 1);
						itemData.put("safePrice", 0);
					}

					itemData.put("orderFormId", orderData.getLong("orderFormId"));
					dao.save("WebOrderMapper.insertOrderItem", itemData);

					// 条目人员信息
					PageData personData = new PageData();
					JSONObject json = JSONObject.parseObject(params.getString("param"));
					JSONArray jsonArray = json.getJSONArray("data");
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject jsonObject = jsonArray.getJSONObject(i);
						personData.clear();
						personData.put("orderItemId", itemData.getLong("orderItemId"));
						personData.put("personName", jsonObject.get("personName"));
						personData.put("personType", jsonObject.get("personType"));
						personData.put("cardNo", jsonObject.get("cardNo"));
						personData.put("cardType", jsonObject.get("cardType"));
						personData.put("personPhone", jsonObject.get("personPhone"));
						if (i == 0) {// 保存第一个人的信息为退款人的信息
							personData.put("bankName", params.get("bankName"));
							personData.put("bankCard", params.get("bankCard"));
						}
						dao.save("WebOrderMapper.insertOrderItemPerson", personData);
					}
					// 发票信息
					String isInvoice = params.getString("isInvoice");
					if ("0".equals(isInvoice)) {
						// (NOW(), #{title}, #{receiver}, #{phone}, #{addrId}, #{addrDetail}, #{postCode}, #{orderFormId})
						PageData invoiceData = new PageData();
						invoiceData.put("title", params.get("title"));
						invoiceData.put("receiver", params.get("receiver"));
						invoiceData.put("phone", params.get("phone"));
						invoiceData.put("addrId", params.get("addrId"));
						invoiceData.put("addrDetail", params.get("addrDetail"));
						invoiceData.put("postCode", params.get("postCode"));
						invoiceData.put("orderFormId", orderData.getLong("orderFormId"));
						dao.save("WebOrderMapper.insertOrderInvoice", invoiceData);
					}
					this.updatePoolDss(poolId, goodsCount);
					if (totalCount == 56) {// 当座位达到最大，关闭拼车
						this.updateIsClosed(poolId);
					}
					res.putData("orderId", orderData.getLong("orderFormId"));
					isRes = 0;
				} else {
					isRes = 2;// 车辆座位不够
				}
			} else {
				isRes = 3;// 当前拼车不存在
			}
		}
		if(isRes==0){
			//发送通知邮件
			SimpleMailSender.sendNoticeEmail(orderNo);
		}
		res.put("isRes", isRes);
		return res;
	}

	/**
	 * 跟新购买人数
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updatePoolDss(Long id, int goodsCount) throws Exception {
		PageData pd = new PageData();
		pd.put("id", id);
		pd.put("goodsCount", goodsCount);
		Integer count = (Integer) dao.update("WebCarCarpoolMapper.updatePoolDss", pd);
		return count > 0;
	}

	/**
	 * 关闭拼车
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updateIsClosed(Long id) throws Exception {
		PageData pd = new PageData();
		pd.put("id", id);
		Integer count = (Integer) dao.update("WebCarCarpoolMapper.updateIsClosed", pd);
		return count > 0;
	}

	/**
	 * 返回所有出发城市列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAllFromCitys() throws Exception {
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findAllFromCitys", null);
	}

	/**
	 * 根据出发城市的id返回区域列表
	 * 
	 * @param fromCityId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFromCountyByCityId(Long fromCityId) throws Exception {
		PageData pd = new PageData();
		pd.put("fromCityId", fromCityId);
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findFromCountyByCityId", pd);
	}

	/**
	 * 返回对应的门店列表或者具体地址列表
	 * 
	 * @param fromCityId
	 * @param fromCountyId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFromAddrByCountyId(Long fromCityId, Long fromCountyId) throws Exception {
		PageData pd = new PageData();
		if (!HString.isEmpty(fromCityId))
			pd.put("fromCityId", fromCityId);
		pd.put("fromCountyId", fromCountyId);
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findFromAddrByCountyId", pd);
	}

	/**
	 * 根据出发的地址id返回对应的路线上的城市id
	 * 
	 * @param fromAddrId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAllToCitysByFromId(Long fromAddrId) throws Exception {
		PageData pd = new PageData();
		pd.put("fromId", fromAddrId);
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findAllToCitysByFromId", pd);
	}

	/**
	 * 根据出发的地址id和目的地城市id来返回区县列表
	 * 
	 * @param fromAddrId
	 * @param fromCityId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findToCountyByCityId(Long fromAddrId, Long toCityId) throws Exception {
		PageData pd = new PageData();
		pd.put("fromId", fromAddrId);
		pd.put("toCityId", toCityId);
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findToCountyByCityId", pd);
	}

	/**
	 * 根据到达的区返回具体的地址列表
	 * 
	 * @param fromAddrId
	 * @param toCountyId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findToAddrByCountyId(Long fromAddrId, Long toCountyId) throws Exception {
		PageData pd = new PageData();
		pd.put("fromId", fromAddrId);
		pd.put("toCountyId", toCountyId);
		return (List<PageData>) dao.findForList("WebCarCarpoolAddrsCtMapper.findToAddrByCountyId", pd);
	}

	/**
	 * 发起租车查询带入信息
	 * 
	 * @param fromAddrId
	 * @param toAddrId
	 * @return
	 * @throws Exception
	 */
	public PageData findPoolStartDetail(Long fromAddrId, Long toAddrId) throws Exception {
		PageData pd = new PageData();
		pd.put("fromAddrId", fromAddrId);
		pd.put("toAddrId", toAddrId);
		PageData res = (PageData) dao.findForObject("WebCarCarpoolAddrsCtMapper.findPoolStartDetail", pd);
		PageData minMax = (PageData) dao.findForObject("WebCarCarpoolPriceMapper.findMaxMin", null);
		Integer mileage = (Integer) dao.findForObject("findMileage", pd);
		Double maxPrice = minMax.getDouble("maxPrice");
		Double totalPrice = mileage * maxPrice;
		Double pMinPrice = new BigDecimal(mileage * maxPrice / maxSeat).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		Double pMaxPrice = new BigDecimal(mileage * maxPrice / minSeat).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		res.put("maxPrice", pMaxPrice);
		res.put("minPrice", pMinPrice);
		res.put("totalPrice", totalPrice);
		return res;
	}

	/**
	 * 根据区域和类型返回地点
	 * 
	 * @param type
	 * @param countyId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAddrByCountyId(String type, Long countyId) throws Exception {
		PageData pd = new PageData();
		pd.put("addrType", type);
		pd.put("countyId", countyId);
		return (List<PageData>) dao.findForList("WebCarCarpoolMapper.findAddrByCountyId", pd);
	}

	/**
	 * 后台返回路线
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminCarpoolList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebCarCarpoolMapper.findAdminCarpoolListCount", param);
		param.put("data", dao.findForList("WebCarCarpoolMapper.findAdminCarpoolList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 新增保存和修改保存
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData saveCarAddrCt(PageData param) throws Exception {
		PageData res = new PageData(true);
		Integer isHave = (Integer) dao.findForObject("WebCarCarpoolMapper.checkCarAddrHave", param);
		if (isHave < 1) {
			if (HString.isEmpty(param.get("id"))) {
				dao.save("WebCarCarpoolMapper.insertCarAddrCt", param);
			} else {
				dao.update("WebCarCarpoolMapper.updateCarAddrCt", param);
			}
			res.putStatus(XConst.SUCCESS);
		} else {
			res.putStatus(XConst.EXISTS);
		}
		return res;
	}

	/**
	 * 返回详情重的所有的id
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findDetailAllIdByAddrCtId(Long id) throws Exception {
		PageData pd = new PageData();
		pd.put("id", id);
		return (PageData) dao.findForObject("WebCarCarpoolMapper.findDetailAllIdByAddrCtId", pd);
	}

	/**
	 * 上下架
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData updateOnOffLine(Long id) throws Exception {
		PageData pd = new PageData();
		pd.put("id", id);
		PageData ids = (PageData) dao.findForObject("WebCarCarpoolMapper.findDetailAllIdByAddrCtId", pd);
		int isShelves = ids.getInt("isShelves");
		if (isShelves == 0) {
			pd.put("isShelves", 1);
			pd.put("msg", "up");
		} else {
			pd.put("isShelves", 0);
			pd.put("msg", "down");
		}
		int count = (int) dao.update("WebCarCarpoolMapper.updateOnOffLine", pd);
		if (count > 0) {
			pd.putStatus(XConst.SUCCESS);
		}
		return pd;
	}

	/**
	 * 删除数据
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData deleteCarAddrCt(Long id) throws Exception {
		PageData pd = new PageData(true);
		pd.put("id", id);
		PageData ids = (PageData) dao.findForObject("WebCarCarpoolMapper.findDetailAllIdByAddrCtId", pd);
		Integer count = (Integer) dao.findForObject("WebCarCarpoolMapper.checkIsUsed", ids);
		if (count > 0) {
			pd.putStatus(XConst.USED);
		} else {
			count = (Integer) dao.delete("WebCarCarpoolMapper.deleteCarAddrCt", pd);
			if (count > 0) {
				pd.putStatus(XConst.SUCCESS);
			}
		}
		return pd;
	}

	/******************************************************* 以下是拼车价格操作 **************************************************/

	/**
	 * 返回拼车的所有车品牌（wrap）
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findBrandOfCarpool() throws Exception {
		return (List<PageData>) dao.findForList("WebCarSysMapper.findBrandOfCarpool", null);
	}

	/**
	 * 根据车的品牌返回车系
	 * 
	 * 
	 * @param brandId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findSysOfCarpoolByBrandId(Long brandId) throws Exception {
		PageData pd = new PageData();
		pd.put("brandId", brandId);
		return (List<PageData>) dao.findForList("WebCarSysMapper.findSysOfCarpoolByBrandId", pd);
	}

	/**
	 * 价格list
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findPriceList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebCarCarpoolMapper.findPriceListCount", param);
		param.put("data", dao.findForList("WebCarCarpoolMapper.findPriceList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 保存
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData saveAddrPrice(PageData param) throws Exception {
		PageData res = new PageData(true);
		Integer count = (Integer) dao.findForObject("WebCarCarpoolMapper.checkCarSysIsHave", param);
		if (count > 0) {
			res.putStatus(XConst.EXISTS);
		} else {
			if (HString.isEmpty(param.get("id"))) {
				dao.save("WebCarCarpoolMapper.insertAddrPrice", param);
			} else {
				dao.update("WebCarCarpoolMapper.updateAddrPrice", param);
			}
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}

	/**
	 * 返回详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findAddrPriceDetail(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("WebCarCarpoolMapper.findAddrPriceDetail", param);
	}

	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteAddrPrice(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		Integer count = (Integer) dao.delete("WebCarCarpoolMapper.deleteAddrPrice", param);
		return count > 0;
	}

}
