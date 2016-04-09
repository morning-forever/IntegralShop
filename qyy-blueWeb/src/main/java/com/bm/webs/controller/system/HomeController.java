package com.bm.webs.controller.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.Page;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.urrm.LoginService;
import com.bm.webs.service.system.urrm.MenuService;

@Controller
@RequestMapping(value = "admin/home")
public class HomeController extends BaseController {

	public HomeController() {}

	private static final String TAG = "HomeController";

	@Resource(name = "menuService")
	private MenuService menuService;
	
	@Resource(name ="loginService")
	private LoginService loginService;
	

	@RequestMapping("/init")
	public String init() {
		super.logBefore(logger, TAG, "init");
		super.logAfter(logger);
		return "main/login";
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		super.logBefore(logger, TAG, "index");
		ModelAndView mv = super.getModelAndView();
		try {
			mv.setViewName("main/index");
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.logAfter(logger);
		return mv;
	}

	@RequestMapping("/defaults")
	public String defaults(Page page) {
		super.logBefore(logger, TAG, "defaults");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String KEYW = pd.getString("keyword");
			
			if(null != KEYW && !"".equals(KEYW)){
				KEYW = KEYW.trim();
				pd.put("KEYW", KEYW);
			}
			page.setPd(pd);
			List<PageData> varList = loginService.list(page);	//列出列表
			pd.put("varList", varList);
			pd.put("keyword", KEYW);
			pd.put("flag", XConst.SUCCESS);
			super.getRequest().setAttribute("pageData", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		super.logAfter(logger);
		return "main/default";
	}

	
	/**iDisplayStart,iDisplayLength,sEcho
	 * 列表
	 */
	@RequestMapping(value="/list")
	@ResponseBody
	public PageData list(Page page){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String KEYW = pd.getString("keyword");
			
			if(null != KEYW && !"".equals(KEYW)){
				KEYW = KEYW.trim();
				pd.put("KEYW", KEYW);
			}
			page.setPd(pd);
			List<PageData> varList = loginService.list(page);	//列出Pictures列表
			pd.put("varList", varList);
			pd.put("iTotalRecords", "");
			pd.put("iTotalDisplayRecords", "");
			pd.put("iDisplayLength", 1);
			pd.put("iDisplayStart", 1);
			System.out.println(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
