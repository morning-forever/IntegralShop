package com.bm.webs.controller.app.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebCitysService;

/**
 * 城市模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月08日
 */
@Controller
@RequestMapping(value = "app/city")
public class AppCityController extends BaseController {

	@Autowired
	private WebCitysService webCitysService;//城市

	/**
	 * 获取所有城市列表
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			res.putData("cityList", webCitysService.findCitysList(null, null));
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
	 * 根据城市获取区域列表
	 * @return
	 */
	@RequestMapping(value = "countyList")
	@ResponseBody
	public PageData countyList() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			Long cityId = param.getLong("cityId");
			if (ValidateHelper.isNullOrEmpty(cityId)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("countyList", webCitysService.findCountyByCityId(cityId));
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

	@Override
	protected String getMenuKey() {
		return null;
	}

}
