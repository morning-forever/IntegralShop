package com.bm.webs.controller.web.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.cart.WebBusService;
import com.bm.webs.service.web.cart.WebCarAddrsService;

/**
 * 快旅出行模块
 * 
 * @author tangxh <br>
 *         2015年9月1日
 */
@Controller(value="webBusController")
@RequestMapping(value="pc/cart/bus")
public class BusController extends BaseController {
	
	@Autowired
	private WebBusService busService;
	@Autowired
	private WebCarAddrsService addrService;
	@Autowired
	private WebCarAddrsService webCarAddrsService;
	
	@RequestMapping(value="list")
	public ModelAndView list(String startTime, Long getStoreId, Long loseStoreId){
		ModelAndView mav = super.getModelAndView();
		try {
			//查询地点
			if(getStoreId!=null){
				PageData getStore=webCarAddrsService.findSotreById(getStoreId);
				mav.addObject("getStore", getStore);
			}
			if(getStoreId!=null){
				PageData loseStore=webCarAddrsService.findSotreById(loseStoreId);
				mav.addObject("loseStore", loseStore);
			}
			mav.addObject("startTime", startTime);
			mav.setViewName("web/cart/bus_list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value="data")
	@ResponseBody
	public PageData data(){
		PageData pd = super.getApiPageData();
		try {
			//查询班车列表
			String fromTime=pd.getString("startTime");
			if(!HString.isEmpty(fromTime)){
				pd.put("startTime", fromTime.split(":")[0]);
			}
			List<PageData> list = busService.getList(pd);
			Integer resultNum = busService.getResultNum(pd);
			
			pd.put("resultNum", resultNum);
			pd.put("list", list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pd;
	}
	
	/**
	 * 
	 * 查看班车详情
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	public ModelAndView detail(@PathVariable(value = "id") Long id) {
		ModelAndView mav = new ModelAndView();
		try {
			PageData obj = busService.findById(id);
			List<PageData> images = busService.getBusImageById(Long.valueOf(obj.get("car_id").toString()));
			mav.addObject("bus", obj);
			mav.addObject("image", images);
			mav.setViewName("web/cart/bus_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 
	 * 提交订单页面跳转
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "order/{id}")
	public ModelAndView order(@PathVariable(value = "id") Long id) {
		ModelAndView mav = new ModelAndView();
		try {
			PageData obj = busService.findById(id);
			mav.addObject("bus", obj);
			mav.setViewName("web/cart/bus_order");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 
	 * 提交订单
	 * 
	 * @param id
	 * @param getStoreId
	 * @param loseStoreId
	 * @return
	 */
	@RequestMapping(value = "order/submit")
	@ResponseBody
	public PageData submit() {
		PageData pd = super.getApiPageData();
		try {
			String vcode = (String) super.getRequest().getSession().getAttribute("VCODE");
			String code = pd.getString("code");
			if(HString.isEmpty(code)){
				pd.put(XConst.STATUS_KEY, XConst.V_CODE_ERROR);
			}else if (code.toLowerCase().equals(vcode)) {
				SystemSet sets = (SystemSet) super.getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
				if(sets != null){
					WebUser user = sets.getWebUser();
					if(user != null){
						PageData param = new PageData();
						param.put("id", pd.getLong("goodsId"));
						Integer remain = busService.getBusSeatingRemain(param);
						if(remain>=pd.getInt("goodsCount")){
							pd.put("userId", user.getId());
							
							Long orderId = busService.submitOrder(pd);
							
							pd.clear();
							pd.put("orderId", orderId);
							pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
						}else{
							pd.put(XConst.STATUS_KEY, "remainnot");
						}
					}else{
						pd.put(XConst.STATUS_KEY, XConst.UNLOGIN);
					}
				}else{
					pd.put(XConst.STATUS_KEY, XConst.UNLOGIN);
				}
			} else {
				pd.put(XConst.STATUS_KEY, XConst.V_CODE_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			pd.put(XConst.STATUS_KEY, XConst.ERROR);
		}
		return pd;
	}

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
