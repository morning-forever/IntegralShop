package com.bm.webs.controller.app.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 价格区间模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月08日
 */
@Controller
@RequestMapping(value = "app/price")
public class AppPriceController extends BaseController {

	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选

	/**
	 * 获取列表
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData data() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			String searchType = param.getString("searchType");
			if (ValidateHelper.isNullOrEmpty(searchType)) {
				res.putMessage(XConst.PARAM_ERR);
			} else {
				res.putData("priceList", webPriceSearchService.getList(searchType));
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
