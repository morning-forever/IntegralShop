package com.bm.webs.controller.web.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bm.webs.controller.BaseController;

/**
 * pc端智易行（黔易游）
 * 
 * @author mike <br>
 *         2015年9月1日
 */
@Controller(value = "webSimpleController")
@RequestMapping(value = "pc/simple")
public class SimpleController extends BaseController {

	@RequestMapping(value = "travelDetail")
	public ModelAndView travelDetail() {
		ModelAndView mav = new ModelAndView("web/simple/travel_detail");
		return mav;
	}

	@RequestMapping(value = "budgetDetail")
	public ModelAndView budgetDetail() {
		ModelAndView mav = new ModelAndView("web/simple/budget_detail");
		return mav;
	}

	@RequestMapping(value = "equipList")
	public ModelAndView equipList() {
		ModelAndView mav = new ModelAndView("web/simple/equip_list");
		return mav;
	}

	@RequestMapping(value = "downlineActivity")
	public ModelAndView downlineActivity(String op) {
		ModelAndView mav = null;

		if ("scenic".equals(op)) {
			mav = new ModelAndView("web/simple/downline_activity_scenic");
		} else if ("hotel".equals(op)) {
			mav = new ModelAndView("web/simple/downline_activity_hotel");
		} else if ("depth".equals(op)) {
			mav = new ModelAndView("web/simple/downline_activity_depth");
		}

		return mav;
	}

	/**
	 * 预定
	 * 
	 * @return
	 */
	@RequestMapping(value = "destine")
	public ModelAndView destine() {
		ModelAndView mav = new ModelAndView("web/simple/destine_order");
		return mav;
	}

	/**
	 * 提交到支付页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "payment")
	public ModelAndView payment() {
		ModelAndView mav = new ModelAndView("web/common/payment");
		return mav;
	}

	/**
	 * 支付返回
	 * 
	 * @return
	 */
	@RequestMapping(value = "paymentResult")
	public ModelAndView paymentResult(String op) {
		ModelAndView mav = null;
		if ("success".equals(op)) {
			mav = new ModelAndView("web/common/payment_success");
		} else {
			mav = new ModelAndView("web/common/payment_fail");
		}
		return mav;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
