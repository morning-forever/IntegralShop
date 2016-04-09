package com.bm.webs.controller.system;

import java.io.File;

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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.AppVersionService;

@Controller(value = "adminVersionController")
@RequestMapping(value = "admin/version")
public class VersionController extends BaseController {

	@Autowired
	private AppVersionService versionService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/version/main");
		try {
			mav.addObject("versionList", versionService.selectVersionList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("issueVersion", HString.isEmpty(json.get("issueVersion")) ? "" : json.get("issueVersion"));
				param.put("appSys", HString.isEmpty(json.getString("appSys")) ? "" : json.getString("appSys"));
			}
			res = versionService.findVersionList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "detail")
	@ResponseBody
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/version/detail");
		try {
			PageData param = super.getSysPageData();
			if(param.getLong("id") != 0){
				PageData res = versionService.detail(param);
				mav.addObject("detail", res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = false;
			SystemSet set = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			AdminLogin login = set.getUser();
			param.put("userId", login.getAdminId());
			if (param.containsKey("id") && param.getLong("id") != null) {
				isOk = versionService.updateVersion(param);
			} else {
				isOk = versionService.addVersion(param);
			}
			if (isOk) {
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "dels")
	@ResponseBody
	public PageData dels() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			boolean isOk = versionService.delVersion(param);
			if (isOk) {
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	private final static String FILE_SAVE_PATH = "static/upload/";
	
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
				if("android".equals(type)){
					if(!".apk".equals(fileType)){
						map.put(XConst.STATUS_KEY, XConst.CHECK_TYPE_ERROR);
						return map;
					}
				}else{
					if(!".ipa".equals(fileType)){
						map.put(XConst.STATUS_KEY, XConst.CHECK_TYPE_ERROR);
						return map;
					}
				}
				fileName = FILE_SAVE_PATH + "download/" + file.getOriginalFilename();
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
	
	
	
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
