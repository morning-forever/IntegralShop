package com.bm.webs.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.config.ConfigLoad;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.util.SMSHelper;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 后台订单Service
 * 
 * @author Daisy
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class AdminOrderService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取深度游订单列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findDepthOrderList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("AdminOrderMapper.findDepthOrderListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("AdminOrderMapper.findDepthOrderList", param);
		param.clear();
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取深度游退款列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findDepthRefundList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("AdminOrderMapper.findDepthRefundListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("AdminOrderMapper.findDepthRefundList", param);
		param.clear();
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 审核
	 * @throws Exception
	 */
	public void saveCheck(PageData param) throws Exception {
		//修改审核状态为已审核
		dao.update("AdminOrderMapper.updateCheck", param);
	}
	
	/**
	 * 退款成功和退款失败
	 * @param param
	 * @throws Exception
	 */
	public void saveRefund(PageData param) throws Exception {
		//新增一条审核记录
		dao.save("AdminOrderMapper.addExamine", param);
		
		//修改订单状态
		PageData orderData = new PageData();
		orderData.put("orderId", param.get("orderId"));
		orderData.put("oldState", "REFUNDING");
		orderData.put("newState", param.get("state"));
		dao.update("WebOrderMapper.updateOrderState", orderData);
		
		//若退款成功，则修改退款完成时间
		if(param.getLong("result") == 0){
			dao.update("AdminOrderMapper.updateCheck", param);
		}
		
		//退库成功和退款失败都发送短信
		PageData mesInfo = findRefundInfo(param.getLong("orderId"));
		String mobile = mesInfo.getString("person_phone");
		String refundResult = (param.getLong("result") == 0)?"退款成功":"退款失败";
		String mes = "尊敬的"+mesInfo.getString("person_name")+"，您的订单号："+mesInfo.getString("order_code")+refundResult
				+"，如有疑问请联系黔易游客服：" + ConfigLoad.getStringValue("SMS.CONTENT_TEL") + "，我们将竭诚为您服务，祝您旅途愉快！";
		SMSHelper.sendSMS(mobile, mes);
	}
	
	/**
	 * 检验订单是否可以审核 只有退款中的订单才可以审核
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public boolean checkExamine(Long orderId) throws Exception {
		PageData param = new PageData();
		param.put("orderId", orderId);
		Integer total = (Integer) dao.findForObject("AdminOrderMapper.checkExamine", param);
		if(total == 0){
			return false;
		}
		return true;
	}
	
	/**
	 * 获取审核记录列表
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findExamineList(Long orderId) throws Exception {
		PageData param = new PageData();
		param.put("orderId", orderId);
		return (List<PageData>)dao.findForList("AdminOrderMapper.findExamineList", param);
	}
	
	/**
	 * 获取审核记录信息
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public PageData findRefundInfo(Long orderId) throws Exception {
		PageData param = new PageData();
		param.put("orderId", orderId);
		return (PageData)dao.findForObject("AdminOrderMapper.findRefundInfo", param);
	}
	
}
