package com.bm.webs.controller.web;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.file.FileUpload;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.controller.util.TaskService;
import com.bm.webs.service.depth.WebDepthService;
import com.bm.webs.service.system.AppVersionService;
import com.bm.webs.service.system.WebRecommendService;
import com.bm.webs.service.web.WebHomeBannerService;
import com.bm.webs.service.web.WebSearchService;
import com.bm.webs.service.web.center.FeedbackService;
import com.bm.webs.service.web.center.WebHelperService;
import com.bm.webs.service.web.user.WebUserService;

@Controller
@RequestMapping(value = "/pc")
public class IndexController extends BaseController {

	@Autowired
	private WebDepthService webDepthService;// 深度游

	@Autowired
	private WebSearchService searchService;

	@Autowired
	private WebHelperService helperService;

	@Autowired
	private FeedbackService feedbackService;// 反馈

	@Autowired
	private WebHomeBannerService homeBannerService;

	@Autowired
	private WebRecommendService webRecommendService;

	@Autowired
	private WebUserService webUserService;
	
	@Autowired
	private AppVersionService appVersionService;
	
	@Autowired
	private TaskService taskService;

	@RequestMapping(value = "home")
	public ModelAndView index(String op) {
		ModelAndView mav = new ModelAndView("web/home");
		try {
			mav.addObject("recommendList", webDepthService.getRecommendList("appCover", null));
			mav.addObject("op", op);

			// 获取首页的banner图
			String type = "home";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if (!HString.isEmpty(bannerList)) {
				mav.addObject("bannerList", bannerList);
				int[] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
			PageData param = new PageData();
			param.put("fromType", "bbs");
			param.put("orderNumber", 4);
			List<Map<String, Object>> frendRecommendList = webRecommendService.findTravelsRecommendList(param);
			mav.addObject("frendRecommendList", frendRecommendList);

			param.clear();
			param.put("fromType", "travels");
			param.put("orderNumber", 4);
			List<Map<String, Object>> travelsRecommendList = webRecommendService.findTravelsRecommendList(param);
			mav.addObject("travelsRecommendList", travelsRecommendList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "simple/home")
	public ModelAndView simpleIndex() {
		ModelAndView mav = new ModelAndView();
		try {

			mav.setViewName("web/simple/travel_plan");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="testPage")
	public ModelAndView testPage(){
		return new ModelAndView("web/test");
	}
	
	/*@RequestMapping(value="test")
	@ResponseBody
	public String test(Form1 form1,Form2 form2){
		taskService.saveLoginCount();
		return "success";
	}*/

	// @RequestMapping(value = "depth/home")
	// public ModelAndView depthIndex() {
	// ModelAndView mav = new ModelAndView("web/depth/depth_home");
	// return mav;
	// }

	/**
	 * 跳转到论坛主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "interact/home")
	public ModelAndView interactIndex() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData param = new PageData();
			param.put("fromType", "bbs");
			param.put("orderNumber", 7);
			List<Map<String, Object>> travelsRecommendList = webRecommendService.findTravelsRecommendList(param);
			List<Map<String, Object>> masterList = webUserService.findMasterUserDynamic();
			param.put("showLine", 10);
			param.put("startLine", 0);
			List<Map<String, Object>> userList = webUserService.findActiveList(param);
			String type = "bbs_banner";
			List<PageData> bannerList = homeBannerService.webBannerList(type);
			Integer bannerListCount = homeBannerService.webBannerListCount(type);
			if (!HString.isEmpty(bannerList)) {
				mav.addObject("bannerList", bannerList);
				int[] counts = new int[bannerListCount];
				mav.addObject("bannerListCount", counts);
			}
			mav.addObject("travelsRecommendList", travelsRecommendList);
			mav.addObject("userList", userList);
			mav.addObject("masterList", masterList);
			mav.setViewName("web/interact/interact_home");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "findActiveList")
	@ResponseBody
	public PageData findActiveList() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = super.getApiPageData();
			List<Map<String, Object>> userList = webUserService.findActiveList(param);
			if (!HString.isEmpty(userList)) {
				res.putData("userList", userList);
				res.putMessage(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查找
	 * 
	 * @return
	 */
	@RequestMapping(value = "search")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("web/common/search_list");
		try {
			PageData param = super.getPageData();
			String fromType = param.getString("fromType");
			String title = param.getString("title");
			String ntit = "";
			if (!HString.isEmpty(title))
				ntit = URLDecoder.decode(title,"utf-8");
			if (HString.isEmpty(ntit))
				ntit = title;
			mav.addObject("fromType", fromType);
			mav.addObject("title", ntit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查找返回的数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "searchList")
	@ResponseBody
	public PageData searchList() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			boolean isSuccess = checkParam("search", param, new String[] { "fromType" }, new String[] { "搜索类型" });
			if (isSuccess) {
				res = searchService.searchWebByFromType(param);
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "aboutWe")
	public ModelAndView aboutWe() {
		ModelAndView mav = new ModelAndView("web/common/about_we");
		return mav;
	}

	@RequestMapping(value = "contactWe")
	public ModelAndView contactWe() {
		ModelAndView mav = new ModelAndView("web/common/contact_we");
		return mav;
	}
	
	@RequestMapping(value = "appDownload")
	public ModelAndView appDownload() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData ios=appVersionService.findAppNewVersion(XConst.IOS);
			PageData android=appVersionService.findAppNewVersion(XConst.ANDROID);
			mav.addObject("ios", ios);
			mav.addObject("android", android);
			mav.setViewName("web/common/app_download");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "helpMain")
	public ModelAndView helpMain() {
		ModelAndView mav = new ModelAndView("web/common/help_main");
		return mav;
	}

	/**
	 * 获取帮助列表信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "helpList")
	@ResponseBody
	public PageData helpList() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData param = this.getApiPageData();
			res = helperService.helperWebList(param);
		} catch (Exception e) {
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 添加反馈信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "addFeedBack")
	@ResponseBody
	public PageData addFeedBack() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			feedbackService.addFeedback(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 
	 * 异步上传图片
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "imgFileUpload")
	@ResponseBody
	public void imgFileUpload(@RequestParam("img") MultipartFile file, HttpServletRequest request) {
		PageData reqData = super.getPageData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		try {
			String oldName = file.getOriginalFilename();
			String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath = request.getSession().getServletContext().getRealPath("") + "/uploadFiles/uploadImgs";
			String urlPath = "uploadFiles/uploadImgs/";
			String fileName = sdf.format(new Date()) + suffix;
			// System.out.println(request.getServletPath());
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);
			// System.out.println(fileName);
			reqData.put("imgUrl", urlPath + fileName);
			getResponse().setContentType("text/plain");
			getResponse().getWriter().print(JSONObject.toJSONString(reqData));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return reqData;
	}

	@RequestMapping(value = "protocol")
	public ModelAndView userProtocol() {
		ModelAndView mav = new ModelAndView("web/common/user_protocol");
		return mav;
	}
	
	/**
	 * 跳转到手机APP下载页面
	 * @return
	 */
	@RequestMapping(value="appDownloadMobuld")
	public ModelAndView appDownloadMobuld(){
		ModelAndView mav = new ModelAndView("web/app_download");
		try {
			PageData ios=appVersionService.findAppNewVersion(XConst.IOS);
			PageData android=appVersionService.findAppNewVersion(XConst.ANDROID);
			mav.addObject("ios", ios);
			mav.addObject("android", android);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
