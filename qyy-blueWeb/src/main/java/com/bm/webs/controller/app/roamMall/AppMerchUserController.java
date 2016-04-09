package com.bm.webs.controller.app.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.AppData;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;

/**
 * 商户模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月9日
 */
@Controller
@RequestMapping(value = "app/roamMall/user")
public class AppMerchUserController extends BaseController {
	
	@Autowired
	private MerchUserService merchUserService;//商户
	
	@Autowired
	private CommonUploadService commonUploadService;//图片上传

	/**
	 * 获取商家详情
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public AppData detail() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long merchUserId = param.getLong("merchUserId");
			if (ValidateHelper.isNullOrEmpty(merchUserId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("merchUser", merchUserService.findMerchUserById(merchUserId));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 得到商家图片
	 * @return
	 */
	@RequestMapping(value = "pic")
	@ResponseBody
	public AppData pic() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long merchUserId = param.getLong("merchUserId");
			if (ValidateHelper.isNullOrEmpty(merchUserId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				res.setData("list", commonUploadService.listUpload("merch", "head", merchUserId.toString()));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
