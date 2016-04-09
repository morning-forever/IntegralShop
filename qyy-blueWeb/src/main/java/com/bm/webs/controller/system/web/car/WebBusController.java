package com.bm.webs.controller.system.web.car;

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
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebCarSysService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.cart.WebBusService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarBrandService;

@Controller(value = "adminCartBusController")
@RequestMapping(value = "admin/cart/bus")
public class WebBusController extends BaseController {

	@Autowired
	private WebCarAddrsService carAddrsService;
	@Autowired
	private WebCitysService webCitysService;
	@Autowired
	private WebBusService webBusService;
	@Autowired
	private WebCarBrandService webCarBrandService;
	@Autowired
	private WebCarSysService webCarSysService;
	

	/**
	 * 进入班车管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/car/bus_main");
		try {
			List<PageData> cityList = carAddrsService.findListByType("bus");

			List<PageData> brandList = webCarBrandService.findCarBrandList("bus");
			
			List<PageData> cardList = webBusService.getCarCardList(new PageData());
			
			List<PageData> seatings = webBusService.getBusSeatingList();
			
			List<PageData> sysList = webCarSysService.getSysList("bus");
			
			mav.addObject("cityList", cityList);
			mav.addObject("brandList", brandList);
			mav.addObject("cardList", cardList);
			mav.addObject("seatings", seatings);
			mav.addObject("sysList", sysList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 班车路线list列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/routelist")
	@ResponseBody
	public PageData routelist() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("brandId", HString.isEmpty(json.get("brandId")) ? "" : json.get("brandId"));
				param.put("carCard", HString.isEmpty(json.get("carCard")) ? "" : json.get("carCard"));
				param.put("seating", HString.isEmpty(json.getString("seating")) ? "" : json.getString("seating"));
				param.put("price", HString.isEmpty(json.getString("price")) ? "" : json.getString("price"));
				param.put("fromCityId", HString.isEmpty(json.getString("fromCityId")) ? "" : json.getString("fromCityId"));
				param.put("toCityId", HString.isEmpty(json.getString("toCityId")) ? "" : json.getString("toCityId"));
				param.put("fromCountyId", HString.isEmpty(json.getString("fromCountyId")) ? "" : json.getString("fromCountyId"));
				param.put("toCountyId", HString.isEmpty(json.getString("toCountyId")) ? "" : json.getString("toCountyId"));
				param.put("fromAddrId", HString.isEmpty(json.getString("fromAddrId")) ? "" : json.getString("fromAddrId"));
				param.put("toAddrId", HString.isEmpty(json.getString("toAddrId")) ? "" : json.getString("toAddrId"));
			}
			res = webBusService.getAdminRouteList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 车辆信息list列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/buslist")
	@ResponseBody
	public PageData buslist() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("brandId", HString.isEmpty(json.get("brandId")) ? "" : json.get("brandId"));
				param.put("carCard", HString.isEmpty(json.get("carCard")) ? "" : json.get("carCard"));
				param.put("seating", HString.isEmpty(json.getString("seating")) ? "" : json.getString("seating"));
				param.put("sysId", HString.isEmpty(json.getString("sysId")) ? "" : json.getString("sysId"));
			}
			res = webBusService.getAdminBusList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 添加或保存车辆信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			String[] card = super.getRequest().getParameterValues("carCard");
			param.put("cards", card);
			res = webBusService.saveBus(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 添加或保存路线信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveRoute")
	@ResponseBody
	public PageData saveRoute() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			res = webBusService.saveRoute(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取空闲车牌
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getFreeCard")
	@ResponseBody
	public PageData getFreeCard() {
		PageData pd = new PageData(); 
		try {
			List<PageData> list = webBusService.getFreeCardList();
			pd.put("cardlist", list);
			pd.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 
	 * 删除指定班车
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deletesbus", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteCarRent(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webBusService.deletesbus(ids, "bus");
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 删除指定路线班车
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteRoute", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteRoute(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webBusService.deletesRoute(ids);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 上架和下架
	 * @return
	 */
	@RequestMapping(value="onOffLine")
	@ResponseBody
	public PageData onOffLine(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webBusService.updateRouteShelves(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "/detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			PageData data = webBusService.findAdminById(param.getLong("id"));
			if (!HString.isEmpty(data)) {
				res.put("detail", data);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value = "/detailRoute")
	@ResponseBody
	public PageData detailRoute() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			PageData data = webBusService.findAdminRouteById(param);
			if (!HString.isEmpty(data)) {
				res.put("data", data);
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
