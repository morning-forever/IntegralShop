package com.bm.webs.controller.web.cart;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.AreaAll;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.AreaAllService;
import com.bm.webs.service.web.cart.WebCarCarpoolService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;

/**
 * 拼车
 * 
 * @author mike <br>
 *         2015年9月11日
 */
@Controller("webCarPoolController")
@RequestMapping(value = "pc/cart/pool")
public class WebCarCarpoolController extends BaseController {

	@Autowired
	private WebCarCarpoolService webCarpoolService;

	@Autowired
	private WebCarSafeService webCarSageService;

	@Autowired
	private WebCarRuleService carRuleServce;;

	@Autowired
	private AreaAllService areaAllService;

	/**
	 * 列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	public ModelAndView toIndex() {
		ModelAndView mav = new ModelAndView("web/cart/carpool_list");
		try {
			// 拼车默认时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Long nowTime = new Date().getTime();
			nowTime += 1000 * 60 * 60 * 2;
			Date startDate = new Date(nowTime);
			String poolStartTime = sdf.format(startDate);
			mav.addObject("poolStartTime", poolStartTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * list数据
	 * 
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "listData")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData data = this.getPageData();
			res = webCarpoolService.pageList(data.getLong("pageNo"), data.getLong("fromAddrId"), data.getLong("toAddrId"), data.getString("startTime"),
					data.getString("startTimeOrder"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 详情页
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	public ModelAndView detail(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView("web/cart/carpool_list");
		return mav;
	}

	/**
	 * 去生成订单页
	 * 
	 * @return
	 */
	@RequestMapping(value = "destineOrder")
	public ModelAndView destineOrder() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData res = null;
			PageData param = super.getPageData();
			param.put("type", "carpool");
			PageData safe = webCarSageService.findByType(param);
			PageData rule = carRuleServce.findRuleByType(param);
			Long id = param.getLong("id");
			if (!HString.isEmpty(id)) {
				res = webCarpoolService.detail(id);
				mav.addObject("detail", res);
				mav.setViewName("web/cart/pool_destine_order");
			} else {
				res = webCarpoolService.findPoolStartDetail(param.getLong("fromAddrId"), param.getLong("toAddrId"));
				res.put("startTime", param.get("startTime"));
				mav.addObject("detail", res);
				mav.setViewName("web/cart/pool_start");
			}
			mav.addObject("safe", safe);
			mav.addObject("rule", rule);
			List<AreaAll> areaList = areaAllService.findAreaByParentId(0l);
			mav.addObject("areaList", areaList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 保存订单信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitOrder")
	@ResponseBody
	public PageData submitOrder() {
		PageData res = new PageData(true);
		try {
			PageData params = super.getPageData();
			String vcode = (String) this.getRequest().getSession().getAttribute("VCODE");
			String code = params.getString("code");
			if (HString.isEmpty(code) || HString.isEmpty(vcode) || !vcode.equals(code.toLowerCase()))
				res.putStatus(XConst.V_CODE_ERROR);
			else {
				SystemSet sets = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
				WebUser user = sets.getWebUser();
				params.put("userId", user.getId());
				res = webCarpoolService.insert(params);
				int isSave = res.getInt("isRes");
				if (isSave == 0) {
					res.putStatus(XConst.SUCCESS);
				} else if (isSave == 1) {
					res.putStatus(XConst.FAIL);
				} else if (isSave == 2) {
					res.putStatus("seat_no");
				} else if (isSave == 3) {
					res.putStatus("404");
				} else if (isSave == 4) {
					res.putStatus("pool_no");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回出发城市
	 * 
	 * @return
	 */
	@RequestMapping(value = "fromCitys")
	@ResponseBody
	public PageData getFromCitys() {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findAllFromCitys();
			res.put("fromCitys", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回对应的区域列表
	 * 
	 * @param fromCityId
	 * @return
	 */
	@RequestMapping(value = "fromCountys")
	@ResponseBody
	public PageData getFromCountys(Long fromCityId) {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findFromCountyByCityId(fromCityId);
			res.put("fromCountys", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回对应的详细地址列表
	 * 
	 * @param fromCountyId
	 * @return
	 */
	@RequestMapping(value = "fromAddrs")
	@ResponseBody
	public PageData getFromAddrs(Long fromCountyId) {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findFromAddrByCountyId(null, fromCountyId);
			res.put("fromAddrs", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回线路中所有目的地的城市列表
	 * 
	 * @param fromAddrId
	 * @return
	 */
	@RequestMapping(value = "toCitys")
	@ResponseBody
	public PageData getToCitys(Long fromAddrId) {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findAllToCitysByFromId(fromAddrId);
			res.put("toCitys", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "toCountys")
	@ResponseBody
	public PageData getToCitys(Long fromAddrId, Long toCityId) {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findToCountyByCityId(fromAddrId, toCityId);
			res.put("toCountys", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "toAddrs")
	@ResponseBody
	public PageData toAddrs(Long fromAddrId, Long toCountyId) {
		PageData res = new PageData(true);
		try {
			List<PageData> list = webCarpoolService.findToAddrByCountyId(fromAddrId, toCountyId);
			res.put("toAddrs", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
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
