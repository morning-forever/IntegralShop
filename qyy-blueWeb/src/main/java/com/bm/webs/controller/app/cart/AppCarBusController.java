package com.bm.webs.controller.app.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.cart.WebBusService;
import com.bm.webs.service.web.cart.WebCarAddrsService;

@Controller
@RequestMapping(value = "app/cart/bus")
public class AppCarBusController extends BaseController {

	@Autowired
	private WebBusService busService;
	@Autowired
	private WebCarAddrsService addrService;
	@Autowired
	private WebCarAddrsService webCarAddrsService;

	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			res = busService.getAppList(pd);
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData();
		try {
			PageData pd = super.getApiPageData();
			PageData bus = busService.findById(pd.getLong("id"));
			if (!HString.isEmpty(bus)) {
				res.putData("bus", bus);
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

	@RequestMapping(value = "submitOrder")
	@ResponseBody
	public PageData submitOrder() {
		PageData res = new PageData();
		try {
			PageData params = super.getApiPageData();
			
			boolean isSuccess = checkParam("submitOrder", params, 
					new String[] {"userId" ,"goodsId", "param", "goodsCount", "isSafe" }, 
					new String[] { "用户id", "busId", "乘车人信息", "乘坐人数", "是否保险" });
			if(isSuccess){
				
				if (!isTokenSuccess(params))// 检查token
					return params;
				
				PageData param = new PageData();
				param.put("id", params.getLong("goodsId"));
				Integer remain = busService.getBusSeatingRemain(param);
				if (remain >= params.getInt("goodsCount")) {
					params.putData("userId", params.getLong("userId"));
					Long orderId = busService.submitOrder(params);
					
					res.putData("orderId", orderId);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
					updateNewToken(params);
					String newToken = params.getString(XConst.API_TOKEN_KEY);
					res.putData(XConst.API_TOKEN_KEY, newToken);
				} else {
					res.putMessage("remainnot");
				}
			}else{
				res.putMessage(XConst.PARAM_ERR);
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
		// TODO Auto-generated method stub
		return null;
	}

}
