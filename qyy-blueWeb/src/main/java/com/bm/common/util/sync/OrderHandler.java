package com.bm.common.util.sync;

import java.util.List;
import java.util.Map;

import com.bm.common.beans.XResult;
import com.bm.common.listener.SpringContextListener;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 处理订单相关操作的定时任务
 * 
 * 
 * 处理即将过期的订单
 * 处理拼车状态
 * 
 * @author Hham
 *
 */
@SuppressWarnings("unchecked")
public class OrderHandler implements ITaskHandler {

	private DaoSupport dao = null;

	String[] order_type_arr = { "carRent", "carWrap", "bus", "carpool", "depth" };
	String[] resource_type_arr = { "order_rent", "order_wrap", "order_bus", "order_pool", "order_depth" };

	@Override
	public XResult execute(Map<String, Object> params, String taskId) throws Exception {

		if (dao == null)
			dao = (DaoSupport) SpringContextListener.getSpringContext().getBean("daoSupport");

		if ("test1".equals(taskId)) {
			System.out.println("do task test1");
			updateOrderNoticeTask();
		} else if ("test2".equals(taskId)) {
			System.out.println("do task test2");
			carPoolTask();
		}
		return null;
	}

	public void updateOrderNoticeTask() {

		List<PageData> noticeOrderList = null;
		try {
			noticeOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findNoticeOrderList", new PageData());
			PageData notice;
			for (PageData order : noticeOrderList) {
				try {
					String orderType = replacOrderType(order.getString("order_type"));// 订单类型
					order.put("orderType", orderType);
					// 如果未通知，则通知
					int count = (Integer) dao.findForObject("WebOrderMapper.checkIsNotice", order);
					if (count == 0) {
						notice = new PageData();
						notice.put("message", "您的订单《" + order.getString("order_code") + "》还未支付，超过半个小时未付，订单将自动取消");
						notice.put("msgType", "notice");
						notice.put("msgSource", orderType);
						notice.put("toUserId", order.getLong("user_id"));
						notice.put("biuldId", order.getLong("id"));
						notice.put("biuldTitle", "您的订单《" + order.getString("order_code")
								+ "》还未支付，超过半个小时未付，订单将自动取消，点击查看");
						dao.save("WebMessageMapper.addMessage", notice);
						System.out.println("订单"+order.getString("order_code")+"添加消息支付提醒成功");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			noticeOrderList = null;
			notice = null;
			System.gc();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===订单提醒通知任务异常===");
			System.out.println("订单列表:" + noticeOrderList);
		}
	}

	public void carPoolTask() {
		List<PageData> list =null;
		try {
			list= (List<PageData>) dao.findForList("WebOrderMapper.findOperationCarPool", new PageData());
			StringBuffer successPoolIdsBuffer = new StringBuffer();
			StringBuffer failPoolIdsBuffer = new StringBuffer();
			// StringBuffer successOrderIdsBuffer=new StringBuffer();
			// StringBuffer failOrderIdsBuffer=new StringBuffer();
			for (PageData carPool : list) {
				if (carPool.getLong("pool_dss") < 56) {// 拼车失败
					failPoolIdsBuffer.append(carPool.get("id"));
					failPoolIdsBuffer.append(",");
				} else {// 拼车成功
					successPoolIdsBuffer.append(carPool.get("id"));
					successPoolIdsBuffer.append(",");
				}
			}
			PageData param = new PageData();

			List<PageData> successOrderList = null;
			Integer lastIndex = successPoolIdsBuffer.lastIndexOf(",");
			if (lastIndex != -1) {
				param.put("ids", successPoolIdsBuffer.substring(0, lastIndex));
				param.put("flag", 0);
				successOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrder", param);
				dao.update("WebOrderMapper.updateCarPool", param);
			}

			List<PageData> failOrderList = null;
			lastIndex = failPoolIdsBuffer.lastIndexOf(",");
			if (lastIndex != -1) {
				param.put("ids", failPoolIdsBuffer.substring(0, lastIndex));
				param.put("flag", 1);
				failOrderList = (List<PageData>) dao.findForList("WebOrderMapper.findCarPoolOrder", param);
				dao.update("WebOrderMapper.updateCarPool", param);
			}

			PageData notice = new PageData();
			if (successOrderList != null) {
				for (PageData order : successOrderList) {// 处理成功订单，发送提示
					notice.put("message", "您的订单《" + order.getString("order_code") + "》拼车成功");
					notice.put("msgType", "notice");
					notice.put("msgSource", replacOrderType(order.getString("order_type")));
					notice.put("toUserId", order.getLong("user_id"));
					notice.put("biuldId", order.getLong("id"));
					notice.put("biuldTitle", "您的订单《" + order.getString("order_code") + "》拼车成功");
					dao.save("WebMessageMapper.addMessage", notice);
					notice.clear();
					System.out.println("订单"+order.getString("order_code")+"拼车成功操作成功");
				}
			}
			if (failOrderList != null) {
				for (PageData order : failOrderList) {// 处理失败订单，发送提示，并且关闭订单
					notice.put("message", "您的订单《" + order.getString("order_code") + "》拼车失败");
					notice.put("msgType", "notice");
					notice.put("msgSource", replacOrderType(order.getString("order_type")));
					notice.put("toUserId", order.getLong("user_id"));
					notice.put("biuldId", order.getLong("id"));
					notice.put("biuldTitle", "您的订单《" + order.getString("order_code") + "》拼车失败");
					dao.save("WebMessageMapper.addMessage", notice);
					notice.clear();
					if ("PAY_OK".equals(order.get("order_state"))) {
						dao.update("WebOrderMapper.refundPoolOrder", order);
					} else if ("WAITPAY".equals(order.get("order_state"))) {
						dao.update("WebOrderMapper.closePoolOrder", order);
					}
					dao.update("WebOrderMapper.updateRefundTime", order);
					System.out.println("订单"+order.getString("order_code")+"拼车失败操作成功");
				}
			}
			// noticeOrderList=null;
			notice = null;
			successOrderList = null;
			failOrderList = null;
			successPoolIdsBuffer = null;
			failPoolIdsBuffer = null;
			list = null;
			System.gc();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===拼车结束任务异常===");
			System.out.println("订单列表:" + list);
		}
	}

	/**
	 * 根据订单类型替换对应来源
	 * 
	 * @return
	 */
	private String replacOrderType(String orderType) {
		for (int i = 0; i < order_type_arr.length; i++) {
			if (order_type_arr[i].equals(orderType)) {
				return resource_type_arr[i];
			}
		}
		return null;
	}
}
