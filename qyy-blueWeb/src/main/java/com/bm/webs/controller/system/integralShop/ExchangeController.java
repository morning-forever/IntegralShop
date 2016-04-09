package com.bm.webs.controller.system.integralShop;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.OrderService;
import com.bm.webs.vo.OrderView;

@Controller
@RequestMapping("admin/integralShop/exchange_manage")
public class ExchangeController extends BaseController{
	
	
	@Resource
	private OrderService orderService;

	@RequestMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/integralShop/exchange_manage_main");
		
		return mav;
	}
	
	@RequestMapping("list")
	@ResponseBody
	public PageData list() throws Exception{
		
		PageData param = getSysPageData();
		String search = param.getString("search[value]");
		if (!HString.isEmpty(search)) {
			JSONObject json = JSON.parseObject(search);
			param.put("name", json.get("name"));
		}
		PageData pageData= orderService.getAllUserExchRcds(param);
		return pageData;
	}
	
	@RequestMapping("waybillNumberEditUI/{id}")
	public ModelAndView waybillNumberEditUI(@PathVariable Integer id){
		
		ModelAndView mav = new ModelAndView("system/integralShop/waybillNumberEditUI");
		
		mav.addObject("id",id);
		
		return mav;
	}
	
	@RequestMapping("saveWayBillNo")
	@ResponseBody
	public PageData saveWayBillNo(OrderView orderView){
		PageData pageData = new PageData();
		try {
			orderService.saveWaybillNumber(orderView);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pageData.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		return pageData;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}
}
