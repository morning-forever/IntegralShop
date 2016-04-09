package com.bm.webs.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.file.FileHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.service.web.WebAdvertService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.cart.WebCarAddrsService;

/**
 * 公共上传
 * 
 * @author mike <br>
 *         2015年9月6日
 */
@Controller
@RequestMapping(value = "allowAccess")
public class CommonController extends BaseController {

	@Autowired
	private WebCitysService webCitysService;

	private final static String FILE_SAVE_PATH = "static/upload/";

	@Autowired
	private WebCarAddrsService webCarAddrsService;

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public PageData upload(String type, String inputName, HttpServletRequest request) {
		PageData map = new PageData(true);
		try {

			String fileType = null, fileName = null;
			File files = null;
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = multipartRequest.getFile(inputName);

			if (file != null && file.getSize() > 0) {
				fileType = file.getOriginalFilename().toLowerCase();
				map.put("name", fileType.substring(0, fileType.lastIndexOf(".")));
				fileType = fileType.substring(fileType.lastIndexOf("."));
				fileName = FILE_SAVE_PATH + type + "/" + FileHelper.getTimeFileName() + fileType;
				files = new File(XConst.WEB_ROOT_PATH + fileName);
				File dir = files.getParentFile();
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				FileCopyUtils.copy(file.getBytes(), files);
				map.put("src", fileName);
				map.put(XConst.STATUS_KEY, XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@Autowired
	private WebAdvertService advertService;
	
	
	@RequestMapping(value = "advert")
	public ModelAndView advert() {
		ModelAndView mav = new ModelAndView("web/common/advert");
		try {
			PageData param = super.getPageData();
			
			PageData detail = advertService.detail(param);
			if(!HString.isEmpty(detail)){
				mav.addObject("detail",detail);
			}else{
				return new ModelAndView("404");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * 获取所有的省
	 * 
	 * @return
	 */
	@RequestMapping(value = "provinceList")
	@ResponseBody
	public PageData provinceList() {
		PageData res = new PageData();
		try {
			// 获取省
			List<PageData> provinceList = webCitysService.findProvinceList();
			if (!HString.isEmpty(provinceList)) {
				res.put("list", provinceList);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取城市列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "cityList")
	@ResponseBody
	public PageData cityList() {
		PageData res = new PageData();
		try {
			// 获取市
			PageData data = super.getPageData();
			if (!HString.isEmpty(data.get("provinceId"))) {
				Long provinceId = Long.valueOf(data.getString("provinceId"));
				List<PageData> cityList = webCitysService.findCitysList(provinceId, null);
				if (!HString.isEmpty(cityList)) {
					res.put("list", cityList);
					res.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取区县列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "countyList")
	@ResponseBody
	public PageData countyList() {
		PageData res = new PageData();
		try {
			// 获取区县
			PageData data = super.getPageData();
			res = webCitysService.findAllList(data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "countyList1")
	@ResponseBody
	public PageData countyList1() {
		PageData res = new PageData();
		try {
			// 获取区县
			PageData data = super.getPageData();
			List<PageData> list = webCitysService.findCountyByCityId(data.getLong("cityId"));
			if (!HString.isEmpty(list)) {
				res.put("countyList", list);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回所有市级
	 * 
	 * @return
	 */
	@RequestMapping(value = "allCityList")
	@ResponseBody
	public PageData allCityList() {
		PageData res = new PageData();
		try {
			List<PageData> cityList = webCitysService.findListByType("city");
			res.put("cityAllList", cityList);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取区域下面的所有的门店
	 * 
	 * @return
	 */
	@RequestMapping(value = "addrsOfCar")
	@ResponseBody
	public PageData addrsOfCar() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			List<PageData> addrsList = webCitysService.findStoreList(Long.valueOf(param.get("countyId").toString()), param.getString("type"));
			res.put("addrsList", addrsList);
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
