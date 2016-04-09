package com.bm.webs.controller.system.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebDepthService;
import com.bm.webs.service.system.AdminOrderService;
import com.bm.webs.service.web.WebOrderService;

/**
 * 后台主题深度游订单管理
 * 
 * @author jiangl <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "admin/order/depth")
public class AdminDepthOrderController extends BaseController {

	@Autowired
	private WebDepthService webDepthService;// 深度游

	@Autowired
	private AdminOrderService adminOrderService;//后台订单
	
	@Autowired
	private WebOrderService webOrderService;//订单
	
	private final static String[] ALLOWED_ORDER_TYPE_ARR=new String[]{"REFUNDED","PAY_OK","CLOSED","REFUNDING_FAIL"};
	
	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView depthIndex() {
		ModelAndView mav = new ModelAndView("system/order/admin_depth_order_list");
		return mav;
	}

	/**
	 * 查询深度游列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("nickName", json.get("nickName"));
				param.put("orderCode", json.get("orderCode"));
				param.put("payOrderId", json.get("payOrderId"));
				param.put("personPhone", json.get("personPhone"));
				param.put("orderState", json.get("orderState"));
				param.put("orderTime", json.get("orderTime"));
			}
			res = adminOrderService.findDepthOrderList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询明细
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/order/admin_depth_order_info");
		try {
			PageData param = getSysPageData();
			Long orderId = param.getLong("orderId");
			PageData depthOrder = webOrderService.findDepthOrderDetail(orderId, "webCover");
			List<PageData> personList = webOrderService.findOrderPersonList(orderId);
			mav.addObject("nickName", param.get("nickName"));
			mav.addObject("depthOrder", depthOrder);
			mav.addObject("personList", personList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 取消订单
	 * @param id
	 * @return
	 */
	@RequestMapping(value="canelOrder",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData canelOrder(Long id){
		PageData pd=getApiPageData();
		try {
			pd.put("id", id);
			Long checkId = webOrderService.checkCannel(pd);
			if(checkId != null){
				webOrderService.cannelOrder(pd);
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 删除订单
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteOrder",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteOrder(Long id){
		PageData pd=getApiPageData();
		try {
			pd.put("id", id);
			
			StringBuffer allowedOrderTypeBuffer=new StringBuffer();
			for (int i = 0; i < ALLOWED_ORDER_TYPE_ARR.length; i++) {
				allowedOrderTypeBuffer.append("'");
				allowedOrderTypeBuffer.append(ALLOWED_ORDER_TYPE_ARR[i]);
				allowedOrderTypeBuffer.append("'");
				allowedOrderTypeBuffer.append(",");
			}
			
			String allowedOrderType=allowedOrderTypeBuffer.substring(0, allowedOrderTypeBuffer.lastIndexOf(","));
			pd.put("allowedOrderType", allowedOrderType);
			Long checkId=webOrderService.checkDelete(pd);
			if(checkId!=null){
				webOrderService.deleteOrder(pd);
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
