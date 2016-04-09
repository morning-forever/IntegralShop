package com.bm.webs.controller.app.depth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.depth.WebDepthAzimuthService;
import com.bm.webs.service.depth.WebDepthPointService;
import com.bm.webs.service.depth.WebDepthPricesContainService;
import com.bm.webs.service.depth.WebDepthPricesService;
import com.bm.webs.service.depth.WebDepthService;
import com.bm.webs.service.depth.WebDepthSubjectService;
import com.bm.webs.service.depth.WebDepthTripService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebEvaluataService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 主题深度游模块 APP接口
 * 
 * @author jiangl
 * 
 *         2015年10月13日
 */
@Controller
@RequestMapping(value = "app/depth")
public class AppWebDepthController extends BaseController {

	@Autowired
	private WebDepthService webDepthService;// 深度游

	@Autowired
	private WebPriceSearchService webPriceSearchService;// 价格筛选

	@Autowired
	private WebDepthSubjectService webDepthSubjectService;// 主题

	@Autowired
	private WebDepthAzimuthService webDepthAzimuthService;// 方位

	@Autowired
	private WebDepthPointService webDepthPointService;// 亮点

	@Autowired
	private WebDepthTripService webDepthTripService;// 行程

	@Autowired
	private WebEvaluataService webEvaluataService;// 评价

	@Autowired
	private CommonUploadService commonUploadService;// 图片上传

	@Autowired
	private WebDepthPricesService webDepthPricesService;// 价格查询

	@Autowired
	private WebDepthPricesContainService webDepthPricesContainService;// 价格包含
	
	@Autowired
	private WebUserService webUserService;//用户

	/**
	 * 获取列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			// 转换价格区间
			Long priceId = param.getLong("priceId");
			if (priceId != null) {
				WebPriceSearch webPrice = webPriceSearchService
						.getById(priceId);
				param.put("priceStart", webPrice.getPriceStart());
				param.put("priceEnd", webPrice.getPriceEnd());
			}
			param.put("picType", "appCover");// app封面图片
			res.putData("depthList", webDepthService.getAppDepthList(param));
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
	 * 获取6个推荐
	 * 
	 * @return
	 */
	@RequestMapping(value = "recommendList")
	@ResponseBody
	public PageData recommendList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long userId = param.getLong("userId");
			res.putData("recommendList", webDepthService.getRecommendList("appCover",userId));
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
	 * 获取方位列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "azimuthList")
	@ResponseBody
	public PageData azimuthList() {
		PageData res = new PageData();
		try {
			res.putData("azimuthList", webDepthAzimuthService.allList());
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
	 * 获取主题列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "subjectList")
	@ResponseBody
	public PageData subjectList() {
		PageData res = new PageData();
		try {
			res.putData("subjectList", webDepthSubjectService.allList());
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
	 * 获取天数列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "dayList")
	@ResponseBody
	public PageData dayList() {
		PageData res = new PageData();
		try {
			res.putData("dayList", webDepthService.dayList());
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
	 * 获取深度游详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				param.put("picType1", "appCover");
				param.put("picType2", "appTrip");
				PageData depth = webDepthService.getDepthById(param);
				res.putData("depth", depth);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 根据深度游id获取亮点列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "point/list")
	@ResponseBody
	public PageData pointList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("pointList",
						webDepthPointService.getPointListByDepthId(depthId));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 根据亮点id获取亮点详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "point/detail")
	@ResponseBody
	public PageData pointDetail() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long pointId = param.getLong("pointId");
			if (ValidateHelper.isNullOrEmpty(pointId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("point", webDepthPointService.getPointById(pointId));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 根据深度游id获取详细行程
	 * 
	 * @return
	 */
	@RequestMapping(value = "trip")
	@ResponseBody
	public PageData tripList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> list = null;
				list = webDepthTripService.getTripListByDepthId(depthId);
				for (PageData trip : list) {
					Long tripId = trip.getLong("id");
					trip.put("addrs",
							webDepthTripService.getTripAddrsByTripId(tripId));// 行程地址（用“-”拼接）
					/*trip.put("trafficList",
							webDepthTripService.getTripTrafficByTripId(tripId));// 行程交通
					trip.put("imgList",
							webDepthTripService.getTripImgByTripId(tripId));// 行程图片*/					
					List<PageData> imgList = webDepthTripService.getTripImgByTripId(tripId);
					imgList.addAll(webDepthTripService.getAppTrafficByTripId(tripId));
					trip.put("traimglist", imgList);
				}
				res.putData("tripList", list);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取所有评价
	 * 
	 * @return
	 */
	@RequestMapping(value = "evaluate")
	@ResponseBody
	public PageData evaluate() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				param.put("fromType", "depth");
				param.put("goodsId", depthId);
				List<PageData> list = webEvaluataService.findAppEvaluateList(param);
				for (PageData evaluate : list) {
					String id = evaluate.getString("id");
					List<PageData> photoList = commonUploadService.listUpload(
							"evaluate", "depth", id);
					evaluate.put("photoList", photoList);
				}
				res.putData("evaluateList", list);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 价格查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "pricesList")
	@ResponseBody
	public PageData pricesList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("pricesList",
						webDepthPricesService.findPriceList(param));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 价格包含
	 * 
	 * @return
	 */
	@RequestMapping(value = "pricesContain")
	@ResponseBody
	public PageData pricesContain() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("pricesContain", webDepthPricesContainService
						.findPricesContainList(depthId));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "submitOrder")
	@ResponseBody
	public PageData submitOrder() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("submitOrder", param, new String[] {
					"goodsId", "userId", "startTime", "startAddrId",
					"personName", "personPhone","realPrice" }, new String[] { "深度游id",
					"用户id", "出发日期", "出发城市", "联系人姓名", "联系人手机号","订单总价" });
			if (isSuccess) {
				if (!isTokenSuccess(param)){// 检查token
					return param;
				}
				webDepthService.saveOrder(param);
				res.putData("orderId", param.get("orderFormId"));
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
	 * 进入订单页面时，得到当前登录人信息
	 * @return
	 */
	@RequestMapping(value = "user")
	@ResponseBody
	public PageData user() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long userId = param.getLong("userId");
			if (ValidateHelper.isNullOrEmpty(userId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("user", webUserService.findUserLevelById(userId));
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 修改深度游点击量
	 * @return
	 */
	@RequestMapping(value = "updateDepthClickNum")
	@ResponseBody
	public PageData updateDepthClickNum() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long depthId = param.getLong("depthId");
			if (ValidateHelper.isNullOrEmpty(depthId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				webDepthService.updateClickNum(depthId);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 修改深度游-亮点点击量
	 * @return
	 */
	@RequestMapping(value = "updatePointClickNum")
	@ResponseBody
	public PageData updatePointClickNum() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long pointId = param.getLong("pointId");
			if (ValidateHelper.isNullOrEmpty(pointId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				webDepthPointService.updateClickNum(pointId);
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取收藏-深度游列表
	 * @return
	 */
	@RequestMapping(value = "collectList")
	@ResponseBody
	public PageData collectList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			if (!isTokenSuccess(param)){// 检查token
				return param;
			}
			param.put("picType", "appCover");
			res.putData("depCoList", webDepthService.findDepthCollection(param));
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			
			// 更新token
			updateNewToken(param);
			String newToken = param.getString(XConst.API_TOKEN_KEY);
			res.putData(XConst.API_TOKEN_KEY, newToken);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
