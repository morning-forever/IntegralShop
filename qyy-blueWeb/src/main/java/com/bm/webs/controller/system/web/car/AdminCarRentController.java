package com.bm.webs.controller.system.web.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebCar;
import com.bm.webs.bean.WebCarRent;
import com.bm.webs.bean.WebCarSys;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebCarSysService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarBrandService;
import com.bm.webs.service.web.cart.WebCarRentService;
import com.bm.webs.service.web.cart.WebCarTypeService;

/**
 * 
 * 租车后台管理Controller
 * 
 * @author Hham
 *
 */
@Controller("adminCarRentController")
@RequestMapping("admin/cart/rent")
public class AdminCarRentController extends BaseController {

	@Autowired
	private WebCarRentService webCarRentService;

	@Autowired
	private WebCarBrandService webCarBrandService;

	@Autowired
	private WebCarSysService webCarSysService;

	@Autowired
	private WebCarTypeService webCarTypeService;

	@Autowired
	private WebCarAddrsService webCarAddrsServce;
	
	@Autowired
	private WebCarDatePriceService webCarDatePriceService;
	
	@Autowired
	private CommonUploadService commonUploadService;
	
	/**
	 * 
	 * 存储到图片表中的类型名
	 * 
	 */
	public static final String PHOTO_FROM_TYPE="carRent";
	
	/**
	 * 
	 * 跳转到租车页面
	 * 
	 * @return
	 */
	@RequestMapping("listPage")
	public ModelAndView listPage() {
		ModelAndView mav = new ModelAndView();
		try {
			List<PageData> list = webCarBrandService.findCarBrandList("rent");
			mav.addObject("brandList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("system/car/rent_list");
		return mav;
	}

	/**
	 * 
	 * 获取租车列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData map = getSysPageData();

		try {
			Long brandId = null;
			Long sysId = null;
			Integer seating = null;
			Double price = null;
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				brandId = objectOfValue(json.get("brandId"), Long.class);
				sysId = objectOfValue(json.get("sysId"), Long.class);
				seating = objectOfValue(json.get("seating"), Integer.class);
				price = objectOfValue(json.get("price"), Double.class);
			}

			List<PageData> list = webCarRentService.findAdminRentList(brandId, sysId, seating, price,map);
			map.put("data", list);

			//map.put("recordsTotal", list.size());
			//map.put("recordsFiltered", list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	/**
	 * 
	 * 查询指定品牌的车系
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getSysList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getSysList(Long id) {
		PageData map = new PageData();
		try {
			List<WebCarSys> list = webCarSysService.findCarSysByBrandId(id);
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 删除指定租车
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deletes", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteCarRent(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webCarRentService.deletesCarRent(ids, "rent");
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 上架租车
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "onLine", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData onLine(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webCarRentService.changeStatus(ids, 0, "rent");
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 下架租车
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "offLine", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData offLine(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webCarRentService.changeStatus(ids, 1, "rent");
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 跳转到添加列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "goAdd")
	public ModelAndView addCar() {
		ModelAndView mav = new ModelAndView();

		try {
			List<PageData> list = webCarBrandService.findCarBrandList("rent");
			List<PageData> Addrlist = webCarAddrsServce.findListByType("rent");
			mav.addObject("brandList", list);// 品牌List
			mav.addObject("Addrlist", Addrlist);// 市地址List
			mav.setViewName("system/car/rent_info");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 保存租车用户
	 * 
	 * @param webCar
	 * @param webCarRent
	 * @param url
	 * @param prices
	 * @param dates
	 * @param store
	 * @param carType
	 * @return
	 */
	@RequestMapping(value = "doSubmit", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData doSubmit(WebCar webCar, WebCarRent webCarRent, String url, String prices, String dates,
			String store,String carType,Long carId,Long rentId) {
		PageData map = new PageData();
		try {
			if (ValidateHelper.isNullOrEmpty(carId)&&
					ValidateHelper.isNullOrEmpty(rentId)) {
				webCarRentService.insertCarRent(webCar, webCarRent, url, prices, dates,store,carType);
			} else {
				webCar.setId(carId);
				webCarRent.setId(rentId);
				webCarRentService.updateCarRent(webCar,webCarRent,url,prices,dates,store,carType);
			}
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 返回租车类型列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "getCarTypeList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getCarTypeList() {
		PageData map = new PageData();
		try {
			List<PageData> list = webCarTypeService.findCarTypeList("rent");
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 获取区List
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getCounty", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getCounty(Long id) {
		PageData map = new PageData();
		try {
			List<PageData> list = webCarAddrsServce.findCountyByCityId(id, "rent");
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 获取门户List
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getStore", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getStore(Long id) {
		PageData map = new PageData();
		try {
			List<PageData> list = webCarAddrsServce.findStoreByCountyId(id, "rent");
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 编辑租车
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editRent{id}",produces=XConst.JSON_PRODUCES)
	public ModelAndView editRent(@PathVariable(value="id") Long id){
		ModelAndView mav=new ModelAndView();
		
		try {
			List<PageData> list = webCarBrandService.findCarBrandList("rent");
			List<PageData> Addrlist = webCarAddrsServce.findListByType("rent");
			mav.addObject("brandList", list);// 品牌List
			mav.addObject("Addrlist", Addrlist);// 市地址List
			
			
			PageData map=webCarRentService.findCarRentById(id);
			mav.addObject("rent", map);
			
			
			List<PageData> priceList=webCarDatePriceService.findListById(id);
			mav.addObject("priceList",JSONObject.toJSON(priceList));
			
			String typeIds=webCarTypeService.findCarTypeIdsById(id);
			mav.addObject("typeIds", typeIds);
			
			List<PageData> storeList=webCarAddrsServce.findStoreByCarId(objectOfValue(map.get("rentId"), Long.class));
			mav.addObject("storeList", JSONObject.toJSON(storeList));
			
			List<PageData> photoList=commonUploadService.findPhotos(id, PHOTO_FROM_TYPE, "detial", 5);
			mav.addObject("photoList",photoList);
			
			mav.setViewName("system/car/rent_info");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

	public static void main(String[] args) {
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
