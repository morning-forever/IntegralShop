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
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebSimpleHotelStarService;
import com.bm.webs.service.web.simple.WebSimpleHotelService;

/**
 * 智易行酒店管理
 * 
 * @author mike <br>
 *         2015年8月20日
 */
@Controller
@RequestMapping(value = "admin/simplehotelmngr")
public class WebSimpleHotelMngrController extends BaseController {

	@Autowired
	private WebSimpleHotelService simpleHotelService;

	@Autowired
	private WebCitysService webCitysService;
	@Autowired
	private WebSimpleHotelStarService hotelStarService;

	/**
	 * 主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/simple/main_hotel");
		try {
			List<PageData> cityList = simpleHotelService.cityList();
			List<PageData> starList = simpleHotelService.starList();
			mav.addObject("cityList", cityList);
			mav.addObject("starList", starList);
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
				param.put("hotelName", json.getString("hotelName"));
				param.put("addrId", HString.isEmpty(json.get("addrId")) ? "" : json.get("addrId"));
				param.put("starId", HString.isEmpty(json.get("starId")) ? "" : json.get("starId"));
			}
			res = simpleHotelService.findList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 去详情页或者编辑
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("system/web/simple/detail_hotel");
		try {
			PageData param = super.getPageData();
			Long id = Long.valueOf(param.get("id").toString());
			PageData detail = simpleHotelService.hotelDetail(id);

			List<WebSimpleHotelStar> allStar = hotelStarService.allList();
			mav.addObject("allStar", allStar);
			mav.addObject("obj", detail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();

			String picUrls = param.getString("url0") + "," + param.getString("url1") + "," + param.getString("url2");
			param.put("picUrls", picUrls);

			if (HString.isEmpty(param.get("id")))
				simpleHotelService.addHotel(param);
			else
				simpleHotelService.modHotel(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 跳转到新增页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toAdd")
	public ModelAndView toAdd() {
		ModelAndView mav = new ModelAndView("system/web/simple/add_hotel");
		try {
			List<WebSimpleHotelStar> allStar = hotelStarService.allList();
			mav.addObject("allStar", allStar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 删除信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			boolean isOk = simpleHotelService.delHotel(param.getLong("id"));
			if (isOk){
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.USED);
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
