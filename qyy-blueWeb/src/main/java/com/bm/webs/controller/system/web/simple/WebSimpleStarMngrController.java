package com.bm.webs.controller.system.web.simple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebSimpleHotelStar;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebSimpleHotelStarService;

/**
 * 智易行酒店管理
 * 
 * @author mike <br>
 *         2015年8月20日
 */
@Controller
@RequestMapping(value = "admin/simplestarmngr")
public class WebSimpleStarMngrController extends BaseController {

	@Autowired
	private WebSimpleHotelStarService hotelStarService;

	/**
	 * 主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/simple/main_star");
		try {
			List<WebSimpleHotelStar> list = hotelStarService.allList();
			mav.addObject("starList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 加载list数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("starId", HString.isEmpty(json.get("starId")) ? "" : json.get("starId"));
			}
			res = hotelStarService.findStarList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取详情
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			WebSimpleHotelStar wshs = hotelStarService.getById(param.getLong("id"));
			if(wshs != null ){
				res.put("star", wshs);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存星级
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save(){
		PageData res = null;
		try {
			PageData param = super.getPageData();
			res = hotelStarService.save(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除星级
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public PageData delete(){
		PageData res = null;
		try {
			PageData param = super.getPageData();
			res = hotelStarService.delStar(param.getLong("id"));
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
