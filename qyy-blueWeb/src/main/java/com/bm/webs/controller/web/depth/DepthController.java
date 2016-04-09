package com.bm.webs.controller.web.depth;

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
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.depth.ProvisionService;
import com.bm.webs.service.depth.WebDepthAzimuthService;
import com.bm.webs.service.depth.WebDepthPointService;
import com.bm.webs.service.depth.WebDepthPricesContainService;
import com.bm.webs.service.depth.WebDepthPricesService;
import com.bm.webs.service.depth.WebDepthService;
import com.bm.webs.service.depth.WebDepthSubjectService;
import com.bm.webs.service.depth.WebDepthTripService;
import com.bm.webs.service.depth.WebUserCollectionService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebEvaluataService;
import com.bm.webs.service.web.WebHomeBannerService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * pc端主题深度游
 * 
 * @author mike <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "pc/depth")
public class DepthController extends BaseController {

	@Autowired
	private WebDepthService webDepthService;// 深度游

	@Autowired
	private WebPriceSearchService webPriceSearchService;// 价格筛选

	@Autowired
	private WebDepthSubjectService webDepthSubjectService;// 主题

	@Autowired
	private WebDepthAzimuthService webDepthAzimuthService;// 方位

	@Autowired
	private WebCitysService webCitysService;// 城市

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
	private WebUserService webUserService;// 用户

	@Autowired
	private WebUserCollectionService webUserCollectionService;// 收藏
	
	@Autowired
	private WebHomeBannerService homeBannerService;//banner
	
	@Autowired
	private ProvisionService provisionService;//购买须知
	
	private static final String WEB_DEPTH = "web_depth";

	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "home")
	public ModelAndView depthIndex() {
		ModelAndView mav = new ModelAndView("web/depth/depth_home");
		try {
			PageData param = getPageData();
			List<PageData> subjectList = webDepthSubjectService.allList();// 主题
			List<PageData> azimuthList = webDepthAzimuthService.allList();// 方位
			List<PageData> dayList = webDepthService.dayList();// 天数
			List<WebPriceSearch> priceList = webPriceSearchService
					.getList("depth");// 价格
			List<PageData> cityList = webCitysService.findCitysList(null, null);// 城市
			List<PageData> recommendList = webDepthService.getRecommendList("webCover",null);// 6个推荐
			param.put("picType", "webCover");// web封面图片
			List<PageData> depthList = webDepthService.getAppDepthList(param);// 深度游排行榜
			
			// 获取banner图
			String type = "depth";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if(!HString.isEmpty(bannerList)){
				mav.addObject("bannerList", bannerList);
				int [] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
			
			mav.addObject("subjectList", subjectList);
			mav.addObject("azimuthList", azimuthList);
			mav.addObject("dayList", dayList);
			mav.addObject("priceList", priceList);
			mav.addObject("cityList", cityList);
			mav.addObject("recommendList", recommendList);
			mav.addObject("depthList", depthList);
			mav.addObject("thisPageSize", 0);
			mav.addObject("totalPage", 0);
			mav.addObject("pageNo", 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询深度游列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			res = webDepthService.getPCDepthList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询明细
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	public ModelAndView detail(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView("web/depth/depth_detail");
		try {
			PageData param = getPageData();
			param.put("depthId", id);
			param.put("picType1", "webCover");// 封面图片
			param.put("picType2", "webTrip");// 行程图片
			Long userId = getWebLoginUser();
			if(userId != null){
				param.put("userId", userId);
			}
			PageData depth = webDepthService.getDepthById(param);
			Long depthId = depth.getLong("id");// 深度游id
			String[] labelArr = depth.getString("label").split(",");
			mav.addObject("depth", depth);// 深度游基本详情
			mav.addObject("labelArr", labelArr);// 标签列表
			mav.addObject("cityList", webCitysService.findCitysList(null, null));// 城市列表
			mav.addObject("pointList",webDepthPointService.getPointListByDepthId(depthId));
			
			String provision=provisionService.findProvision();
			mav.addObject("provision", provision);
			
			// 点击量+1
			webDepthService.updateClickNum(depthId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询亮点详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "pointDetail")
	@ResponseBody
	public PageData pointDetail() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			res.put("point",
					webDepthPointService.getPointById(param.getLong("pointId")));

			// 点击量+1
			webDepthPointService.updateClickNum(param.getLong("pointId"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询行程详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "trip")
	@ResponseBody
	public PageData trip() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			List<PageData> list = null;
			list = webDepthTripService.getTripListByDepthId(param
					.getLong("depthId"));
			for (PageData trip : list) {
				Long tripId = trip.getLong("id");
				trip.put("addrList",
						webDepthTripService.getTripAddrsListByTripId(tripId));// 行程地址（用“-”拼接）
				trip.put("trafficList",
						webDepthTripService.getTripTrafficByTripId(tripId));// 行程交通
				trip.put("imgList",
						webDepthTripService.getTripImgByTripId(tripId));// 行程图片
			}
			res.put("tripList", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
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
			PageData param = getPageData();
			res.put("pricesContain",
					webDepthPricesContainService.findPricesContainList(param.getLong("depthId")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
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
			PageData param = getPageData();
			param.put("startTime", new Date());
			res.put("pricesList", webDepthPricesService.findPriceList(param));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取所有评价
	 * 
	 * @return
	 */
	@RequestMapping(value = "evaluateList")
	@ResponseBody
	public PageData evaluate() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			res = webEvaluataService.findPCEvaluateList(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 收藏（添加和取消）
	 * @return
	 */
	@RequestMapping(value = "doCollect")
	@ResponseBody
	public PageData doCollect() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Long userId = getWebLoginUser();
			if(userId != null){
				param.put("userId", userId);
				param.put("fromTable", WEB_DEPTH);
				Integer collectionId = webUserCollectionService.checkCollection(param);
				//未收藏，则添加收藏
				if (collectionId == null){
					webUserCollectionService.insert(param.getLong("fromId"), userId, WEB_DEPTH);
					res.put("val", 1);
				}
				//已收藏，则取消收藏
				else{
					webUserCollectionService.delete(param.getLong("fromId"), userId, WEB_DEPTH);
					res.put("val", 0);
				}
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.UNLOGIN);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 进入订单页
	 * 
	 * @return
	 */
	@RequestMapping(value = "toOrder")
	public ModelAndView toOrder() {
		ModelAndView mav = new ModelAndView("web/depth/depth_order");
		try {
			PageData param = getPageData();
			SystemSet sysset = (SystemSet) getRequest().getSession()
					.getAttribute(XConst.SESSION_SYSSET);
			param.put("picType1", "webCover");// 封面图片
			param.put("picType2", "webTrip");// 行程图片
			mav.addObject("city", webCitysService.getById(param.getLong("fromCityId")));// 城市名称
			mav.addObject("depth", webDepthService.getDepthById(param));// 深度游详情
			mav.addObject("inputInfo", param);// 上一个页面用户填写的信息
			mav.addObject("webUser", webUserService.findUserLevelById(sysset.getWebUser().getId()));//当前登录用户信息
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	@RequestMapping(value = "submitOrder")
	@ResponseBody
	public PageData submitOrder() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			SystemSet sysset = (SystemSet) getRequest().getSession()
					.getAttribute(XConst.SESSION_SYSSET);
			Long levelId = webUserService.findUserLevelById(sysset.getWebUser().getId()).getLong("levelId");//级别id
			//如果级别小于4，即青铜三星以下，则需要校验验证码
			if(levelId != null && levelId < 4){
				String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");//获取验证码
				String code = param.getString("code");
				if(HString.isEmpty(code) || !code.toLowerCase().equals(vcode)){
					res.putStatus(XConst.V_CODE_ERROR);//验证码错误
					return res;
				}
			}
			param.put("userId", sysset.getWebUser().getId());//当前登录用户id
			
			//add by guochaoyong 20160408 (用于发送通知邮件时，邮件内容写明是哪个用户提交的订单)
			param.put("nickname", sysset.getWebUser().getNickname());
			//end
			
			webDepthService.saveOrder(param);//提交订单
			res.put("orderId", param.get("orderFormId"));//返回订单号
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
