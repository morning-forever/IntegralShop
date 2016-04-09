package com.bm.webs.controller.system.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.cart.WebCarService;

/**
 * 后台租车订单Controller
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="admin/order/cart")
public class AdminCartOrderController extends BaseController{

	@Autowired
	private WebOrderService webOrderService;
	
	@Autowired
	private WebCarService webCarService;
	
	/**
	 * 跳转到列表页面
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		try {
			mav.setViewName("system/order/admin_car_order_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 获得订单List
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(Long type){
		List<PageData> list=null;
		PageData pd=null;
		try {
			pd=getSysPageData();
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("nickName", json.get("nickName"));
				pd.put("orderCode", json.get("orderCode"));
				pd.put("payOrderId", json.get("payOrderId"));
				pd.put("phone", json.get("phone"));
				pd.put("orderType", json.get("orderType"));
				pd.put("startDate", json.get("startDate"));
				pd.put("title", json.get("title"));
				pd.put("timeEndStr", json.get("timeEndStr"));
				pd.put("limit"	, json.get("limit"));
			}
			if(1==type){
				list=webOrderService.findCarRentOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(2==type){
				list=webOrderService.findCarWrapOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(3==type){
				list=webOrderService.findAdminBusCountList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(4==type){
				list=webOrderService.findAdminPoolCountList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查看订单详情
	 * @return
	 */
	@RequestMapping(value="check_{id}_{type}")
	public ModelAndView check(@PathVariable(value="id") Long id,
			@PathVariable(value="type") Long type){
		ModelAndView mav=new ModelAndView();
		try {
			Map<String, Object> map=null;
			PageData pd=new PageData();
			pd.put("id", id);
			if(type==1){
				map=webOrderService.findCarRentOrderDetial(pd);
				mav.addObject("map",map);
				mav.setViewName("system/order/admin_car_rent_order_info");
			}else if(type==2){
				map=webOrderService.findCarWrapOrderDetial(pd);
				List<Map<String, Object>> list = webOrderService.findCarWrapAddrList(pd);
				mav.addObject("list",list);
				mav.addObject("map",map);
				mav.setViewName("system/order/admin_car_wrap_order_info");
				
			}else if(type==3){
				
				map = webOrderService.findCarBusOrderDetial(pd);
				List<Map<String, Object>> list=webOrderService.findCarBusOrderPersonList(pd);
				mav.addObject("list",list);
				mav.addObject("map",map);
				mav.setViewName("system/order/admin_car_bus_order_info");
				
			}else if(type==4){
				map = webOrderService.findCarPoolOrderDetial(pd);
				List<Map<String, Object>> list=webOrderService.findCarPoolOrderPersonList(pd);
				mav.addObject("list",list);
				mav.addObject("map",map);
				mav.setViewName("system/order/admin_car_pool_order_info");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转到Bus详情页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkBusList_{id}_{date}",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView checkBusList(@PathVariable(value="id") Long id,
			@PathVariable(value="date") String date){
		ModelAndView mav=new ModelAndView();
		try {
			Map<String, Object> map=webCarService.findCarBus(id);
			mav.addObject("map", map);
			mav.addObject("date", date);
			mav.addObject("busId", id);
			mav.setViewName("system/order/admin_bus_order_detial_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转到平车详情页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkPoolList_{id}",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView checkPoolList(@PathVariable(value="id") Long id){
		ModelAndView mav=new ModelAndView();
		try {
			Map<String, Object> map=webCarService.findCarPool(id);
			mav.addObject("map", map);
			mav.addObject("poolId", id);
			mav.setViewName("system/order/admin_pool_order_detial_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 查询详情List
	 * @return
	 */
	@RequestMapping(value="detialList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData detialList(Long type,Long busId,String date){
		PageData pd=getSysPageData();
		try {
			List<PageData> list=null;
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("nickName", json.get("nickName"));
				pd.put("orderCode", json.get("orderCode"));
				pd.put("payOrderId", json.get("payOrderId"));
				pd.put("phone", json.get("phone"));
				pd.put("orderType", json.get("orderType"));
				pd.put("startDate", json.get("startDate"));
			}
			if(type==1){
				pd.put("busId", busId);
				pd.put("date", date);
				list=webOrderService.findCarBusOrderList(pd);
			}else if(type==2){
				pd.put("wccid", busId);
				list=webOrderService.findCarPoolOrderList(pd);
			}
			pd.put("data", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 删除订单
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deletes",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes(String ids){
		PageData pd=getApiPageData();
		try {
			Integer lastIndex=ids.lastIndexOf(",");
			if(lastIndex!=-1){
				ids=ids.substring(0, lastIndex);
			}
			webOrderService.deleteOrders(ids);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	@RequestMapping(value="deletesCar",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletesCar(String ids,Long type){
		PageData pd=getApiPageData();
		try {
			Integer lastIndex=ids.lastIndexOf(",");
			if(lastIndex!=-1){
				ids=ids.substring(0, lastIndex);
			}
			if(3==type){
				webOrderService.deletesBus(ids);
				pd.putStatus(XConst.SUCCESS);
			}else if(4==type){
				webOrderService.deletesPool(ids);
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 跳转到退款订单列表页面
	 * @return
	 */
	@RequestMapping(value="refundIndex")
	public ModelAndView refundIndex(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("system/order/admin_car_refund_order_list");
		return mav;
	}
	
	/**
	 * 查询退款订单List
	 * @return
	 */
	@RequestMapping(value="refundOrderList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData refundOrderList(Long type){
		PageData pd=getSysPageData();
		List<PageData> list=null;
		try {
			pd=getSysPageData();
			pd.put("orderTypes", "'REFUNDING','REFUNDING_UNPOOL','REFUNDING_FAIL','REFUNDED'");
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("title"	, json.get("title"));
				pd.put("nickName", json.get("nickName"));
				pd.put("orderCode", json.get("orderCode"));
				pd.put("payOrderId", json.get("payOrderId"));
				pd.put("orderType"	, json.get("orderType"));
				
				pd.put("personName"	, json.get("personName"));
				pd.put("bankName"	, json.get("bankName"));
				pd.put("bankCard"	, json.get("bankCard"));
				
				pd.put("startTime"	, json.get("startTime"));
				pd.put("carCard"	, json.get("carCard"));
			}
			if(1==type){
				list=webOrderService.findCarRentOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(2==type){
				list=webOrderService.findCarWrapOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(3==type){
				list=webOrderService.findCarBusOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}else if(4==type){
				list=webOrderService.findCarPoolOrderList(pd);
				pd.putStatus(XConst.SUCCESS);
				pd.put("data", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 审核退款
	 * @return
	 */
	@RequestMapping(value="examineRefund",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData examineRefund(){
		PageData pd=getApiPageData();
		try {
			webOrderService.updateExamineRefund(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 修改退款状态
	 * @return
	 */
	@RequestMapping(value="submitRefundState",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitRefundState(){
		PageData pd=getApiPageData();
		try {
			webOrderService.submitRefundState(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查询审核记录
	 * @return
	 */
	@RequestMapping(value="examineList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData examineList(){
		PageData pd=getApiPageData();
		try {
			Map<String, Object> map=webOrderService.findorderUser(pd);
			List<Map<String, Object>> list=webOrderService.findOrderExamineList(pd);
			pd.put("list", list);
			pd.put("map", map);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
