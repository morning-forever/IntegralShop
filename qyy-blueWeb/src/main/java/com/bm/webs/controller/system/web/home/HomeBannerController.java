package com.bm.webs.controller.system.web.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bm.webs.controller.BaseController;

/**
 * 首页banner
 * 
 * @author mike <br>
 *         2015年11月6日
 */
@RequestMapping(value = "admin/homebanner")
@Controller(value = "adminHomeBannerController")
public class HomeBannerController extends BaseController {

	@RequestMapping(value = "index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("system/home/banner_list");
		return mav;
	}
	
	
	@RequestMapping(value = "edit")
	public ModelAndView edit() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("system/home/edit_banner");
		return mav;
	}
	
	
	
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
