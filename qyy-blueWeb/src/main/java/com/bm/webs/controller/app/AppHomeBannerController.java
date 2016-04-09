package com.bm.webs.controller.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebHomeBannerService;

/**
 * APP首页模块
 * 
 * @author liuw
 * 
 *         2015年9月22日
 */
@Controller(value = "appHomeController")
@RequestMapping(value = "app/banner")
public class AppHomeBannerController extends BaseController {

	@Autowired
	private WebHomeBannerService bannerService;

	/**
	 * 轮播图
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData bannerList() {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		try {
			PageData data = super.getApiPageData();
			boolean isCheck = super.checkParam("bannerList", data, new String[] { "type" }, new String[] { "轮播图类型" });
			if (!isCheck) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				List<PageData> bannerList = bannerService.bannerList(data.getString("type"));
				if (!HString.isEmpty(bannerList)) {
					res.putData("bannerList", bannerList);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
				}
//				else{
//					res.putFlag(true);
//					res.putMessage(XConst.NO_EXISTS);
//				}
			}
		} catch (Exception e) {
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
