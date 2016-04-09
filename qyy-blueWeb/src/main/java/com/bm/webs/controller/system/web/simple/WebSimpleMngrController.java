package com.bm.webs.controller.system.web.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;

/**
 * 智易行管理
 * 
 * @author mike <br>
 *         2015年9月10日
 */
@Controller
@RequestMapping("admin/websimplemngr")
public class WebSimpleMngrController extends BaseController {

	/**
	 * 跳转到主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/simple/main");
		return mav;
	}

	/**
	 * 返回list数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData param = this.getSysPageData();

		return param;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
