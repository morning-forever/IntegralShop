package com.bm.webs.controller.app.cart;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.OrderNoUtil;
import com.bm.common.util.Tools;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebOrderRentInfo;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;

@Controller(value = "AppCarRentController")
@RequestMapping(value = "app/cart/rent")
public class AppCarRentController extends BaseController {

	@Autowired
	private WebOrderService webOrderService;

	@Autowired
	private WebCarSafeService webCarSageService;

	@Autowired
	private HomeService homeService;
	
	@Autowired
	private WebCarDatePriceService webCarDatePriceService;

	@Autowired
	private WebCarRuleService webCarRuleService;

	private static String[] weekDay = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };

	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	private static SimpleDateFormat DATE_H_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//	private static SimpleDateFormat DATE_H_M_CN_FORMAT = new SimpleDateFormat("yyyy年MM月dd日HH点mm分");
	/**
	 * 租车提交订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "rentSubmitOrder")
	@ResponseBody
	public PageData rentSubmitOrder() {
		PageData result=new PageData();
		try {
			PageData pd = super.getApiPageData();
			if (!isTokenSuccess(pd)) {//验证token有效
				return pd;
			}else{
				// 租车信息
				String carId = pd.getString("carId");// 车辆
				String getStoreId = pd.getString("getStoreId");// 取车门店
				String loseStoreId = pd.getString("loseStoreId");// 还车门店
				String startTime = pd.getString("startTime");// 取车时间
				String endTime = pd.getString("endTime");// 还车时间
				String safePrice = pd.getString("safePrice");
				String realPrice = pd.getString("realPrice");
				String userId = pd.getString("userId");
				// 租车人信息
				String passengerName = pd.getString("passengerName");
				String passengerPhone = pd.getString("passengerPhone");
				String passengerCardType = pd.getString("passengerCardType");
				String passengerCardNo = pd.getString("passengerCardNo");
				// 发票寄送信息
				String isInvoice = pd.getString("isInvoice");
				String invoiceTitle = pd.getString("invoiceTitle");
				String invoiceReceiver = pd.getString("invoiceReceiver");
				String invoicePhone = pd.getString("invoicePhone");
				String invoiceAddrId = pd.getString("invoiceAddrId");
				String invoiceAddrDetail = pd.getString("invoiceAddrDetail");
				String invoicePostCode = pd.getString("invoicePostCode");
				result.putFlag(false);
				if (ValidateHelper.isNullOrEmpty(carId) || ValidateHelper.isNullOrEmpty(getStoreId)
						|| ValidateHelper.isNullOrEmpty(loseStoreId)
						|| ValidateHelper.isNullOrEmpty(safePrice) || ValidateHelper.isNullOrEmpty(realPrice)
						|| ValidateHelper.isNullOrEmpty(userId)
						|| ValidateHelper.isNullOrEmpty(passengerName)
						|| ValidateHelper.isNullOrEmpty(passengerPhone)
						|| ValidateHelper.isNullOrEmpty(passengerCardType)
						|| ValidateHelper.isNullOrEmpty(passengerCardNo)
						|| ValidateHelper.isNullOrEmpty(isInvoice) || ValidateHelper.isNullOrEmpty(startTime)
						|| ValidateHelper.isNullOrEmpty(endTime)) {
					result.putMessage(XConst.PARAM_ERR);
				} else {
					PageData map = super.getApiPageData();
					map.put("orderType", "carRent");
					map.put("orderCode", OrderNoUtil.getOrderNo());
					map.put("payType", "unPay");
					map.put("isInvoice", isInvoice);
					map.put("userId", userId);
					// 添加基础订单信息
					webOrderService.insertOrderForm(map);
					Long orderId = (Long) map.get("orderFormId");
					map.clear();

					map.put("goodsId", carId);
					map.put("goodsCount", 1);
					map.put("realPrice", realPrice);
					map.put("isSafe", 0);
					map.put("safePrice", safePrice);
					map.put("orderFormId", orderId);

					// 添加Item信息
					webOrderService.insertOrderItem(map);
					Long orderItemId = (Long) map.get("orderItemId");
					map.clear();

					map.put("orderItemId", orderItemId);
					map.put("personName", passengerName);
					map.put("personType", "adult");
					map.put("cardNo", passengerCardNo);
					map.put("cardType", passengerCardType);
					map.put("personPhone", passengerPhone);
					webOrderService.insertOrderItemPerson(map);
					map.clear();

					// 保存租车地点信息
					WebOrderRentInfo webOrderRentInfo = new WebOrderRentInfo();
					webOrderRentInfo.setOrderFormId(orderId);
					webOrderRentInfo.setStartDate(DATE_H_FORMAT.parse(startTime));
					webOrderRentInfo.setEndDate(DATE_H_FORMAT.parse(endTime));
					webOrderRentInfo.setGetStoreId(Long.parseLong(getStoreId));
					webOrderRentInfo.setLoseStoreId(Long.parseLong(getStoreId));
					String startDate = DATE_FORMAT.format(DATE_H_FORMAT.parse(startTime));
					String endDate = DATE_FORMAT.format(DATE_H_FORMAT.parse(endTime));
					List<PageData> priceList = webCarDatePriceService.findPriceList(Long.valueOf(carId), startDate, endDate);
					if(priceList==null){
						result.putFlag(false);
						result.putMessage(XConst.NO_PRICE);
					}else{
					
					StringBuffer dayPriceBuffer=new StringBuffer();
					for (int i = 0; i < priceList.size(); i++) {
						dayPriceBuffer.append(priceList.get(i).get("price"));
						dayPriceBuffer.append(",");
					}
					Integer lastIndex=dayPriceBuffer.lastIndexOf(",");
					String dayPrice=dayPriceBuffer.substring(0, lastIndex);
					webOrderRentInfo.setDayPrice(dayPrice);
					webOrderService.insertOrderRentInfo(webOrderRentInfo);

					// 保存发票信息
					if ("0".equals(isInvoice)) {
						map.put("title", invoiceTitle);
						map.put("receiver", invoiceReceiver);
						map.put("phone", invoicePhone);
						map.put("addrId", invoiceAddrId);
						map.put("addrDetail", invoiceAddrDetail);
						map.put("postCode", invoicePostCode);
						map.put("orderFormId", orderId);
						webOrderService.insertOrderInvoice(map);
						map.clear();
					}
//					pd.clear();
					updateNewToken(pd);//更新token
					String newToken = pd.getString(XConst.API_TOKEN_KEY);
					result.putData("orderId", orderId);
					result.putData(XConst.API_TOKEN_KEY, newToken);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
					}
				}
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 租车车辆选择
	 * 
	 * @return
	 */
	@RequestMapping(value = "rentSubmitCar")
	@ResponseBody
	public PageData rentSubmitCar() {
		PageData pd = super.getApiPageData();
		PageData result=new PageData();
		try {
			String carId = pd.getString("carId");// 车辆
			String getStoreId = pd.getString("getStoreId");// 取车门店
			String loseStoreId = pd.getString("loseStoreId");// 还车门店
			String startTime = pd.getString("startTime");// 取车时间
			String endTime = pd.getString("endTime");// 还车时间
			result.putFlag(false);
			if (ValidateHelper.isNullOrEmpty(carId) || ValidateHelper.isNullOrEmpty(getStoreId)
					|| ValidateHelper.isNullOrEmpty(loseStoreId) || ValidateHelper.isNullOrEmpty(startTime)
					|| ValidateHelper.isNullOrEmpty(endTime)) {
				result.putMessage(XConst.PARAM_ERROR);
			} else {
				Map<String, Object> order = new HashMap<String, Object>();
				// order.put("car", webCarRentService.findCarRentDetialById(Long
				// .parseLong(carId)));// 车辆信息
				// order.put("getStore", webCarAddrsService.findSotreById(Long
				// .parseLong(getStoreId)));// 取车门店 信息
				// order.put("loseStore", webCarAddrsService.findSotreById(Long
				// .parseLong(loseStoreId)));// 取车门店 信息
				// order.put("startTime",
				// DATE_H_M_CN_FORMAT.format(DATE_H_FORMAT
				// .parse(startTime)));// 租车时间
				// order.put("endTime",DATE_H_M_CN_FORMAT.format(DATE_H_FORMAT
				// .parse(endTime)));// 还车时间

				Date startDateO=DATE_H_FORMAT.parse(startTime);
				Date endDateO=DATE_H_FORMAT.parse(endTime);
				List<PageData> priceList = homeService.findPriceList(Long.parseLong(carId),
						DATE_FORMAT.format(startDateO),
						DATE_FORMAT.format(endDateO));
				Tools.checkPriceIntegrity(startDateO, endDateO, priceList);
				order.put("priceList", priceList);// 租车费用列表

				Double countPrice = 0d;
				for (int i = 0; i < priceList.size(); i++) {
					PageData p = priceList.get(i);
					Double item = (Double) p.get("price");
					String d = (String) p.get("week");
					p.put("week", weekDay[Integer.parseInt(d)]);
					countPrice += item;
				}
				BigDecimal DBCountPrice=new BigDecimal(countPrice);
				countPrice=DBCountPrice.setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue();
				order.put("countPrice", countPrice);// 租车总费用

				PageData param = new PageData();
				param.put("type", "rent");
				PageData safe = webCarSageService.findByType(param);
				order.put("safe", safe.get("price"));// 保险单价

				order.put("days", priceList.size());// 租车天数
				BigDecimal BDSafe=new BigDecimal(priceList.size() * (Double) safe.get("price"));
				Double safeCount=BDSafe.setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue();
				order.put("safeCount", safeCount);// 保险总费用
				order.put("rentFee", 0);// 手续费
				order.put("totalPrice", countPrice + safeCount);// 订单总价

				order.put("rules", webCarRuleService.findRuleByType(param));// 租车规则

				
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
				result.putData("order", order);
			}
		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取租车车辆List数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "getRentCarList")
	@ResponseBody
	public PageData getRentCarList() {
		PageData pd = super.getApiPageData();
		PageData result=new PageData();
		try {
			String pageNo = pd.getString("pageNo");
			String pageSize = pd.getString("showLine");
			String getStoreId = pd.getString("getStoreId");
			String loseStoreId = pd.getString("loseStoreId");

			String typeId = pd.getString("typeId");
			String brandId = pd.getString("brandId");
			String priceId = pd.getString("priceId");
			String priceSort = pd.getString("priceSort");
			result.putFlag(false);
			if (ValidateHelper.isNullOrEmpty(pageNo) || ValidateHelper.isNullOrEmpty(pageSize)
					|| ValidateHelper.isNullOrEmpty(getStoreId) || ValidateHelper.isNullOrEmpty(loseStoreId)) {
				result.putMessage(XConst.PARAM_ERROR);
			} else {
				List<PageData> list = homeService.findCarRentList(Long.parseLong(pageNo),
						Long.parseLong(pageSize), getStoreId, loseStoreId, typeId, brandId, priceId,
						priceSort);
				result.putData("list", list);
				result.putFlag(true);
				result.putMessage(XConst.SUCCESS);
			}

		} catch (Exception e) {
			result.putFlag(false);
			result.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return result;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
