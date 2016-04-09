package com.bm.webs.controller.system.businessSystem;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.MerchUser;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.system.urrm.UserService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebOrderService;

@RequestMapping(value = "merchSystem/order")
@Controller
public class MerchOrderController extends BaseController {

	@Autowired
	private WebOrderService webOrderService;

	@Autowired
	private UserService userService;

	@Autowired
	private MerchUserService merchUserService;

	@Autowired
	private WebCitysService webCitysService;

	
	private static SimpleDateFormat DATE_FORMAT=new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 
	 * 跳转到订单列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "listPage")
	public ModelAndView listPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("businessSystem/order/order_list");

		return mav;
	}

	/**
	 * 
	 * 查看订单信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "check")
	public ModelAndView check(Long id) {
		ModelAndView mav = new ModelAndView();

		try {
			
			PageData map = new PageData();
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			if (merchUser.getMerchType() == 1) {
				PageData orderMap = webOrderService.findScenicOrderDetialById(id);

				String specificAddress = webCitysService.getSpecificAddress((Long) orderMap.get("at_area_id"));

				mav.addObject("order", orderMap);
				mav.addObject("specificAddress", specificAddress);
				
				mav.setViewName("businessSystem/order/scenicOrderDetial");
			} else if (merchUser.getMerchType() == 2) {
				PageData orderMap = webOrderService.findHotelOrderDetialById(id);
				
				
				System.out.println(orderMap.get("stay_in_time"));
				
				Date stayInDate=DATE_FORMAT.parse(orderMap.get("stay_in_time").toString());
				Date leaveDate=DATE_FORMAT.parse(orderMap.get("leave_time").toString());
				
				Long days=(leaveDate.getTime()-stayInDate.getTime())/86400000;
				
				mav.addObject("order", orderMap);
				mav.addObject("diffDays", days);
				
				mav.setViewName("businessSystem/order/scenic_order_detial");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 
	 * 返回列表内容List
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData map = getSysPageData();

		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);

			AdminUser adminUser = userService.findUser(sysset.getU().getId());

			map.put("id", adminUser.getId());

			MerchUser merchUser = merchUserService.findMerchUser(map);

			String user = null;
			String orderId = null;
			String payId = null;
			String phone = null;
			String status = null;
			String serchDate = null;
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				user = (String) json.get("user");
				orderId = (String) json.get("orderId");
				payId = (String) json.get("payId");
				phone = (String) json.get("phone");
				status = (String) json.get("status");
				serchDate = (String) json.get("Serchdate");
			}

			List<PageData> list = null;
			Long countNum = 0l;
			String orderType = "";

			if (merchUser.getMerchType() == 1) {
				orderType = "scenic";
			} else if (merchUser.getMerchType() == 2) {
				orderType = "hotel";
			}
			list = webOrderService.findHotelOrderList(map, merchUser.getId(), user, orderId, payId, phone,
					status, serchDate, orderType);
			countNum = webOrderService.findHotelOrderListCount(map, merchUser.getId(), user, orderId, payId,
					phone, status, serchDate, orderType);

			map.clear();

			map.put("data", list);

			map.put("recordsTotal", countNum);
			map.put("reacordsFiltered", countNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 删除订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "delete", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webOrderService.deleteOrders(ids);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 关闭订单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "close", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData close(String id) {
		PageData map = new PageData();
		try {
			webOrderService.closeOrders(id);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

	
}
