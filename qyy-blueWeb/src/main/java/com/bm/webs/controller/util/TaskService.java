package com.bm.webs.controller.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.interceptor.SessionInterceptor;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 定时任务服务
 * 
 * @author Daisy <br>
 *         2015年4月2日
 */
@Service
@SuppressWarnings("unchecked")
@Transactional
public class TaskService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 每天早上八点开始执行,提示订单未评价
	 */
	@Scheduled(cron = "0 00 08 * * ?")
	public void commentTask() throws Exception {
		List<PageData> commentList = (List<PageData>) dao.findForList("WebDepthMapper.findCommentOrderList",
				new PageData());
		PageData notice = new PageData();
		for (PageData comment : commentList) {
			try {
				notice.put("message", "您的订单《" + comment.getString("order_code") + "》还未评价，赶紧去评价吧");
				notice.put("msgType", "notice");
				notice.put("msgSource", "order_ment");
				notice.put("toUserId", comment.getLong("user_id"));
				notice.put("biuldId", comment.getLong("id"));
				notice.put("biuldTitle", "您的订单《" + comment.getString("order_code") + "》还未评价，赶紧去评价吧，点击查看");
				dao.save("WebMessageMapper.addMessage", notice);
				// 修改订单状态为已通知(通过后就不再通知了)
				dao.save("WebDepthMapper.updateOrderNotice", comment);
				System.out.println("订单"+comment.getString("order_code")+"已发送未评价提示");
			} catch (Exception e) {
				System.out.println("订单"+comment.getString("order_code")+"发送未评价提示失败");
				e.printStackTrace();
			}
		}
		commentList = null;
		notice = null;
		System.gc();
	}

	/**
	 * 订单关闭：下订单超过半个小时未支付，订单将关闭
	 * 
	 * @throws Exception
	 */
	@Scheduled(cron = "0 0-59 0-23 * * ?")
	public void orderCloseTask() {
		try {
			// 关闭半个小时未支付的订单
			Integer result=(Integer) dao.update("WebOrderMapper.closeNotPayOrderInTime", new PageData());
			System.out.println("已关闭超时订单:"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	/**
//	 * 订单未支付通知：订单失效前15分钟提醒订单未支付
//	 * 
//	 * @throws Exception
//	 */
//	@Scheduled(cron = "0 0-59 0-23 * * ?")
//	public void updateOrderNoticeTask() throws Exception {
//		
//		
//		
//		System.out.println("-------orderNoticeTask execute start-------");
//		List<PageData> noticeOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findNoticeOrderList",
//				new PageData());
//		PageData notice ;
//		for (PageData order : noticeOrderList) {
//			try {
//				String orderType = replacOrderType(order.getString("order_type"));// 订单类型
//				order.put("orderType", orderType);
//				// 如果未通知，则通知
//				int count = (Integer) dao.findForObject("WebOrderMapper.checkIsNotice", order);
//				System.out.println("====================");
//				System.out.println("添加消息："+order);
//				System.out.println("====================");
//				if (count == 0) {
//					notice= new PageData();
//					notice.put("message", "您的订单《" + order.getString("order_code") + "》还未支付，超过半个小时未付，订单将自动取消");
//					notice.put("msgType", "notice");
//					notice.put("msgSource", orderType);
//					notice.put("toUserId", order.getLong("user_id"));
//					notice.put("biuldId", order.getLong("id"));
//					notice.put("biuldTitle", "您的订单《" + order.getString("order_code") + "》还未支付，超过半个小时未付，订单将自动取消，点击查看");
//					dao.save("WebMessageMapper.addMessage", notice);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		noticeOrderList = null;
//		notice = null;
//		System.gc();
//		System.out.println("-------orderNoticeTask execute end-------");
//	}

//	/**
//	 * 拼车状态修改
//	 * 
//	 * @throws Exception
//	 */
//	@Scheduled(cron = "0 0-59 0-23 * * ?")
//	public void carPoolTask() throws Exception {
//		System.out.println("-------carPoolTask execute start-------");
//		List<PageData> list = (List<PageData>) dao.findForList("WebOrderMapper.findOperationCarPool", new PageData());
//		StringBuffer successPoolIdsBuffer = new StringBuffer();
//		StringBuffer failPoolIdsBuffer = new StringBuffer();
//		// StringBuffer successOrderIdsBuffer=new StringBuffer();
//		// StringBuffer failOrderIdsBuffer=new StringBuffer();
//		for (PageData carPool : list) {
//			if (carPool.getLong("pool_dss") < 56) {// 拼车失败
//				failPoolIdsBuffer.append(carPool.get("id"));
//				failPoolIdsBuffer.append(",");
//			} else {// 拼车成功
//				successPoolIdsBuffer.append(carPool.get("id"));
//				successPoolIdsBuffer.append(",");
//			}
//		}
//		PageData param = new PageData();
//
//		List<PageData> successOrderList = null;
//		Integer lastIndex = successPoolIdsBuffer.lastIndexOf(",");
//		if (lastIndex != -1) {
//			param.put("ids", successPoolIdsBuffer.substring(0, lastIndex));
//			param.put("flag", 0);
//			successOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrder", param);
//			dao.update("WebOrderMapper.updateCarPool", param);
//		}
//
//		List<PageData> failOrderList = null;
//		lastIndex = failPoolIdsBuffer.lastIndexOf(",");
//		if (lastIndex != -1) {
//			param.put("ids", failPoolIdsBuffer.substring(0, lastIndex));
//			param.put("flag", 1);
//			failOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrder", param);
//			dao.update("WebOrderMapper.updateCarPool", param);
//		}
//
//		PageData notice = new PageData();
//		if (successOrderList != null) {
//			for (PageData order : successOrderList) {// 处理成功订单，发送提示
//				notice.put("message", "您的订单《" + order.getString("order_code") + "》拼车成功");
//				notice.put("msgType", "notice");
//				notice.put("msgSource", replacOrderType(order.getString("order_type")));
//				notice.put("toUserId", order.getLong("user_id"));
//				notice.put("biuldId", order.getLong("id"));
//				notice.put("biuldTitle", "您的订单《" + order.getString("order_code") + "》拼车成功");
//				dao.save("WebMessageMapper.addMessage", notice);
//				notice.clear();
//			}
//		}
//		if (failOrderList != null) {
//			for (PageData order : failOrderList) {// 处理失败订单，发送提示，并且关闭订单
//				notice.put("message", "您的订单《" + order.getString("order_code") + "》拼车失败");
//				notice.put("msgType", "notice");
//				notice.put("msgSource", replacOrderType(order.getString("order_type")));
//				notice.put("toUserId", order.getLong("user_id"));
//				notice.put("biuldId", order.getLong("id"));
//				notice.put("biuldTitle", "您的订单《" + order.getString("order_code") + "》拼车失败");
//				dao.save("WebMessageMapper.addMessage", notice);
//				notice.clear();
//				if("PAY_OK".equals(order.get("order_state"))){
//					dao.update("WebOrderMapper.refundPoolOrder", order);
//				}else if("WAITPAY".equals(order.get("order_state"))){
//					dao.update("WebOrderMapper.closePoolOrder", order);
//				}
//				dao.update("WebOrderMapper.updateRefundTime", order);
//			}
//		}
//		// noticeOrderList=null;
//		notice = null;
//		successOrderList = null;
//		failOrderList = null;
//		successPoolIdsBuffer = null;
//		failPoolIdsBuffer = null;
//		list = null;
//		System.gc();
//		System.out.println("-------carPoolTask execute end-------");
//	}
	
	/**
	 * 初始化班车数量
	 * 
	 * 
	 * @throws Exception
	 */
	@Scheduled(cron = "0 0-59 0-23 * * ?")
	public void initBus() {
		try {
			// 关闭半个小时未支付的订单
			Integer result=(Integer) dao.update("WebOrderMapper.updateInitBus", new PageData());
			System.out.println("班车坐客人数初始化，更新条数："+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 每小时统计登录数量
	 * 
	 * 
	 * @throws Exception
	 */
	@Scheduled(cron = "0 0 0-23 * * ?")
	public void saveLoginCount() {
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			Integer loginNumber=0;
			Integer unLoginNumber=0;
			Integer count=0;
			for (String status : SessionInterceptor.sessionMap.values()) {
				if("0".equals(status)){
					unLoginNumber++;
				}else if("1".equals(status)){
					loginNumber++;
				}
				count++;
			}
			map.put("loginNumber", loginNumber);
			map.put("unLoginNumber", unLoginNumber);
			dao.save("UserCountMapper.saveLoginCount", map);
			System.out.println("统计登录");
			System.out.println("总计:"+count+",已登录："+loginNumber+",未登录："+unLoginNumber);
			loginNumber=null;
			unLoginNumber=null;
			count=null;
			map=null;
			System.gc();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	String[] order_type_arr = { "carRent", "carWrap", "bus", "carpool", "depth" };
	String[] resource_type_arr = { "order_rent", "order_wrap", "order_bus", "order_pool", "order_depth" };

//	/**
//	 * 根据订单类型替换对应来源
//	 * 
//	 * @return
//	 */
//	private String replacOrderType(String orderType) {
//		for (int i = 0; i < order_type_arr.length; i++) {
//			if (order_type_arr[i].equals(orderType)) {
//				return resource_type_arr[i];
//			}
//		}
//		return null;
//	}

	public static void main(String[] args) {
		StringBuffer buff = new StringBuffer();
		buff.append("123123123,");
		System.out.println(buff.substring(0, buff.length() - 1));
	}

}
