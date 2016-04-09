package com.bm.webs.controller.app.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.home.HomeService;
import com.bm.webs.service.common.AreaAllService;
import com.bm.webs.service.web.cart.WebCarCarpoolService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;

/**
 * 拼车接口
 * 
 * @author mike <br>
 *         2015年10月13日
 */
@Controller
@RequestMapping(value = "app/cart/pool")
public class AppCarpoolController extends BaseController {

	@Autowired
	private WebCarCarpoolService webCarpoolService;

	@Autowired
	private WebCarSafeService webCarSageService;

	@Autowired
	private WebCarRuleService carRuleServce;;

	@Autowired
	private AreaAllService areaAllService;

	@Autowired
	private HomeService homeService;

	/**
	 * 发起拼车
	 * 
	 * @return
	 */
	@RequestMapping(value = "publishPoolOrder")
	@ResponseBody
	public PageData publishPoolOrder() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData params = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("submitOrder", params, new String[] { "startTime", "startAddrId", "endAddrsId", "publishName", "publishCard", "publishCardType",
					"publishPhone", "bankName", "bankCard","startCityId","endCityId" }, 
					new String[] { "出发时间", "出发地点", "到达地点", "发布人", "发布人证件号", "证件类型", "发布人手机", "银行名称", "银行卡号","开始城市地点","结束城市点" });
			if (isSuccess) {
				if (!isTokenSuccess(params))// 检查token
					return params;
				// 业务处理
				res = webCarpoolService.insert(params);
				int isSave = res.getInt("isRes");
				if (isSave == 0) {
					res.putMessage(XConst.SUCCESS);
					res.putFlag(true);
				} else if (isSave == 1) {
					res.putMessage(XConst.FAIL);
				} else if (isSave == 2) {
					res.putMessage("seat_no");
				} else if (isSave == 3) {
					res.putMessage("404");
				} else if (isSave == 4) {
					res.putMessage("pool_no");
				}
				// 更新token
				updateNewToken(params);
				String newToken = params.getString(XConst.API_TOKEN_KEY);
				res.putData(XConst.API_TOKEN_KEY, newToken);
				res.remove("isRes");
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 进入提交订单的页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "poolLoad")
	@ResponseBody
	public PageData loadPool() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getPageData();
			param.put("type", "carpool");
			PageData safe = webCarSageService.findByType(param);
			PageData rule = carRuleServce.findRuleByType(param);
			Long id = param.getLong("id");
			PageData poolDetail = null;
			if (!HString.isEmpty(id)) {
				poolDetail = webCarpoolService.detail(id);
			} else {
				poolDetail = webCarpoolService.findPoolStartDetail(param.getLong("fromAddrId"), param.getLong("toAddrId"));
				res.putData("startTime", param.get("startTime"));
			}
			if (!HString.isEmpty(poolDetail)) {
				res.putData("poolDetail", poolDetail);
				res.putMessage(XConst.SUCCESS);
				res.putFlag(true);
			}
			res.putData("poolSafe", safe);
			res.putData("poolRule", rule);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交拼车订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "poolCarOrder")
	@ResponseBody
	public PageData submitPoolOrder() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData params = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("submitOrder", params, 
			new String[] { "goodsId", "oldToken", "param", "userId", "goodsCount", "isSafe","realPrice"}
			, new String[] { "拼车id", "token", "乘坐人信息", "用户id", "乘坐人数", "是否需要保险","总价" });
			if (isSuccess) {
				if (!isTokenSuccess(params))// 检查token
					return params;
				// 业务处理
				res = webCarpoolService.insert(params);
				int isSave = res.getInt("isRes");
				if (isSave == 0) {
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				} else if (isSave == 1) {
					res.putMessage(XConst.FAIL);
				} else if (isSave == 2) {
					res.putMessage("seat_no");
				} else if (isSave == 3) {
					res.putMessage("404");
				} else if (isSave == 4) {
					res.putMessage("pool_no");
				}
				// 更新token
				updateNewToken(params);
				String newToken = params.getString(XConst.API_TOKEN_KEY);
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
	 * list 列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			PageData data = this.getPageData();
			res = webCarpoolService.pageList(data.getLong("pageNo"), data.getLong("showLine"), data.getLong("fromAddrId"), data.getLong("toAddrId"), data.getString("startTime"),
					data.getString("startTimeOrder"));
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
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
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findAllFromCitys();
			res.putFlag(true);
			res.putData("fromCitys", list);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			res.putFlag(false);
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
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findFromCountyByCityId(fromCityId);
			res.putData("fromCountys", list);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			res.putFlag(false);
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
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findFromAddrByCountyId(null, fromCountyId);
			res.putData("fromAddrs", list);
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			res.putFlag(false);
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
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findAllToCitysByFromId(fromAddrId);
			res.putData("toCitys", list);
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			res.putFlag(false);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 到达的区县列表
	 * 
	 * @param fromAddrId
	 * @param toCityId
	 * @return
	 */
	@RequestMapping(value = "toCountys")
	@ResponseBody
	public PageData getToCitys(Long fromAddrId, Long toCityId) {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findToCountyByCityId(fromAddrId, toCityId);
			res.putData("toCountys", list);
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 到达的地点列表
	 * 
	 * @param fromAddrId
	 * @param toCountyId
	 * @return
	 */
	@RequestMapping(value = "toAddrs")
	@ResponseBody
	public PageData toAddrs(Long fromAddrId, Long toCountyId) {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			List<PageData> list = webCarpoolService.findToAddrByCountyId(fromAddrId, toCountyId);
			res.putData("toAddrs", list);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			res.putFlag(false);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
