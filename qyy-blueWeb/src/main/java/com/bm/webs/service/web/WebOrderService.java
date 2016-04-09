package com.bm.webs.service.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.date.TimeHelper;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebOrderRentInfo;
import com.bm.webs.controller.util.SMSHelper;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebOrderService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	private static SimpleDateFormat DATE_H_M_CN_FORMAT = new SimpleDateFormat("yyyy年MM月dd日HH点mm分");

	private static SimpleDateFormat DATE_SIMPLE_CN_FORMAT = new SimpleDateFormat("yyyy年MM月dd日");

	/**
	 * 
	 * 查询景区订单
	 * 
	 * @param id
	 * @param serchDate
	 * @param status
	 * @param phone
	 * @param payId
	 * @param orderId
	 * @param user
	 * @param orderType
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHotelOrderList(PageData map, Long id, String user, String orderId,
			String payId, String phone, String status, String serchDate, String orderType) throws Exception {
		map.put("id", id);
		map.put("user", user);
		map.put("orderId", orderId);
		map.put("payId", payId);
		map.put("phone", phone);
		map.put("serchDate", serchDate);
		map.put("status", status);
		map.put("orderType", orderType);
		return (List<PageData>) dao.findForList("WebOrderMapper.findHotelOrderList", map);
	}

	/**
	 * 
	 * 查询订单总数
	 * 
	 * @param map
	 * 
	 * @param id
	 * @param orderType
	 * @return
	 * @throws Exception
	 */
	public Long findHotelOrderListCount(PageData map, Long id, String user, String orderId, String payId,
			String phone, String status, String serchDate, String orderType) throws Exception {
		map.put("id", id);
		map.put("user", user);
		map.put("orderId", orderId);
		map.put("payId", payId);
		map.put("phone", phone);
		map.put("serchDate", serchDate);
		map.put("status", status);
		map.put("orderType", orderType);
		return (Long) dao.findForObject("WebOrderMapper.findHotelOrderListCount", map);
	}

	/**
	 * 
	 * 删除订单
	 * 
	 * @param ids
	 * @throws Exception
	 */
	public void deleteOrders(String ids) throws Exception {
		PageData map = new PageData();
		map.put("ids", ids);
		dao.update("WebOrderMapper.deleteOrders", map);
	}

	/**
	 * 
	 * 关闭订单
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void closeOrders(String id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		dao.update("WebOrderMapper.closeOrders", map);
	}

	/**
	 * 
	 * 查询景区订单详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findScenicOrderDetialById(Long id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		return (PageData) dao.findForObject("WebOrderMapper.findScenicOrderDetialById", map);
	}

	/**
	 * 根据订单编号查找订单
	 * 
	 * @param orderCode
	 * @return
	 * @throws Exception
	 */
	public PageData findOrderFormByCode(String orderCode) throws Exception {
		PageData param = new PageData();
		param.put("orderCode", orderCode);
		return (PageData) dao.findForObject("WebOrderMapper.findOrderFormByCode", param);
	}

	/**
	 * 新增订单
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertOrderForm(PageData param) throws Exception {
		dao.save("WebOrderMapper.insertOrderForm", param);
	}

	/**
	 * 新增订单条目
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertOrderItem(PageData param) throws Exception {
		dao.save("WebOrderMapper.insertOrderItem", param);
	}

	/**
	 * 新增订单条目使用人信息
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertOrderItemPerson(PageData param) throws Exception {
		dao.save("WebOrderMapper.insertOrderItemPerson", param);
	}

	/**
	 * 新增发票
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void insertOrderInvoice(PageData param) throws Exception {
		dao.save("WebOrderMapper.insertOrderInvoice", param);
	}

	/**
	 * 根据订单id查找订单条目
	 * 
	 * @param orderCode
	 * @return
	 * @throws Exception
	 */
	public PageData findOrderItemByFormId(Long orderFormId) throws Exception {
		PageData param = new PageData();
		param.put("orderFormId", orderFormId);
		return (PageData) dao.findForObject("WebOrderMapper.findOrderItemByFormId", param);
	}

	/**
	 * 
	 * 保存租车信息
	 * 
	 * @param webOrderRentInfo
	 * @throws Exception
	 */
	public void insertOrderRentInfo(WebOrderRentInfo webOrderRentInfo) throws Exception {
		dao.save("WebOrderMapper.insertOrderRentInfo", webOrderRentInfo);
	}

	/**
	 * 
	 * 支付保存
	 * 
	 * @param orderId
	 * @param orderType
	 * @param payType
	 * @param payOrderId
	 * @return
	 * @throws Exception
	 */
	public boolean updateOrderPay(Long orderId, String orderType, String payType, String payOrderId)
			throws Exception {
		PageData params = new PageData();
		params.put("orderId", orderId);
		params.put("newState", XConst.ORDER_STATE.PAY_OK.toString());
		params.put("oldState", XConst.ORDER_STATE.WAITPAY.toString());
		params.put("payOrderId", payOrderId);
		params.put("payType", payType);
		
		PageData orderState=(PageData) dao.findForObject("WebOrderMapper.findOrderStateByid", params);
		if(XConst.ORDER_STATE.PAY_OK.toString().equals(orderState.get("order_state"))){
			return true;
		}
		
		dao.update("WebOrderMapper.updateOrderState", params);
		PageData links = (PageData) dao.findForObject("WebOrderMapper.findOrderLinks", params);
		String mobile = links.getString("phone");
		String name = links.getString("name");
		StringBuffer sb = new StringBuffer("尊敬的" + name);
		if (XConst.CART_TYPE.CARPOOL.toString().toLowerCase().equals(orderType)) {
			sb.append("，您好!证件号" + links.getString("cardNo") + "，您订购的拼车服务已支付成功，");
			sb.append("订单号：" + links.getString("orderCode"));
			sb.append(",请携带好有效证件提前到达乘车地点，");
			PageData p = new PageData();
			p.put("id", links.get("goodsId"));
			PageData goods = (PageData) dao.findForObject("WebCarCarpoolMapper.carpoolDetail", p);
			sb.append("我们将于" + goods.getString("startTime"));
			sb.append("准时从" + goods.getString("stStore") + "发车，");
			sb.append(goods.getString("startCity") + "-" + goods.getString("endCity") + "拼车，");
			sb.append("如有疑问请提前致电:" + ConfigLoad.getStringValue("SMS.CONTENT_TEL"));
			sb.append(",祝您一路顺风！");
		} else if (XConst.CART_TYPE.BUS.toString().toLowerCase().equals(orderType)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", orderId);
			PageData data = (PageData) dao.findForObject("WebBusMapper.findStartTime", map);
			sb.append("，您好!证件号" + links.getString("cardNo") + "，您订购的班车服务已支付成功，");
			sb.append("订单号：" + links.getString("orderCode"));
			sb.append(",请携带好有效证件提前到达乘车地点，");
			PageData goods = (PageData) dao.findForObject("WebBusMapper.findById", links.getLong("goodsId"));
			sb.append("我们将于" + new SimpleDateFormat("yyyy-MM-dd日HH:mm:ss").format(data.get("bus_start_time")));
			sb.append("准时从" + goods.getString("from_store") + "发车，");
			sb.append(goods.getString("from_addr") + "-" + goods.getString("to_addr") + "班车，");
			sb.append("如有疑问请提前致电:" + ConfigLoad.getStringValue("SMS.CONTENT_TEL"));
			sb.append(",祝您一路顺风！");
		} else if (XConst.CART_TYPE.carRent.toString().equals(orderType)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", orderId);
			PageData data = (PageData) dao.findForObject("WebCarRentMapper.findOrderInfo", map);
			sb.append("，您好!证件号");
			sb.append(links.getString("cardNo"));// 证件号
			sb.append("您订购的租车服务已支付成功，订单号：");
			sb.append(data.get("order_code"));
			sb.append("，请携带好相关有效证件于规定时间（");
			sb.append(DATE_H_M_CN_FORMAT.format(data.get("start_date")));// 租车开始时间
			sb.append("）规定地点（");
			sb.append(data.get("store"));// 车型号
			sb.append("）取还车辆，车型号：");
			sb.append(data.get("brand"));// 车型号
			sb.append(" ");
			sb.append(data.get("sys"));
			sb.append("/");
			sb.append(data.get("car_type"));
			sb.append("/");
			sb.append(data.get("outputs"));
			sb.append(data.get("gearbox"));
			sb.append("，总金额：");
			sb.append(data.get("real_price"));// 总金额
			sb.append("元（含保险），如有疑问请提前致电010-1234567，祝您一路平安！");
		} else if (XConst.CART_TYPE.carWrap.toString().equals(orderType)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", orderId);
			PageData data = (PageData) dao.findForObject("WebCarWrapMapper.findOrderMes", map);
			sb.append("，您好!您订购的包车服务已支付成功，时间：" + DATE_H_M_CN_FORMAT.format(data.get("start_time")));
			sb.append("——" + DATE_H_M_CN_FORMAT.format(data.get("end_time")));
			sb.append("," + data.get("goods_count") + "辆");
			sb.append(data.get("brand"));
			sb.append(",订单号：" + data.get("order_code"));
			sb.append("(请妥善保管)，请携带好相关有效证件于规定时间提前告知您的时间与地点，我们将为您提供接送服务，");
			sb.append("如有疑问请提前致电" + ConfigLoad.getStringValue("SMS.CONTENT_TEL") + "，祝您一路平安！");
		}
		// 主题深度游
		else if ("depth".equals(orderType)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderId", orderId);
			PageData data = (PageData) dao.findForObject("WebDepthMapper.findOrderMes", map);
			sb = new StringBuffer();
			sb.append("尊敬的" + data.get("person_name"));
			mobile = data.getString("person_phone");
			sb.append("，您好!您于" + DATE_H_M_CN_FORMAT.format(data.get("create_time")));
			sb.append("购买的主题深度游之" + data.get("name") + "已支付成功，");
			sb.append("总金额：" + data.get("real_price") + "元。");
			sb.append("订单号：" + data.get("order_code") + "(请妥善保管)，");
			sb.append("请携带好有效订单号及凭借有效订单号在规定日期内使用(" + DATE_SIMPLE_CN_FORMAT.format(data.get("start_time"))
					+ "--" + DATE_SIMPLE_CN_FORMAT.format(data.get("end_time")) + ")，");
			sb.append("如有疑问请联系黔易游客服：" + ConfigLoad.getStringValue("SMS.CONTENT_TEL") + "，我们将竭诚为您服务，祝您旅途愉快！");
			// 支付成功后，销量+1
			PageData depthParam = new PageData();
			depthParam.put("depthId", data.get("goodsId"));
			dao.save("WebDepthMapper.updateDepthSaleNum", depthParam);
		}
		System.out.println(sb.toString());
		SMSHelper.sendSMS(mobile, sb.toString());
		return true;
	}

	/**
	 * 检查当前订单是否处于某个状态
	 * 
	 * @param orderId
	 * @param orderState
	 * @return
	 * @throws Exception
	 */
	public boolean checkOrderState(Long orderId, String orderState) throws Exception {
		PageData params = new PageData();
		params.put("orderId", orderId);
		params.put("orderState", orderState);
		Integer count = (Integer) dao.findForObject("WebOrderMapper.checkOrderState", params);
		return count >= 1;
	}

	/**
	 * 获取订单的真实金额
	 * 
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public Double findRealPriceByOrderId(Long orderId) throws Exception {
		PageData params = new PageData();
		params.put("orderId", orderId);
		return (Double) dao.findForObject("WebOrderMapper.findRealPriceByOrderId", params);
	}

	/**
	 * 
	 * 查询租车订单List
	 * 
	 * @param map
	 * @param evaluate
	 * @param payType
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarRentOrderList(Integer startLine, Integer pageSize, PageData map,
			String evaluate, String payType, Long userId) throws Exception {
		map.put("evaluate", evaluate);
		map.put("payType", payType);
		map.put("userId", userId);
		map.put("startLine", startLine);
		map.put("showLine", pageSize);
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarRentOrderListCount", map);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		map.put("totalPage", totalPage);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarRentOrderList", map);
	}

	/**
	 * 
	 * 查询包车订单List
	 * 
	 * @param startLine
	 * @param pageSize
	 * @param map
	 * @param evaluate
	 * @param payType
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarWrapOrderList(Integer startLine, Integer pageSize, PageData map,
			String evaluate, String payType, Long userId) throws Exception {
		map.put("evaluate", evaluate);
		map.put("payType", payType);
		map.put("userId", userId);
		map.put("startLine", startLine);
		map.put("showLine", pageSize);
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarWrapOrderListCount", map);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		map.put("totalPage", totalPage);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarWrapOrderList", map);
	}

	/**
	 * 
	 * 查询拼车订单List
	 * 
	 * @param startLine
	 * @param pageSize
	 * @param map
	 * @param evaluate
	 * @param payType
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	
	public List<PageData> findCarPoolOrderList(Integer startLine, Integer pageSize, PageData map, String evaluate,
			String payType, Long userId) throws Exception {
		map.put("evaluate", evaluate);
		map.put("payType", payType);
		map.put("userId", userId);
		map.put("startLine", startLine);
		map.put("showLine", pageSize);
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarPoolOrderListCount", map);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		map.put("totalPage", totalPage);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrderList", map);
	}

	/**
	 * 
	 * 查询班车订单List
	 * 
	 * @param startLine
	 * @param pageSize
	 * @param map
	 * @param evaluate
	 * @param payType
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarBusOrderList(Integer startLine, Integer pageSize, PageData map,
			String evaluate, String payType, Long userId) throws Exception {
		map.put("evaluate", evaluate);
		map.put("payType", payType);
		map.put("userId", userId);
		map.put("startLine", startLine);
		map.put("showLine", pageSize);
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarBusOrderListCount", map);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		map.put("totalPage", totalPage);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarBusOrderList", map);
	}

	public PageData findHotelOrderDetialById(Long id) throws Exception {
		PageData map = new PageData();
		map.put("id", id);
		return (PageData) dao.findForObject("WebOrderMapper.findHotelOrderDetialById", map);
	}

	/**
	 * 查询深度游订单列表
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findPCDepthOrderList(PageData param) throws Exception {
		PageData res = new PageData();
		int pageSize = 5;
		param.put("picType", "webCover");// 网页端封面图片
		Long total = (Long) dao.findForObject("WebOrderMapper.findDepthOrderListCount", param);
		Long totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		Long pageNo = (HString.isEmpty(param.getLong("pageNo")) ? 1 : param.getLong("pageNo"));
		param.put("startLine", (pageNo - 1) * pageSize);
		param.put("showLine", pageSize);
		List<PageData> list = (List<PageData>) dao.findForList("WebOrderMapper.findDepthOrderList", param);
		res.put("list", list);
		res.putStatus(XConst.SUCCESS);
		res.put("totalPage", totalPage);
		res.put("pageNo", param.getLong("pageNo"));
		return res;
	}

	/**
	 * app端 查询深度游订单列表
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAppDepthOrderList(PageData param) throws Exception {
		param.put("picType", "appCover");// app端封面图片
		return (List<PageData>) dao.findForList("WebOrderMapper.findDepthOrderList", param);
	}

	/**
	 * 查询深度游 订单详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findDepthOrderDetail(Long id, String picType) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("picType", picType);
		return (PageData) dao.findForObject("WebOrderMapper.findDepthOrderDetail", param);
	}

	/**
	 * 查询订单关联人信息列表
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrderPersonList(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (List<PageData>) dao.findForList("WebOrderMapper.findOrderPersonList", param);
	}

	/**
	 * 新增一条退款信息
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void saveRefund(PageData param) throws Exception {
		//删除已存在的之前申请过的退款信息，只保留最新的
		int count = (Integer)dao.save("WebOrderMapper.deleteRefund", param);
		// 保存退款申请信息
		dao.save("WebOrderMapper.addRefund", param);
		// 修改订单状态为退款中
		PageData orderData = new PageData();
		orderData.put("orderId", param.get("formId"));
		orderData.put("newState", XConst.ORDER_STATE.REFUNDING.toString());// 新状态：退款中
		//如果之前没有申请过退款，则之前状态为支付成功
		if(count == 0){
			orderData.put("oldState", XConst.ORDER_STATE.PAY_OK.toString());// 原状态：支付成功
		}
		//如果之前没有申请过退款，则之前状态为退款失败
		else{
			orderData.put("oldState", XConst.ORDER_STATE.REFUNDING_FAIL.toString());// 原状态：退款失败
		}
		dao.update("WebOrderMapper.updateOrderState", orderData);
	}

	/**
	 * APP端租车订单列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarRentOrderList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarRentOrderListCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarRentOrderList", pd);
	}

	/**
	 * APP端包车订单列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarWrapOrderList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarWrapOrderListCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarWrapOrderList", pd);
	}

	/**
	 * APP端班车订单列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarBusOrderList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarBusOrderListCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarBusOrderList", pd);
	}

	/**
	 * APP端拼车订单列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCarPoolOrderList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findCarPoolOrderListCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrderList", pd);
	}

	/**
	 * 根据订单号找到订单类型
	 * 
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public String findOrderType(Long orderId) throws Exception {
		PageData param = new PageData();
		param.put("orderId", orderId);
		return (String) dao.findForObject("WebOrderMapper.findOrderType", param);
	}

	/**
	 * 查询租车订单
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findCarRentOrderDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebOrderMapper.findCarRentOrderDetial", pd);
	}

	/**
	 * 根据订单ID返回订单类型
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String findOrderTypeById(PageData pd) throws Exception {
		return (String) dao.findForObject("WebOrderMapper.findOrderTypeById", pd);
	}

	/**
	 * 查询租车订单
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findCarWrapOrderDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebOrderMapper.findCarWrapOrderDetial", pd);
	}

	/**
	 * 查询包车地点List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findCarWrapAddrList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebOrderMapper.findCarWrapAddrList", pd);
	}

	/**
	 * 查询班车订单详情
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findCarBusOrderDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebOrderMapper.findCarBusOrderDetial", pd);
	}

	/**
	 * 查询拼车详情
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findCarPoolOrderDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebOrderMapper.findCarPoolOrderDetial", pd);
	}

	/**
	 * 取消订单
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void cannelOrder(PageData pd) throws Exception {
		dao.update("WebOrderMapper.cannelOrder", pd);
		Map<String, Object> order= (Map<String, Object>) dao.findForObject("WebOrderMapper.findCarPoolOrderDetial", pd);
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("carPoolId", order.get("carPoolId"));
		param.put("number", order.get("goods_count"));
		dao.update("WebOrderMapper.subCarPoolDss", param);
	}

	/**
	 * 验证取消订单 查询对应的未支付订单ID
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Long checkCannel(PageData pd) throws Exception {
		return (Long) dao.findForObject("WebOrderMapper.checkCannel", pd);
	}

	/**
	 * EXCEL上传保存Order
	 * 
	 * @param map
	 * @throws Exception
	 */
	public void insertExcelOrder(Map<String, Object> map) throws Exception {
		dao.save("WebOrderMapper.insertExcelOrder", map);
	}

	/**
	 * 验证订单能否删除
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Long checkDelete(PageData pd) throws Exception {
		return (Long) dao.findForObject("WebOrderMapper.checkDelete", pd);
	}

	/**
	 * 删除订单
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void deleteOrder(PageData pd) throws Exception {
		dao.update("WebOrderMapper.deleteOrder", pd);
	}

	/**
	 * 验证能否申请退款
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Long checkRefund(PageData pd) throws Exception {
		return (Long) dao.findForObject("WebOrderMapper.checkRefund", pd);
	}

	/**
	 * 申请退款
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void refund(PageData pd) throws Exception {
		dao.update("WebOrderMapper.updatePerson", pd);
		dao.update("WebOrderMapper.refund", pd);
	}

	/**
	 * 查询班车乘坐人信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findCarBusOrderPersonList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebOrderMapper.findCarBusOrderPersonList", pd);
	}

	/**
	 * 查询包车乘坐人信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findCarPoolOrderPersonList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebOrderMapper.findCarPoolOrderPersonList", pd);
	}

	/**
	 * 查询后台管理班车订单List
	 * 
	 * 该部分需要对订单进行统计处理，根据每一种班车进行分类(一种班车为一个线路上的一个时间点发车的Bus)
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdminBusCountList(PageData pd) throws Exception {
		String timeEnd = pd.getString("timeEndStr");
		if (!ValidateHelper.isNullOrEmpty(timeEnd)) {
			pd.put("timeEndStr", timeEnd.substring(0, timeEnd.lastIndexOf(":")));
		}
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findAdminBusCountCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findAdminBusCountList", pd);
	}
	
	/**
	 * 查询后台管理拼车订单List
	 * 
	 * 以每一个发起的拼车作为一条统计标记
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findAdminPoolCountList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebOrderMapper.findAdminPoolCountCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<PageData>) dao.findForList("WebOrderMapper.findAdminPoolCountList", pd);
	}

	/**
	 * 查询班车,拼车详情List
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findCarDetialList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebOrderMapper.findCarDetialList", pd);
	}

	/**
	 * 审核退款
	 * @param pd
	 * @throws Exception 
	 */
	public void updateExamineRefund(PageData pd) throws Exception {
		Long state=pd.getLong("state");
		if(1==state){//若为审核失败，则修改订单状态为退款失败
			pd.put("newState", "REFUNDING_FAIL");
			pd.put("orderId", pd.get("id"));
			pd.put("oldState", "REFUNDING");
			dao.update("WebOrderMapper.updateOrderState", pd);
			dao.save("WebOrderMapper.insertOrderExamine", pd);
			
			//退库成功和退款失败都发送短信
			PageData mesInfo = (PageData)dao.findForObject("WebOrderMapper.findRefundMes", pd);
			String mobile = mesInfo.getString("person_phone");
			String refundResult = (state == 0)?"退款成功":"退款失败";
			String mes = "尊敬的"+mesInfo.getString("person_name")+"，您的订单号："+mesInfo.getString("order_code")+refundResult
					+"，如有疑问请联系黔易游客服：" + ConfigLoad.getStringValue("SMS.CONTENT_TEL") + "，我们将竭诚为您服务，祝您旅途愉快！";
			SMSHelper.sendSMS(mobile, mes);
		}
		//保存审核记录
		dao.update("WebOrderMapper.updateExamineRefund", pd);
	}

	/**
	 * 提交退款结果
	 * @param pd
	 * @throws Exception
	 */
	public void submitRefundState(PageData pd) throws Exception {
		Long state=pd.getLong("state");
		pd.put("orderId", pd.get("id"));
		pd.put("oldState", "REFUNDING");
		if(1==state){//若为审核失败，则修改订单状态为退款失败
			pd.put("newState", "REFUNDING_FAIL");
		}else if(0==state){
			pd.put("newState", "REFUNDED");
		}
		dao.update("WebOrderMapper.updateOrderState", pd);
		//保存审核记录
		dao.save("WebOrderMapper.insertOrderExamine", pd);
		dao.update("WebOrderMapper.updateExamineRefund", pd);
		
		//退库成功和退款失败都发送短信
		PageData mesInfo = (PageData)dao.findForObject("WebOrderMapper.findRefundMes", pd);
		String mobile = mesInfo.getString("person_phone");
		String refundResult = (state == 0)?"退款成功":"退款失败";
		String mes = "尊敬的"+mesInfo.getString("person_name")+"，您的订单号："+mesInfo.getString("order_code")+refundResult
				+"，如有疑问请联系黔易游客服：" + ConfigLoad.getStringValue("SMS.CONTENT_TEL") + "，我们将竭诚为您服务，祝您旅途愉快！";
		SMSHelper.sendSMS(mobile, mes);
	}

	/**
	 * 查询审核记录 
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findOrderExamineList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebOrderMapper.findOrderExamineList", pd);
	}

	/**
	 * 查询退款用户详细信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findorderUser(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebOrderMapper.findorderUser", pd);
	}

	/**
	 * 获取需要通知支付的订单 订单失效前15分钟通知
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findNoticeOrderList() throws Exception {
		return (List<PageData>) dao.findForList("WebOrderMapper.findNoticeOrderList", new PageData());
	}
	
	/**
	 * 获取进入评价页的订单信息
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public PageData findOrderEvaluateInfo(Long orderId) throws Exception {
		PageData param = new PageData();
		param.put("orderId", orderId);
		return (PageData)dao.findForObject("WebOrderMapper.findOrderEvaluateInfo", param);
	}

	/**
	 * 删除班车
	 * @param ids
	 * @throws Exception 
	 */
	public void deletesBus(String ids) throws Exception {
		PageData map = new PageData();
		map.put("ids", ids);
		dao.update("WebOrderMapper.deletesBus", map);
	}

	/**
	 * 删除拼车
	 * @param ids
	 * @throws Exception 
	 */
	public void deletesPool(String ids) throws Exception {
		PageData map = new PageData();
		map.put("ids", ids);
		dao.update("WebOrderMapper.deletesPool", map);
	}

	/**
	 * 添加班车开始时间
	 * 
	 * @param pd
	 * @throws Exception 
	 */
	public void updateBusStartDate(PageData pd) throws Exception {
		dao.update("WebOrderMapper.updateBusStartDate", pd);
	}

}
