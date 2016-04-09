package com.bm.webs.controller.system.web.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.cart.WebCarSafeService;

/**
 * 
 * 快旅出行-保险管理
 * 
 * @author jiangl <br>
 *         2015年9月21日
 */
@Controller
@RequestMapping(value = "admin/cart/safe")
public class WebCarSafeController  extends BaseController {

	@Autowired
	private WebCarSafeService webCarSafeService;
	
	/**
	 * 获取快旅出行保险
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("system/car/safe_main");
		try {
			PageData param1 = new PageData();
			param1.put("type", "rent");
			PageData carRentSafe = webCarSafeService.findByType(param1);
			
			PageData param2 = new PageData();
			param2.put("type", "wrap");
			PageData carWrapSafe = webCarSafeService.findByType(param2);
			
			PageData param3 = getPageData();
			param3.put("type", "bus");
			PageData carBusSafe = webCarSafeService.findByType(param3);
			
			PageData param4 = getPageData();
			param4.put("type", "carpool");
			PageData carPoolSafe = webCarSafeService.findByType(param4);
			
			mav.addObject("carRentSafe", carRentSafe);
			mav.addObject("carWrapSafe", carWrapSafe);
			mav.addObject("carBusSafe", carBusSafe);
			mav.addObject("carPoolSafe", carPoolSafe);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 保存
	 * @return
	 */
	@RequestMapping(value="save")
	@ResponseBody
	public PageData save(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String id = param.getString("id");
			//新增
			if(HString.isEmpty(id)){
				webCarSafeService.insert(param);
			}
			//更新
			else{
				webCarSafeService.update(param);
			}
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
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
