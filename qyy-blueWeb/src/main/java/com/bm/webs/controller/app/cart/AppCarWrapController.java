package com.bm.webs.controller.app.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;
import com.bm.webs.service.web.cart.WebCarWrapService;

@Controller
@RequestMapping(value = "app/cart/wrap")
public class AppCarWrapController extends BaseController {

	@Autowired
	private WebOrderService webOrderService;

	@Autowired
	private WebCarSafeService webCarSageService;

	@Autowired
	private HomeService homeService;

	@Autowired
	private WebCarRuleService webCarRuleService;

	@Autowired
	private WebCarWrapService webCarWrapService;

	@Autowired
	private WebCarDatePriceService webCarDatePriceService;

	/**
	 * 包车车辆选择
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitCar")
	@ResponseBody
	public PageData submitCar() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String carId = pd.getString("carId");// 车辆
			String wrapNum = pd.getString("wrapNum");// 租车数
			if (ValidateHelper.isNullOrEmpty(carId)
					|| ValidateHelper.isNullOrEmpty(wrapNum)
					|| ValidateHelper.isNullOrEmpty(pd.getString("startTime"))
					|| ValidateHelper.isNullOrEmpty(pd.getString("endTime"))) {
				res.putStatus(XConst.PARAM_ERR);
			} else {
				Map<String, Object> order = new HashMap<String, Object>();
				// 根据出发时间和结束时间得到价格列表
				pd.put("id", carId);
				List<PageData> datePriceList = webCarDatePriceService
						.findListByDate(pd);
				order.put("days", datePriceList.size());// 天数
				Double countPricePerCar = 0d;
				StringBuffer dayPriceBuffer=new StringBuffer();
				for (int i = 0; i < datePriceList.size(); i++) {
					PageData p = datePriceList.get(i);
					Double item = (Double) p.get("price");
					countPricePerCar += item;
					dayPriceBuffer.append(item);
					dayPriceBuffer.append(",");
				}
				order.put("dayPrice", dayPriceBuffer.substring(0, dayPriceBuffer.lastIndexOf(",")));
				order.put("countPricePerCar", countPricePerCar);// 每辆车总费用

				PageData param = new PageData();
				param.put("type", "wrap");
				PageData safe = webCarSageService.findByType(param);
				order.put("safe", safe.get("price"));// 保险单价

				Double safeCount = datePriceList.size()
						* (Double) safe.get("price");
				order.put("safeCount", safeCount);// 保险总费用
				order.put("wrapFee", 0);// 手续费
				int num = Integer.parseInt(wrapNum);
				order.put("totalPrice", countPricePerCar * num + safeCount
						* num + 0);// 订单总价

				order.put("rules", webCarRuleService.findRuleByType(param));// 包车规则
				res.putData("order", order);
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 包车提交订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitOrder")
	@ResponseBody
	public PageData submitOrder() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			boolean isSuccess = checkParam("submitOrder", param, new String[] {
					"carId", "startTime", "endTime", "fromCityId",
					"fromAddrDetail", "goodsCount", "realPrice","dayPrice", "userId",
					"isSafe", "startAddrId", "endAddrId", "rank", "personName",
					"personPhone" }, new String[] { "车辆id", "出发时间", "结束时间",
					"出发城市id", "出发详细地址", "包车数量", "总价格","详细价格", "用户id", "是否需要保险",
					"起始地址拼接id", "结束地址拼接id", "排序拼接id", "联系人姓名", "联系人电话号码" });
			if (isSuccess) {
				if (!isTokenSuccess(param))// 检查token
					return param;
				// 业务处理
				Long orderId = webCarWrapService.saveOrder(param);
				res.putData("orderId", orderId);// 返回订单号
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);

				// 更新token
				updateNewToken(param);
				String newToken = param.getString(XConst.API_TOKEN_KEY);
				res.putData(XConst.API_TOKEN_KEY, newToken);
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取包车车辆List数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			String pageNo = pd.getString("pageNo");
			String pageSize = pd.getString("showLine");
			if (ValidateHelper.isNullOrEmpty(pageNo)
					|| ValidateHelper.isNullOrEmpty(pageSize)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> list = homeService.findCarWrapList(
						Long.parseLong(pageSize), Long.parseLong(pageNo), pd);
				res.putData("wrapList", list);
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取包车座位数类型列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "seatList")
	@ResponseBody
	public PageData seatList() {
		PageData res = new PageData();
		try {
			List<PageData> list = webCarWrapService.getWrapTypeList();
			res.putData("seatList", list);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
