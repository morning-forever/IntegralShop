package com.bm.webs.controller.app.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bm.common.beans.XConst;
import com.bm.common.util.alipay.config.AlipayConfig;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebEvaluataService;
import com.bm.webs.service.web.WebOrderService;

/**
 * 个人中心 订单
 * 
 * @author mike <br>
 *         2015年10月19日
 */
@Controller(value = "appCenterOrderController")
@RequestMapping(value = "app/center/order")
public class AppCenterOrderController extends BaseController {

	// @Autowired
	// private WebOrderService webOrderService;

	@Autowired
	private WebOrderService webOrderService;// 订单

	@Autowired
	private WebEvaluataService webEvaluataService;// 评价

	private final static String[] ALLOWED_ORDER_TYPE_ARR = new String[] { "REFUNDED", "PAY_OK", "CLOSED",
			"REFUNDING_FAIL" };
	
	private final static String[] REFUND_ORDER_TYPE_ARR=new String[]{"PAY_OK","REFUNDING_FAIL"};

	/**
	 * 车辆订单列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "cartlist")
	@ResponseBody
	public PageData cartlist() {
		PageData pd = getApiPageData();
		PageData res = new PageData();
		res.putFlag(false);
		String type = pd.getString("type");
		List<PageData> list = null;
		try {
			if ("rent".equals(type)) {
				list = webOrderService.findCarRentOrderList(pd);
			} else if ("wrap".equals(type)) {
				list = webOrderService.findCarWrapOrderList(pd);
			} else if ("bus".equals(type)) {
				list = webOrderService.findCarBusOrderList(pd);
			} else if ("carpool".equals(type)) {
				list = webOrderService.findCarPoolOrderList(pd);
			}
			res.putData("list", list);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询订单详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "detial", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData detial() {
		PageData pd = getApiPageData();
		PageData result = new PageData();
		result.putFlag(false);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean flag = true;
			if (!isTokenSuccess(pd)) {
				return pd;
			}
			String cartType = webOrderService.findOrderTypeById(pd);
			if ("carRent".equals(cartType)) {// 租车
				map = webOrderService.findCarRentOrderDetial(pd);
				if(map==null){
					flag = false;
				}
			} else if ("carWrap".equals(cartType)) {// 包车
				Map<String, Object> carWrapMap = webOrderService.findCarWrapOrderDetial(pd);
				if (carWrapMap != null) {
					List<Map<String, Object>> list = webOrderService.findCarWrapAddrList(pd);
					map.put("carWrapMap", carWrapMap);
					map.put("list", list);
				} else {
					map=null;
					flag = false;
				}
			} else if ("bus".equals(cartType)) {// 班车
				Map<String, Object> busMap = webOrderService.findCarBusOrderDetial(pd);
				if (busMap != null) {
					List<Map<String, Object>> personList = webOrderService.findCarBusOrderPersonList(pd);
					map.put("busMap", busMap);
					map.put("personList", personList);
				} else {
					map=null;
					flag = false;
				}
			} else if ("carpool".equals(cartType)) {// 拼车
				Map<String, Object> carpool = webOrderService.findCarPoolOrderDetial(pd);
				if (carpool != null) {
					List<Map<String, Object>> personList = webOrderService.findCarPoolOrderPersonList(pd);
					map.put("carpool", carpool);
					map.put("personList", personList);
				} else {
					map=null;
					flag = false;
				}
			} else if ("depth".equals(cartType)) {// 深度游订单详情
				Long orderId = pd.getLong("id");
				// 深度游订单详情
				PageData depthMap = webOrderService.findDepthOrderDetail(orderId, "appCover");
				if (depthMap != null) {
					map.put("depthDetail", depthMap);
					// 游客信息
					map.put("personList", webOrderService.findOrderPersonList(orderId));
				} else {
					map=null;
					flag = false;
				}
			}

			// 更新token
			if(flag){
				updateNewToken(pd);
				String newToken = pd.getString(XConst.API_TOKEN_KEY);
				result.putData(XConst.API_TOKEN_KEY, newToken);
			}

			result.putData("map", map);
			result.putFlag(flag);
			if(map==null){
				result.putMessage(XConst.NO_EXISTS);
			}else{
				result.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			result.putFlag(false);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 深度游订单列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "depthList")
	@ResponseBody
	public PageData depthList() {
		PageData res = new PageData();
		try {
			PageData param = getApiPageData();
			if (!ValidateHelper.isNullOrEmpty(param.get("userId"))) {
				/*
				 * if (!isTokenSuccess(param)) { // 检查token return param; }
				 */
				// 深度游订单列表
				res.putData("depthList", webOrderService.findAppDepthOrderList(param));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);

				// 更新token
				/*
				 * updateNewToken(param); String newToken =
				 * param.getString(XConst.API_TOKEN_KEY);
				 * res.putData(XConst.API_TOKEN_KEY, newToken);
				 */
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
	 * 深度游订单详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "depthDetail")
	@ResponseBody
	public PageData depthDetail() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Long orderId = param.getLong("orderId");
			if (!ValidateHelper.isNullOrEmpty(orderId)) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				PageData depthOrder = new PageData();
				// 深度游订单详情
				depthOrder.put("depthDetail", webOrderService.findDepthOrderDetail(orderId, "appCover"));
				// 游客信息
				depthOrder.put("personList", webOrderService.findOrderPersonList(orderId));
				res.putData("depthOrder", depthOrder);
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
	 * 申请退款
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveRefund")
	@ResponseBody
	public PageData saveRefund() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			// 检查参数
			boolean isSuccess = checkParam("saveRefund", param, new String[] { "personName", "bankName",
					"bankNo", "formId" }, new String[] { "真实姓名", "银行名称", "银行卡号", "订单id" });
			if (isSuccess) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				webOrderService.saveRefund(param);
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
	 * 操作订单(删除或是取消订单)
	 * 
	 * @return
	 */
	@RequestMapping(value = "operOrder")
	@ResponseBody
	public PageData operOrder() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData param = getPageData();
			if (!ValidateHelper.isNullOrEmpty(param.get("orderId"))) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				String oper = param.getString("oper");
				String orderId = param.getString("orderId");
				param.put("id", orderId);
				// 删除订单
				if ("delete".equals(oper)) {
					StringBuffer allowedOrderTypeBuffer = new StringBuffer();
					for (int i = 0; i < ALLOWED_ORDER_TYPE_ARR.length; i++) {
						allowedOrderTypeBuffer.append("'");
						allowedOrderTypeBuffer.append(ALLOWED_ORDER_TYPE_ARR[i]);
						allowedOrderTypeBuffer.append("'");
						allowedOrderTypeBuffer.append(",");
					}
					String allowedOrderType = allowedOrderTypeBuffer.substring(0,
							allowedOrderTypeBuffer.lastIndexOf(","));
					param.put("allowedOrderType", allowedOrderType);
					Long checkId = webOrderService.checkDelete(param);
					if (checkId != null) {
						webOrderService.deleteOrders(orderId);
						res.putFlag(true);
						res.putMessage(XConst.SUCCESS);
					} else {
						res.putMessage(XConst.ERROR);
					}
				}
				// 关闭订单
				else if ("close".equals(oper)) {

					Long checkId = webOrderService.checkCannel(param);
					if (checkId != null) {
						webOrderService.closeOrders(orderId);
						res.putFlag(true);
						res.putMessage(XConst.SUCCESS);
					} else {
						res.putMessage(XConst.ERROR);
					}
				}

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
	 * 添加一条评论
	 * 
	 * @return
	 */
	@RequestMapping(value = "addComment")
	@ResponseBody
	public PageData addComment() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			// 检查参数
			boolean isSuccess = checkParam("addComment", param, new String[] { "forms", "goodsId", "userId",
					"score", "comment", "picType", "orderId" }, new String[] { "来自版块", "商品id", "用户id", "分数",
					"评论内容", "图片类型", "订单id" });
			if (isSuccess) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				res = webEvaluataService.saveEvaluate(param);

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
	 * app端支付回调
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "callback")
	@ResponseBody
	public String payResult() {
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
//			boolean isVerfy = AlipayNotify.verify(param);
			boolean isVerfy = true;
			if (isVerfy) {
				PageData params = super.getPageData();
				Long orderId = params.getLong("orderId");
				String orderType = params.getString("orderType");
				if ("TRADE_SUCCESS".equals(params.getString("trade_status"))) {
					String trade_no = params.getString("trade_no");
					webOrderService.updateOrderPay(orderId, orderType, "alipay", trade_no);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return XConst.SUCCESS;
	}
	
	/**
	 * 快旅出行退款
	 * @param id
	 * @return
	 */
	@RequestMapping(value="carRefund",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData carRefund(){
		PageData pd=getApiPageData();
		PageData result=new PageData();
		result.putFlag(false);
		try {
			String[] param = new String[] { "bank_name","reason","id","bank_card" };
			String[] tips = new String[] { "银行名称","原因","订单ID","银行卡号" };
			boolean checkParam = checkParam("carRefund", pd, param, tips);
			if (checkParam) {
			if (!isTokenSuccess(pd)) {
					// 检查token
					return pd;
				}
				String orderType = getOrderTypes(REFUND_ORDER_TYPE_ARR);

				pd.put("orderTypes", orderType);
				Long checkId = webOrderService.checkRefund(pd);
				if (checkId != null) {
					webOrderService.refund(pd);
					result.putFlag(true);
					result.putMessage(XConst.SUCCESS);
					updateNewToken(pd);
					String newToken = pd.getString(XConst.API_TOKEN_KEY);
					result.putData(XConst.API_TOKEN_KEY, newToken);
				} else {
					result.putMessage(XConst.ERROR);
				}
			}
		} catch (Exception e) {
			result.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "uploadExcel")
	public PageData uploadExcel(@RequestParam MultipartFile productExcel) {
		PageData pd = new PageData();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			@SuppressWarnings("resource")
			XSSFWorkbook workbook = new XSSFWorkbook(productExcel.getInputStream());
			Date startDate = new Date();
			XSSFSheet sheet = workbook.getSheet("sheet1");
			int rowNum = sheet.getPhysicalNumberOfRows();
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			List<Object> titleList = new ArrayList<Object>();
			XSSFRow firstRow = sheet.getRow(0);
			for (int i = 0; i < firstRow.getPhysicalNumberOfCells(); i++) {
				titleList.add(firstRow.getCell(i));
			}
			Object[] titleArr = titleList.toArray();
			for (int i = 1; i < rowNum; i++) {
				XSSFRow row = sheet.getRow(i);
				Map<String, Object> map = new HashMap<String, Object>();
				for (int j = 0; j < row.getPhysicalNumberOfCells(); j++) {
					XSSFCell cell = row.getCell(j);
					cell.setCellType(XSSFCell.CELL_TYPE_STRING);
					if (j == 2 || j == 3 || j == 8) {
						String value = cell.getStringCellValue();
						Integer lastIndex = value.lastIndexOf(".");
						if (lastIndex != -1) {
							value = value.substring(0, lastIndex);
						}
						long time = (Long.parseLong(value) - 25569) * 24 * 60 * 60 * 1000;
						map.put(titleArr[j].toString(), sdf.format(new Date(time)));
					} else {
						map.put(titleArr[j].toString(), cell.getStringCellValue());
					}
				}
				list.add(map);
			}
			for (int i = 0; i < list.size(); i++) {
				webOrderService.insertExcelOrder(list.get(i));
			}
			System.out.println("上传excel总计使用时间:" + (new Date().getTime() - startDate.getTime()) + "ms");
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	//返回指定类型订单字符串拼接
		private String getOrderTypes(String[] orderArr) {
			StringBuffer OrderTypeBuffer=new StringBuffer();
			for (int i = 0; i < orderArr.length; i++) {
				OrderTypeBuffer.append("'");
				OrderTypeBuffer.append(orderArr[i]);
				OrderTypeBuffer.append("'");
				OrderTypeBuffer.append(",");
			}
			
			return OrderTypeBuffer.substring(0, OrderTypeBuffer.lastIndexOf(","));
		}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
