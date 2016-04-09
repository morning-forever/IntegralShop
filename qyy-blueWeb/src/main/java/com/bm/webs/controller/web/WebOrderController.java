package com.bm.webs.controller.web;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.web_alipay.config.AlipayConfig;
import com.bm.common.util.web_alipay.util.AlipaySubmit;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebOrderService;

@Controller(value = "webOrderController")
@RequestMapping(value = "allowAccess/orders")
public class WebOrderController extends BaseController {

	@Autowired
	private WebOrderService webOrderService;

	/**
	 * 跳到支付页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toPay")
	public ModelAndView toPay() {
		ModelAndView mav = new ModelAndView("web/common/payment");
		try {
			PageData params = this.getPageData();
			DecimalFormat df=new DecimalFormat("0.00");
			params.put("realPrice", df.format(params.getDouble("realPrice")));
			Long orderId = params.getLong("orderId");
			boolean isOk = webOrderService.checkOrderState(orderId, XConst.ORDER_STATE.WAITPAY.toString());
			if (!isOk) {
				mav = new ModelAndView("web/home");
				return mav;
			}
			mav.addObject("detail", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 开始支付
	 * 
	 * @return
	 */
	@RequestMapping(value = "pay")
	@ResponseBody
	public ModelAndView pay() {
		ModelAndView mav = new ModelAndView("web/common/alipay");
		try {
			PageData params = this.getPageData();
			Long orderId = params.getLong("orderId");
			String orderType = params.getString("orderType");
			if (HString.isEmpty(orderType) || HString.isEmpty(orderId)) {
				return new ModelAndView("404");
			}
			Map<String, String> map = new HashMap<String, String>();

			@SuppressWarnings("unused")
			Double realPrice = webOrderService.findRealPriceByOrderId(orderId);

//			double percent = 0.01;
			double percent = realPrice;
			map.put("service", "create_direct_pay_by_user");
			map.put("partner", AlipayConfig.partner);
			map.put("_input_charset", AlipayConfig.input_charset);
			map.put("payment_type", "1");
			map.put("notify_url", ConfigLoad.getStringValue("webapp.site") + "app/center/order/callback?orderId=" + orderId + "&orderType=" + orderType);
			map.put("return_url", ConfigLoad.getStringValue("webapp.site") + "allowAccess/orders/callback?orderId=" + orderId + "&orderType=" + orderType);
			String show_url = "";
			if("depth".equals(orderType)){
				show_url = ConfigLoad.getStringValue("webapp.site") + "pc/user/order/orderDetial/"+orderId;
			}else{
				show_url = ConfigLoad.getStringValue("webapp.site") + "pc/user/order/detail/"+orderId;
			}
			
			map.put("show_url", show_url);
			map.put("seller_email", AlipayConfig.seller_email);
			map.put("out_trade_no", orderId + "");
			map.put("subject", "欢迎您使用黔易游服务");
			map.put("total_fee", percent + "");
			map.put("body", "您需要支付订单金额：" + percent + "元");
			// TODO 真实环境切换
			// map.put("total_fee", realPrice + "");
			// map.put("body", "您需要支付订单金额：" + realPrice + "元");
			map.put("anti_phishing_key", "");
			map.put("exter_invoke_ip", "");
			String sHtmlText = AlipaySubmit.buildRequest(map, "post", "确认");
			super.getRequest().setAttribute("text", sHtmlText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 支付回调
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "callback")
	public ModelAndView payResult() {
		ModelAndView mav = new ModelAndView();
		try {
			Map requestParams = super.getRequest().getParameterMap();
			Map<String, String> param = new HashMap<String, String>();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), AlipayConfig.input_charset);
				param.put(name, valueStr);
			}

			System.out.println("param :" + param);
			String view = "redirect:result";
			PageData params = super.getPageData();
			Long orderId = params.getLong("orderId");
			String orderType = params.getString("orderType");

			boolean isVerfy = true; // AlipayNotify.verify(param);
			if (isVerfy) {
				if ("TRADE_SUCCESS".equals(params.getString("trade_status"))) {
					String trade_no = params.getString("trade_no");
					boolean isOk = true; //webOrderService.checkOrderState(orderId, XConst.ORDER_STATE.WAITPAY.toString());
					if (isOk) {
						boolean isPayOk = webOrderService.updateOrderPay(orderId, orderType, "alipay", trade_no);
						if (isPayOk) {
							mav.addObject("payState", "success");
						}
					} else {
						mav.addObject("payState", "payed");
					}
				}
			}
			mav.addObject("orderId", orderId);
			mav.addObject("orderType", orderType);
			mav.setViewName(view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 跳转页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "result")
	public ModelAndView result() {
		ModelAndView mav = new ModelAndView();
		PageData param = super.getApiPageData();
		mav.addObject("orderId", param.getLong("orderId"));
		mav.addObject("orderType", param.getString("orderType"));
		String payState = param.getString("payState");
		if (XConst.SUCCESS.equals(payState)) {
			mav.setViewName("web/common/payment_success");
		} else {
			mav.addObject("payState", payState);
			mav.setViewName("web/common/payment_fail");
		}
		return mav;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
