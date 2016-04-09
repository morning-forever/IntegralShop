package com.bm.webs.controller.web.cart;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.date.TimeHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebHomeBannerService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarRuleService;

/**
 * 快旅出行模块
 * 
 * @author mike <br>
 *         2015年9月1日
 */
@Controller(value = "webCartController")
@RequestMapping(value = "pc/cart")
public class CartController extends BaseController {

	@Autowired
	private WebCarRuleService carRuleService;

	@Autowired
	private WebCarAddrsService carAddrsService;

	@Autowired
	private WebHomeBannerService homeBannerService;// banner

	@RequestMapping(value = "home")
	public ModelAndView cartIndex() {
		ModelAndView mav = new ModelAndView("web/cart/cart_home");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			List<PageData> list = carRuleService.findListToIndex();
			Map<String, String> map = new HashMap<String, String>();
			for (PageData pd : list) {
				map.put(pd.getString("ruleType"), pd.getString("depict"));
			}
			// 拼车默认时间
			Long nowTime = new Date().getTime();
//			nowTime += 1000 * 60 * 60 * 24;
			nowTime += 1000 * 60 * 60 * 2;
			Date startDate = new Date(nowTime);
			String poolStartTime = sdf.format(startDate);
			mav.addObject("poolStartTime", poolStartTime);

			mav.addObject("rules", map);

			// 目的地-包车
			List<PageData> addrList = carAddrsService.findListByType("wrap");
			mav.addObject("addrList", addrList);

			// 获取首页的banner图
			String type = "cart";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if (!HString.isEmpty(bannerList)) {
				mav.addObject("bannerList", bannerList);
				int[] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "valTime")
	@ResponseBody
	public PageData valTime() {
		PageData res = new PageData(true);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			PageData params = this.getPageData();
			String endTime = params.getString("startTime");
			Long day = TimeHelper.dayDiff(sdf.format(new Date()), endTime, "yyyy-MM-dd HH:mm");
			if (day > 0) {
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "valTime2Hour")
	@ResponseBody
	public PageData valTime2Hour() {
		PageData res = new PageData(true);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			PageData params = this.getPageData();
			String endTime = params.getString("startTime");

			long start = new Date().getTime();
			long end = sdf.parse(endTime).getTime();

			if ((end - start) > (2 * 1000 * 60 * 60))
				res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "cityList")
	@ResponseBody
	public PageData cityList() {
		PageData pd = new PageData(true);
		try {
			List<PageData> list = carAddrsService.findListByType("city");
			pd.put("cityList", list);
			pd.putStatus(XConst.SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	@RequestMapping(value = "search")
	public ModelAndView search(String op) {
		ModelAndView mav = null;
		if ("rent".equals(op)) {
			mav = new ModelAndView("web/cart/rent_list");
		} else if ("bus".equals(op)) {
			mav = new ModelAndView("web/cart/bus_list");
		} else if ("carpool".equals(op)) { // 包车/拼车信息表
			mav = new ModelAndView("web/cart/carpool_list");
		} else if ("wrap".equals(op)) {
			mav = new ModelAndView("web/cart/wrap_list");
		}
		return mav;
	}

	@RequestMapping(value = "detail")
	public ModelAndView detail(String op) {
		ModelAndView mav = null;
		if ("rent".equals(op)) {
			mav = new ModelAndView("web/cart/rent_detail");
		} else if ("bus".equals(op)) {
			mav = new ModelAndView("web/cart/bus_detail");
		} else if ("carpool".equals(op)) { // 包车/拼车信息表
			mav = new ModelAndView("web/cart/carpool_detail");
		} else if ("wrap".equals(op)) {
			mav = new ModelAndView("web/cart/wrap_detail");
		}
		return mav;
	}

	@RequestMapping(value = "start")
	public ModelAndView start() {
		ModelAndView mav = null;
		mav = new ModelAndView("web/cart/carpool_start");
		return mav;
	}

	@RequestMapping(value = "destine")
	public ModelAndView destine(String op) {
		ModelAndView mav = null;
		if ("rent".equals(op)) {
			mav = new ModelAndView("web/cart/destine_order");
		} else if ("bus".equals(op)) {
			mav = new ModelAndView("web/cart/destine_order");
		} else if ("carpool".equals(op)) { // 包车/拼车信息表
			mav = new ModelAndView("web/cart/destine_order");
		} else if ("wrap".equals(op)) {
			mav = new ModelAndView("web/cart/destine_order");
		}
		return mav;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
