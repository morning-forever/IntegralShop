package com.bm.webs.controller.system.depth;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.file.FileUpload;
import com.bm.webs.bean.PageData;
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
import com.bm.webs.service.web.WebCitysService;

/**
 * 后台主题深度游
 * 
 * @author jiangl <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "admin/depth")
public class AdminDepthController extends BaseController {

	@Autowired
	private WebDepthService webDepthService;// 深度游

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
	private WebDepthPricesService webDepthPricesService;// 价格查询

	@Autowired
	private WebDepthPricesContainService webDepthPricesContainService;// 价格包含
	
	@Autowired
	private CommonUploadService commonUploadService;//文件上传
	
	@Autowired
	private ProvisionService provisionService;//购买须知
	
	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView depthIndex() {
		ModelAndView mav = new ModelAndView("system/depth/admin_depth_list");
		try {
			List<PageData> subjectList = webDepthSubjectService.allList();// 主题
			List<PageData> azimuthList = webDepthAzimuthService.allList();// 方位
			List<PageData> dayList = webDepthService.dayList();// 天数
			List<PageData> cityList = webCitysService.findCitysList(null, null);// 城市
			mav.addObject("subjectList", subjectList);
			mav.addObject("azimuthList", azimuthList);
			mav.addObject("dayList", dayList);
			mav.addObject("cityList", cityList);
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
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("depthName", json.get("depthName"));
				param.put("cityId", json.get("cityId"));
				param.put("subjectId", json.get("subjectId"));
				param.put("azimuthId", json.get("azimuthId"));
				param.put("expon", json.get("expon"));
				param.put("days", json.get("days"));
				param.put("adultPrice", json.get("adultPrice"));
				param.put("childPrice", json.get("childPrice"));
			}
			res = webDepthService.getAdminDepthList(param);
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
		ModelAndView mav = new ModelAndView("system/depth/admin_depth_info");
		try {
			PageData param = getPageData();
			param.put("depthId", id);
			PageData depth = webDepthService.findAdminDepthById(id);
			mav.addObject("depth", depth);// 深度游基本详情
			mav.addObject("cityList", JSONObject.toJSON(webCitysService.findCitysList(null, null)));// 城市列表
			mav.addObject("subjectList", JSONObject.toJSON(webDepthSubjectService.allList()));// 主题
			mav.addObject("azimuthList", webDepthAzimuthService.allList());// 方位
			mav.addObject("containList",JSONObject.toJSON(webDepthPricesContainService.findPricesContainList(id)));//价格包含
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 保存深度游详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "saveDepth")
	@ResponseBody
	public PageData saveDepth() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			param.put("adminId", sysset.getU().getId());//当前登录人id
			webDepthService.saveDepth(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 图片上传
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="imgFileUpload",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData imgFileUpload(@RequestParam("img")MultipartFile file,HttpServletRequest request){
		PageData res = super.getPageData();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String oldName = file.getOriginalFilename();
			String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath = request.getSession().getServletContext().getRealPath("") + "/uploadFiles/uploadImgs";
			String urlPath = "uploadFiles/uploadImgs/";
			String fileName = sdf.format(new Date()) + suffix;
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);
			res.put("imgUrl", urlPath+fileName);
			
			//判断图片大小
			File fileObj = new File(realPath+"/"+fileName);  
			BufferedImage buff = ImageIO.read(new FileInputStream(fileObj));
			double ratio = (double)buff.getWidth()/buff.getHeight();
			if(ratio < 1.7 || ratio > 2.3){
				res.putStatus("size_error");//大小不符合规定
			}
		} catch (Exception e) {
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
			List<PageData> pricesList = webDepthPricesService.findPriceList(param);
			res.put("pricesList", pricesList);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 跳转至行程页面
	 * @return
	 */
	@RequestMapping(value = "trip")
	public ModelAndView toTrip() {
		ModelAndView mav = new ModelAndView("system/depth/admin_depth_trip_info");
		try {
			PageData param = getPageData();
			Long depthId = param.getLong("depthId");
			Long day = param.getLong("day");
			List<PageData> webTripList = commonUploadService.listUpload("depth", "webTrip", depthId.toString());
			List<PageData> appTripList = commonUploadService.listUpload("depth", "appTrip", depthId.toString());
			if(webTripList.size() > 0){
				mav.addObject("webTrip", webTripList.get(0));
			}
			if(appTripList.size() > 0){
				mav.addObject("appTrip", appTripList.get(0));
			}
			mav.addObject("depthId", depthId);//深度游id
			mav.addObject("day", day);//行程天数
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 获取行程列表
	 * @return
	 */
	@RequestMapping(value = "tripList")
	@ResponseBody
	public PageData tripList() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			List<PageData> list = null;
			Long depthId = param.getLong("depthId");
			list = webDepthTripService.getTripListByDepthId(depthId);
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
	 * 保存行程
	 * @return
	 */
	@RequestMapping(value = "saveTrip")
	@ResponseBody
	public PageData saveTrip() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthTripService.saveTrip(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取交通工具方式列表
	 * @return
	 */
	@RequestMapping(value = "toolList")
	@ResponseBody
	public PageData toolList() {
		PageData res = new PageData();
		try {
			List<PageData> toolList = webDepthService.findToolList();
			res.put("toolList", toolList);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除深度游
	 * @return
	 */
	@RequestMapping(value = "deleteDepth")
	@ResponseBody
	public PageData deleteDepth() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthService.deleteDepth(param.getLong("depthId"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 上架和下架
	 * @return
	 */
	@RequestMapping(value = "onOffLine")
	@ResponseBody
	public PageData onOffLine() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthService.onOffLine(param.getLong("depthId"),param.getLong("isShelves"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 跳转至价格页面
	 * @return
	 */
	@RequestMapping(value = "price/main")
	public ModelAndView toPrice() {
		ModelAndView mav = new ModelAndView("system/depth/depth_price_main");
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	//王冠中更新
	
	/**
	 * 跳转到购买须知编辑页
	 * @return
	 */
	@RequestMapping(value = "provision")
	public ModelAndView payProvision(){
		ModelAndView mav=new ModelAndView();
		try {
			mav.setViewName("system/depth/pay_provision");
			String provision=provisionService.findProvision();
			mav.addObject("provision", provision);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 提交修改购买须知
	 * @return
	 */
	@RequestMapping(value = "saveProvision")
	@ResponseBody
	public PageData saveProvision() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			provisionService.saveProvision(param);
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
