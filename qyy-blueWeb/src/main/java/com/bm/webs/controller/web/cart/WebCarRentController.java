package com.bm.webs.controller.web.cart;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.OrderNoUtil;
import com.bm.common.util.Tools;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.AreaAll;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebOrderInvoice;
import com.bm.webs.bean.WebOrderItem;
import com.bm.webs.bean.WebOrderItemPerson;
import com.bm.webs.bean.WebOrderRentInfo;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.AreaAllService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarBrandService;
import com.bm.webs.service.web.cart.WebCarRentService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;
import com.bm.webs.service.web.cart.WebCarTypeService;

/**
 * 
 * 租车Controller
 * 
 * @author Hham
 *
 */
@Controller("webCarRentController")
@RequestMapping("pc/cart/rent/")
public class WebCarRentController extends BaseController {

	@Autowired
	private WebCarRentService webCarRentService;

	@Autowired
	private WebCarBrandService webCarBrandService;

	@Autowired
	private WebCarTypeService webCarTypeService;

	@Autowired
	private WebPriceSearchService webPriceSearchService;

	@Autowired
	private WebCarAddrsService webCarAddrsService;

	@Autowired
	private WebCarDatePriceService webCarDatePriceService;

	@Autowired
	private WebCarSafeService webCarSageService;

	@Autowired
	private CommonUploadService commonUploadService;

	@Autowired
	private AreaAllService areaAllService;

	@Autowired
	private WebOrderService webOrderService;

	@Autowired
	private WebCarRuleService webCarRuleService;

	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	private static SimpleDateFormat DATE_H_M_CN_FORMAT = new SimpleDateFormat("yyyy年MM月dd日HH点mm分");

	// 用于页面上时间控件的格式化
	private static SimpleDateFormat DATE_H_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	private static final int PAGE_SIZE = 10;

	/**
	 * 
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	public ModelAndView list(String getRentTime, String loseRentTime, Long getStoreId, Long loseStoreId) {
		ModelAndView mav = new ModelAndView();

		try {
			Date startData = null;
			Date endDate = null;
			if (ValidateHelper.isNullOrEmpty(getRentTime)) {
				startData = new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000);
			} else {
				startData = DATE_H_FORMAT.parse(getRentTime);
			}
			if (ValidateHelper.isNullOrEmpty(loseRentTime)) {
				endDate = new Date(startData.getTime() + 24 * 60 * 60 * 1000);
			} else {
				endDate = DATE_H_FORMAT.parse(loseRentTime);
			}
			if(getStoreId!=null){
				PageData getStore=webCarAddrsService.findSotreById(getStoreId);
				mav.addObject("getStore", getStore);
			}
			if(getStoreId!=null){
				PageData loseStore=webCarAddrsService.findSotreById(loseStoreId);
				mav.addObject("loseStore", loseStore);
			}
			mav.addObject("startDate", DATE_H_FORMAT.format(startData));
			mav.addObject("endDate", DATE_H_FORMAT.format(endDate));
			mav.setViewName("web/cart/rent_list");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 
	 * 获取List数据
	 * 
	 * @param pageNo
	 *            当前页
	 * @param typeId
	 *            类型ID
	 * @param brandId
	 *            品牌ID
	 * @param serchPrice
	 *            价格区间ID
	 * @param getCityId
	 *            租车城市ID
	 * @param getSotreId
	 *            租车门面ID
	 * @param loseCityId
	 *            还车城市ID
	 * @param loseStoreId
	 *            还车门面ID
	 * @return
	 */
	@RequestMapping(value = "getListData", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getListData(@RequestParam(value = "pageNo", defaultValue = "1") Long pageNo,
			String typeId, String brandId, Long serchPrice, Long getCityId, Long getStoreId, Long loseCityId,
			Long loseStoreId, String sort) {
		PageData map = new PageData();
		try {
			if (typeId != null && typeId.lastIndexOf(",") != -1) {
				typeId = typeId.substring(0, typeId.lastIndexOf(","));
			}
			if (brandId != null && brandId.lastIndexOf(",") != -1) {
				brandId = brandId.substring(0, brandId.lastIndexOf(","));
			}
			Long total = webCarRentService.finCarRentListTotal(pageNo, PAGE_SIZE, typeId, brandId,
					serchPrice, getCityId, getStoreId, loseCityId, loseStoreId);
			Long totalPage = total % PAGE_SIZE == 0 ? total / PAGE_SIZE : total / PAGE_SIZE + 1;
			List<PageData> list = webCarRentService.findCarRentList(pageNo, PAGE_SIZE, typeId, brandId,
					serchPrice, getCityId, getStoreId, loseCityId, loseStoreId, sort);
			// PageData
			// getStoreMap=webCarAddrsService.findSotreById(getStoreId);
			// PageData
			// loseStoreMap=webCarAddrsService.findSotreById(loseStoreId);

			map.put("list", list);

			map.put("thisPageSize", list.size());
			map.put("totalPage", totalPage);
			map.put("pageNo", pageNo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 根据市ID查询区ID
	 * 
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "getCounty", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getCounty(Long id, String type) {
		PageData map = new PageData();

		try {
			List<PageData> list = webCarAddrsService.findCountyByCityId(id, type);
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 根据区ID查询门户
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getStore", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getSotre(Long id, String type) {
		PageData map = new PageData();
		try {
			List<PageData> list = webCarAddrsService.findStoreByCountyId(id, type);
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查看租车详情
	 * 
	 * @param id
	 * @param getStoreId
	 * @param loseStoreId
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	public ModelAndView detail(@PathVariable(value = "id") Long id, Long getStoreId, Long loseStoreId,
			String startTime, String endTime) {
		ModelAndView mav = new ModelAndView();
		try {
			PageData map = webCarRentService.findCarRentDetialById(id);
			String getStoreName = webCarAddrsService.findSotreNameById(getStoreId);
			String loseStoreName = webCarAddrsService.findSotreNameById(loseStoreId);
			List<PageData> photoUrls = commonUploadService.findPhotos(id, "carRent", "detial", 4);
			mav.addObject("rent", map);
			mav.addObject("photoUrls", photoUrls);
			mav.addObject("getStoreName", getStoreName);
			mav.addObject("loseStoreName", loseStoreName);

			mav.addObject("getStoreId", getStoreId);
			mav.addObject("loseStoreId", loseStoreId);
			mav.addObject("startTime", startTime);
			mav.addObject("endTime", endTime);

			mav.setViewName("web/cart/rent_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 查询所有品牌列表
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "brandList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData brandList(String type) {
		PageData map = new PageData();
		try {
			List<PageData> brandList = webCarBrandService.findCarBrandList(type);
			map.put("list", brandList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查询类型列表
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "typeList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData typeList(String type) {
		PageData map = new PageData();
		try {
			List<PageData> typeList = webCarTypeService.findCarTypeList("rent");
			map.put("list", typeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查询价格区间列表
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "priceIntervalList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData priceIntervalList(String type) {
		PageData map = new PageData();
		try {
			List<PageData> priceList = webPriceSearchService.findListByType(type);
			map.put("list", priceList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查询地址列表
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "addrList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addrList(String type) {
		PageData map = new PageData();
		try {
			List<PageData> addrList = webCarAddrsService.findListByType(type);
			map.put("list", addrList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 跳转到提交订单页面
	 * 
	 * @param id
	 * @param getStoreId
	 * @param loseStoreId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value = "goSubmitOrder")
	public ModelAndView goOrderSubmit(Long id, Long getStoreId, Long loseStoreId, String startTime,
			String endTime) {
		ModelAndView mav = new ModelAndView();
		try {
			if (!ValidateHelper.isNullOrEmpty(id)) {
				PageData map = webCarRentService.findCarRentDetialById(id);
				mav.addObject("car", map);

				PageData getStore = webCarAddrsService.findSotreById(getStoreId);
				PageData loseStore = webCarAddrsService.findSotreById(loseStoreId);
				mav.addObject("getStore", getStore);
				mav.addObject("loseStore", loseStore);


				Date startDateO=DATE_H_FORMAT.parse(startTime);
				Date endDateO=DATE_H_FORMAT.parse(endTime);
				String startDate = DATE_FORMAT.format(startDateO);
				String endDate = DATE_FORMAT.format(endDateO);
				List<PageData> priceList = webCarDatePriceService.findPriceList(id, startDate, endDate);
				Tools.checkPriceIntegrity(startDateO, endDateO, priceList);
				mav.addObject("priceList", priceList);

				Double countPrice = 0d;
				for (int i = 0; i < priceList.size(); i++) {
					Double item = (Double) priceList.get(i).get("price");
					countPrice += item;
				}
				BigDecimal DBCountPrice=new BigDecimal(countPrice);
				countPrice=DBCountPrice.setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue();
				mav.addObject("countPrice", countPrice);//租车总价

				startTime = DATE_H_M_CN_FORMAT.format(DATE_H_FORMAT.parse(startTime));
				endTime = DATE_H_M_CN_FORMAT.format(DATE_H_FORMAT.parse(endTime));
				mav.addObject("startTime", startTime);
				mav.addObject("endTime", endTime);

				PageData param = new PageData();
				param.put("type", "rent");
				PageData safe = webCarSageService.findByType(param);
				param.clear();

				mav.addObject("days", priceList.size());//天数
				BigDecimal BDSafe=new BigDecimal(priceList.size() * (Double) safe.get("price"));
				Double safeCount=BDSafe.setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue();;
				mav.addObject("safeCount", safeCount);//保险总价

				mav.addObject("safe", safe);//保险单价

				List<AreaAll> areaList = areaAllService.findAreaByParentId(0l);
				mav.addObject("areaList", areaList);

				param.put("type", "rent");
				PageData rule = webCarRuleService.findRuleByType(param);
				mav.addObject("rule", rule);

				mav.setViewName("web/cart/destine_order");
			} else {
				HttpServletRequest request = getRequest();
				String redirectUrl = request.getScheme() + "://" + request.getServerName() + ":"
						+ request.getServerPort() + request.getContextPath() + "//";
				System.out.println(redirectUrl);
				mav.setViewName("redirect:" + redirectUrl + "pc/cart/rent/list");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 提交订单
	 * 
	 * @param webOrderItem
	 * @param webOrderRentInfo
	 * @param webOrderInvoice
	 * @param isInvoice
	 * @return
	 */
	@RequestMapping(value = "submitOrder", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitOrder(WebOrderItem webOrderItem, WebOrderRentInfo webOrderRentInfo,
			WebOrderInvoice webOrderInvoice, WebOrderItemPerson webOrderItemPerson, Long isInvoice,
			String startDateStr, String endDateStr, String code) {
		PageData map = new PageData();

		try {

			String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");
			if (code.toLowerCase().equals(vcode)) {
				Long userId = getUserId();
				String orderNo=OrderNoUtil.getOrderNo();

				map.put("orderType", "carRent");
				map.put("orderCode", orderNo);
				map.put("payType", "unPay");
				map.put("isInvoice", isInvoice);
				map.put("userId", userId);
				// 添加基础订单信息
				webOrderService.insertOrderForm(map);
				Long orderId = (Long) map.get("orderFormId");
				map.clear();

				map.put("goodsId", webOrderItem.getGoodsId());
				map.put("goodsCount", 1);
				map.put("realPrice", webOrderItem.getRealPrice());
				map.put("isSafe", 0);
				map.put("safePrice", webOrderItem.getSafePrice());
				map.put("orderFormId", orderId);

				// 添加Item信息
				webOrderService.insertOrderItem(map);
				Long orderItemId = (Long) map.get("orderItemId");
				map.clear();

				map.put("orderItemId", orderItemId);
				map.put("personName", webOrderItemPerson.getPersonName());
				map.put("personType", "adult");
				map.put("cardNo", webOrderItemPerson.getCardNo());
				map.put("cardType", webOrderItemPerson.getCardType());
				map.put("personPhone", webOrderItemPerson.getPersonPhone());
				webOrderService.insertOrderItemPerson(map);
				map.clear();

				// 保存租车地点信息
				webOrderRentInfo.setOrderFormId(orderId);
				Date startDateO=DATE_H_M_CN_FORMAT.parse(startDateStr);
				Date endDateO=DATE_H_M_CN_FORMAT.parse(endDateStr);
				webOrderRentInfo.setStartDate(startDateO);
				webOrderRentInfo.setEndDate(endDateO);
				String startDate = DATE_FORMAT.format(startDateO);
				String endDate = DATE_FORMAT.format(endDateO);
				List<PageData> priceList = webCarDatePriceService.findPriceList(webOrderItem.getGoodsId(), startDate, endDate);
				Tools.checkPriceIntegrity(startDateO, endDateO, priceList);
				StringBuffer dayPriceBuffer=new StringBuffer();
				for (int i = 0; i < priceList.size(); i++) {
					dayPriceBuffer.append(priceList.get(i).get("price"));
					dayPriceBuffer.append(",");
				}
				Integer lastIndex=dayPriceBuffer.lastIndexOf(",");
				String dayPrice="";
				if(lastIndex!=-1){
					dayPrice=dayPriceBuffer.substring(0, lastIndex);
				}
				webOrderRentInfo.setDayPrice(dayPrice);
				webOrderService.insertOrderRentInfo(webOrderRentInfo);

				// 保存发票信息
				if (isInvoice == 0) {
					map.put("title", webOrderInvoice.getTitle());
					map.put("receiver", webOrderInvoice.getReceiver());
					map.put("phone", webOrderInvoice.getPhone());
					map.put("addrId", webOrderInvoice.getAddrId());
					map.put("addrDetail", webOrderInvoice.getAddrDetail());
					map.put("postCode", webOrderInvoice.getPostCode());
					map.put("orderFormId", orderId);
					webOrderService.insertOrderInvoice(map);
					map.clear();
				}
				map.clear();
				map.put("orderId", orderId);

				//发送通知邮件
				SimpleMailSender.sendNoticeEmail(orderNo);
				
				map.put(XConst.STATUS_KEY, XConst.SUCCESS);
			} else {
				map.put(XConst.STATUS_KEY, XConst.V_CODE_ERROR);
			}

		} catch (Exception e) {
			e.printStackTrace();
			map.put(XConst.STATUS_KEY, XConst.ERROR);
		}
		return map;
	}

	

	/**
	 * 
	 * 获得当前登陆的用户ID （暂定）
	 * 
	 * @return
	 */
	private Long getUserId() {
		SystemSet sysset = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
		return sysset.getWebUser().getId();
	}

	public static void main(String[] args) {
		
	}

	@Override
	protected String getMenuKey() {
		return null;
	}
	
	

}
