package com.bm.webs.controller.system.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.urrm.MenuService;

@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController {
	
	private static final String TAG = "MenuController";

	@Resource(name = "menuService")
	private MenuService menuService;
	
	@RequestMapping("/main")
	public ModelAndView init() {
		super.logBefore(logger, TAG, "init");
		ModelAndView mav = super.getModelAndView();
		try {
			List<AdminMenu> allmenuList = menuService.listAllMenu();
			PageData pd = new PageData();
//			mv.addObject("allMenu", allmenuList);
			pd.put("menuKey", this.getMenuKey());
			pd.put("allMenu", allmenuList);
			mav.addObject("pd", pd);
			mav.setViewName("system/menu/menu_main");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mav;
	}
	
	@RequestMapping("/info/${id}")
	public ModelAndView info(@PathVariable String id) {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("system/menu/menu_info");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/toEdit")
	public ModelAndView toEdit() {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("system/menu/menu_edit");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/saveEdit")
	public ModelAndView saveEdit() {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("system/menu/menu_edit");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mv;
	}
	
	
	@RequestMapping("/toAdd")
	public ModelAndView toAdd() {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("system/menu/menu_add");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/saveAdd")
	public ModelAndView saveAdd() {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("system/menu/menu_edit");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return mv;
	}
	
	@Override
	protected String getMenuKey() {
		return "0000_0000";
	}
	
}
