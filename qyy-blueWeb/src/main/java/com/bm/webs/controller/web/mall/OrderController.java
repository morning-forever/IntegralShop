package com.bm.webs.controller.web.mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bm.webs.controller.BaseController;

@Controller
@RequestMapping(value = "pc/order")
public class OrderController extends BaseController {

	//-----------------------景区-------------------------
	@RequestMapping(value = "scenic")
	public ModelAndView scenicIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic");
		return mav;
	}
	
	@RequestMapping(value = "scenic/pay")
	public ModelAndView scenicPayIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_pay");
		return mav;
	}

	@RequestMapping(value = "scenic/pay1")
	public ModelAndView scenicPay1Index() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_pay1");
		return mav;
	}
	
	@RequestMapping(value = "scenic/pay2")
	public ModelAndView scenicPay2Index() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_pay2");
		return mav;
	}
	
	@RequestMapping(value = "scenic/payClose")
	public ModelAndView scenicPayCloseIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_pay_close");
		return mav;
	}
	
	@RequestMapping(value = "scenic/refund")
	public ModelAndView scenicRefundIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_refund");
		return mav;
	}
	
	@RequestMapping(value = "scenic/refund1")
	public ModelAndView scenicRefund1Index() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_refund1");
		return mav;
	}
	
	@RequestMapping(value = "scenic/evaluateYes")
	public ModelAndView scenicEvaluateYesIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_evaluate_yes");
		return mav;
	}
	
	@RequestMapping(value = "scenic/evaluateNo")
	public ModelAndView scenicEvaluateNoIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_scenic_evaluate_no");
		return mav;
	}
	
	//-----------------------酒店-------------------------
	@RequestMapping(value = "hotel")
	public ModelAndView hotelIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_hotel");
		return mav;
	}
	
	@RequestMapping(value = "hotel/pay")
	public ModelAndView hotelPayIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_hotel_pay");
		return mav;
	}
	
	@RequestMapping(value = "hotel/payClose")
	public ModelAndView hotelPayCloseIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_hotel_pay_close");
		return mav;
	}
	
	@RequestMapping(value = "hotel/paySuccess")
	public ModelAndView hotelPaySuccessIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_hotel_pay_success");
		return mav;
	}
	
	@RequestMapping(value = "hotel/evaluateNo")
	public ModelAndView hotelevaluateNoIndex() {
		ModelAndView mav = new ModelAndView("web/mall/order_mall_hotel_evaluate_no");
		return mav;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
