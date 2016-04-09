package com.bm.webs.controller.system.web.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.cart.WebCarRuleService;

@Controller(value = "adminCartController")
@RequestMapping(value = "admin/cart")
public class WebCartController extends BaseController {
	
	@Autowired
	private WebCarRuleService carRuleSerivce;
	
	
	@RequestMapping(value = "rule/main")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("system/car/rule_main");
		try {
			PageData param = new PageData();
			param.put("type", "rent");
			PageData rent = carRuleSerivce.findRuleByType(param);
			mav.addObject("rent", rent);
			
			param.put("type", "wrap");
			PageData wrap = carRuleSerivce.findRuleByType(param);
			mav.addObject("wrap", wrap);
			
			param.put("type", "bus");
			PageData bus = carRuleSerivce.findRuleByType(param);
			mav.addObject("bus", bus);
			
			param.put("type", "carpool");
			PageData carpool = carRuleSerivce.findRuleByType(param);
			mav.addObject("carpool", carpool);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	@RequestMapping(value = "rule/save")
	@ResponseBody
	public PageData save(){
		PageData res = new PageData(true);
		
		try {
			PageData param = this.getPageData();
			boolean isOk = carRuleSerivce.updateCarRule(param);
			if(isOk){
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
