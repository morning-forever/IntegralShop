package com.bm.webs.controller.app.roamMall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bm.webs.controller.BaseController;

/**
 * 评价模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年10月08日
 */
@Controller
@RequestMapping(value = "app/evaluate")
public class AppEvaluateController extends BaseController {

	@Override
	protected String getMenuKey() {
		return null;
	}

}
