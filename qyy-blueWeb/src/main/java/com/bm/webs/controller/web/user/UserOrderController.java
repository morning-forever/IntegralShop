package com.bm.webs.controller.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebEvaluataService;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 
 * 前台用户订单Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping("pc/user/order")
public class UserOrderController extends BaseController {

	@Autowired
	private WebUserService userService;

	@Autowired
	private WebOrderService webOrderService;// 订单

	@Autowired
	private WebEvaluataService webEvaluataService;// 评价

	private final static Integer PAGE_SIZE = 10;
	
	//可删除订单类型
	private final static String[] ALLOWED_ORDER_TYPE_ARR=new String[]{"REFUNDED","PAY_OK","CLOSED","REFUNDING_FAIL"};
	//可退款订单类型
	private final static String[] REFUND_ORDER_TYPE_ARR=new String[]{"PAY_OK","REFUNDING_FAIL"};

	/**
	 * 
	 * 跳转到订单列表
	 * 
	 * @return
	 */
	@RequestMapping("/rentList")
	public ModelAndView rentList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("web/home/user_rent_car_order");
		try {
			PageData param = getPageData();
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("tabIndex", param.get("tabIndex"));
			mav.addObject("user", webUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	/**
	 * 
	 * 查询车订单列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/data", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData rentDate(String type, Integer pageNo, String evaluate, String payType) {
		PageData map = new PageData();
		try {
			Long userId = getLoginUser().getId();
			List<PageData> list = null;
			if ("rent".equals(type)) {
				list = webOrderService.findCarRentOrderList((pageNo - 1) * PAGE_SIZE, PAGE_SIZE, map, evaluate, payType, userId);
			} else if ("wrap".equals(type)) {
				list = webOrderService.findCarWrapOrderList((pageNo - 1) * PAGE_SIZE, PAGE_SIZE, map, evaluate, payType, userId);
			} else if ("bus".equals(type)) {
				list = webOrderService.findCarBusOrderList((pageNo - 1) * PAGE_SIZE, PAGE_SIZE, map, evaluate, payType, userId);
			} else if ("carpool".equals(type)) {
				list = webOrderService.findCarPoolOrderList((pageNo - 1) * PAGE_SIZE, PAGE_SIZE, map, evaluate, payType, userId);
			}
			map.put("list", list);
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 查看订单详情
	 * @return
	 */
	@RequestMapping(value="orderDetial/{id}",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView orderDetial(@PathVariable(value="id") Long id){
		ModelAndView mav=new ModelAndView();
		PageData param=new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		param.put("id", id);
		try {
			String cartType = webOrderService.findOrderTypeById(param);
			if ("carRent".equals(cartType)) {// 租车
				map = webOrderService.findCarRentOrderDetial(param);
				if(map!=null){
					mav.setViewName("web/home/user_cart_rent_order_detial");
				}else{
					mav.setViewName("web/home/user_rent_car_order");
				}
			} else if ("carWrap".equals(cartType)) {// 包车
				Map<String, Object> carWrapMap = webOrderService.findCarWrapOrderDetial(param);
				List<Map<String, Object>> list = webOrderService.findCarWrapAddrList(param);
				map.put("carWrapMap", carWrapMap);
				map.put("list", list);
				if(carWrapMap!=null){
					mav.setViewName("web/home/user_cart_wrap_order_detial");
				}else{
					mav.setViewName("web/home/user_rent_car_order");
				}
			} else if ("bus".equals(cartType)) {// 班车
				Map<String, Object> busMap = webOrderService.findCarBusOrderDetial(param);
				List<Map<String, Object>> personList=webOrderService.findCarBusOrderPersonList(param);
				map.put("busMap", busMap);
				map.put("personList", personList);
				if(busMap!=null){
					mav.setViewName("web/home/user_cart_bus_order_detial");
				}else{
					mav.setViewName("web/home/user_rent_car_order");
				}
			} else if ("carpool".equals(cartType)) {// 拼车
				Map<String, Object> carpool = webOrderService.findCarPoolOrderDetial(param);
				List<Map<String, Object>> personList=webOrderService.findCarPoolOrderPersonList(param);
				map.put("carpool", carpool);
				map.put("personList", personList);
				if(carpool!=null){
					mav.setViewName("web/home/user_cart_pool_order_detial");
				}else{
					mav.setViewName("web/home/user_rent_car_order");
				}
			}
			 
//			else	if("depth".equals(cartType)){//深度游订单详情
//					PageData depthOrder = webOrderService.findDepthOrderDetail(id, "webCover");
//					List<PageData> personList = webOrderService.findOrderPersonList(id);
//					mav.addObject("depthOrder", depthOrder);
//					mav.addObject("depthOrderJson", JSONObject.toJSON(depthOrder));
//					mav.addObject("personList", personList);
//					mav.setViewName("web/home/user_depth_order_detail");
//				}
			mav.addObject("map", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mav;
	}
	
	
	
	/**
	 * 申请退款
	 * @param id
	 * @return
	 */
	@RequestMapping(value="refund",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData refund(Long id){
		PageData pd=getApiPageData();
		try {
			pd.put("id", id);
			
			String orderType = getOrderTypes(REFUND_ORDER_TYPE_ARR);
			
			pd.put("orderTypes", orderType);
			Long checkId=webOrderService.checkRefund(pd);
			if(checkId!=null){
				webOrderService.refund(pd);
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
			pd.put("allowedOrderType", getOrderTypes(ALLOWED_ORDER_TYPE_ARR));
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

	/**
	 * 主题深度游订单页
	 * 
	 * @return
	 */
	@RequestMapping("/depthList")
	public ModelAndView depthList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("web/home/user_depth_order_list");
		try {
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			WebUser user = set.getWebUser();
			PageData webUser = userService.getDetail(user.getId());
			mav.addObject("user", webUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 深度游查询列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/depth/search")
	@ResponseBody
	public PageData depthSearch() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			param.put("userId", getWebLoginUser());// 当前登录用户id
			res = webOrderService.findPCDepthOrderList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 显示主题深度游-订单详情
	 * 
	 * @return
	 */
	@RequestMapping("/detail/{orderId}")
	public ModelAndView depthDetail(@PathVariable Long orderId) {
		ModelAndView mav = new ModelAndView();
		try {
			String orderType = webOrderService.findOrderType(orderId);//订单类型
			//深度游订单详情
			if("depth".equals(orderType)){
				PageData depthOrder = webOrderService.findDepthOrderDetail(orderId, "webCover");
				List<PageData> personList = webOrderService.findOrderPersonList(orderId);
				mav.addObject("depthOrder", depthOrder);
				mav.addObject("depthOrderJson", JSONObject.toJSON(depthOrder));
				mav.addObject("personList", personList);
				mav.setViewName("web/home/user_depth_order_detail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 跳转至评价页面
	 * 
	 * @return
	 */
	@RequestMapping("/evaluate")
	public ModelAndView toEvaluate() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData param = getPageData();
			PageData goodsInfo = webOrderService.findOrderEvaluateInfo(param.getLong("orderId"));
			mav.addObject("goodsInfo", goodsInfo);
			mav.setViewName("web/home/user_evaluate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 新增一条评价
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveEvaluate")
	@ResponseBody
	public PageData saveEvaluate() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			param.put("userId", getWebLoginUser());// 当前登录用户id
			param.put("forms", "depth");// 来自哪个版块
			param.put("picType", "depth");// 图片类型
			res = webEvaluataService.saveEvaluate(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 操作订单(删除或是取消订单)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/operOrder")
	@ResponseBody
	public PageData operOrder() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String oper = param.getString("oper");
			String orderId = param.getString("orderId");
			// 删除订单
			if ("delete".equals(oper)) {
				webOrderService.deleteOrders(orderId);
			}
			// 关闭订单
			else if ("close".equals(oper)) {
				webOrderService.closeOrders(orderId);
			}
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 跳转至退款页面
	 * 
	 * @return
	 */
	@RequestMapping("/refund/{orderId}")
	public ModelAndView toRefund(@PathVariable Long orderId) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("orderId", orderId);
			mav.setViewName("web/home/user_refund");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 保存申请退款信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveRefund")
	@ResponseBody
	public PageData saveRefund() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webOrderService.saveRefund(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	

	@Override
	protected String getMenuKey() {
		return null;
	}
	
	//返回指定类型订单字符串拼接
	private String getOrderTypes(String[] orderArr) {
		StringBuffer OrderTypeBuffer=new StringBuffer();
		for (int i = 0; i < orderArr.length; i++) {
			OrderTypeBuffer.append("'");
			OrderTypeBuffer.append(orderArr[i]);
			OrderTypeBuffer.append("'");
			OrderTypeBuffer.append(",");
		}
		
		return OrderTypeBuffer.substring(0, OrderTypeBuffer.lastIndexOf(","));
	}

}
