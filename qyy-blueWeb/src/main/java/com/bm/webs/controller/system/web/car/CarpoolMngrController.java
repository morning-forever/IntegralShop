package com.bm.webs.controller.system.web.car;

import java.util.List;
import java.util.Set;

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
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.cart.WebCarCarpoolService;

/**
 * 拼车路线
 * 
 * @author mike <br>
 *         2015年9月23日
 */
@SuppressWarnings("unchecked")
@Controller(value = "carpoolMngrController")
@RequestMapping(value = "admin/cart/carpool")
public class CarpoolMngrController extends BaseController {

	@Autowired
	private WebCitysService webCitysService;
	@Autowired
	private WebCarCarpoolService carpoolService;

	/**
	 * 去主列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/car/carpool_main");
		try {
			List<PageData> cityList = webCitysService.findListByType("city");

			List<PageData> brandList = carpoolService.findBrandOfCarpool();
			
			mav.addObject("cityList", cityList);
			mav.addObject("brandList", brandList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 数据list
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("toAddrId", HString.isEmpty(json.get("toAddrId")) ? "" : json.get("toAddrId"));
				param.put("fromAddrId", HString.isEmpty(json.get("fromAddrId")) ? "" : json.get("fromAddrId"));
				param.put("mileage", HString.isEmpty(json.getString("mileage")) ? "" : json.getString("mileage"));
			}
			res = carpoolService.findAdminCarpoolList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 返回地点下拉列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "findAddrList")
	@ResponseBody
	public PageData findAddrList() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			List<PageData> list = carpoolService.findAddrByCountyId(param.getString("type"), param.getLong("countyId"));
			if (!HString.isEmpty(list)) {
				res.put("addrList", list);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			List<PageData> list = carpoolService.findAddrByCountyId(param.getString("type"), param.getLong("countyId"));
			if (!HString.isEmpty(list)) {
				res.put("addrList", list);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 添加或更新
	 * 
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			PageData newParam = new PageData();
			Set<String> set = param.keySet();
			for (String key : set) {
				if (key.indexOf("e") == 0)
					newParam.put(key.substring(1), param.get(key));
				else
					newParam.put(key, param.get(key));
			}
			res = carpoolService.saveCarAddrCt(newParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 匹配所有id数据等
	 * 
	 * @return
	 */
	@RequestMapping(value = "findAllIds")
	@ResponseBody
	public PageData findAllIds() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			PageData detailIds = carpoolService.findDetailAllIdByAddrCtId(param.getLong("id"));
			if (!HString.isEmpty(detailIds)) {
				res.put("ids", detailIds);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 上下架
	 * 
	 * @return
	 */
	@RequestMapping(value = "udLine")
	@ResponseBody
	public PageData udLine() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			res = carpoolService.updateOnOffLine(param.getLong("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除路线
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			res = carpoolService.deleteCarAddrCt(param.getLong("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**以下是价格信息**********************************************************************************************************************************/
	
	/**
	 * 返回车系
	 * @return
	 */
	@RequestMapping(value = "carsysList")
	@ResponseBody
	public PageData carsysList() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			List<PageData> sysList = carpoolService.findSysOfCarpoolByBrandId(param.getLong("brandId"));
			res.put("sysList", sysList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 价格列表
	 * @return
	 */
	@RequestMapping(value = "priceList")
	@ResponseBody
	public PageData priceList() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("carSysId", HString.isEmpty(json.get("carSysId")) ? "" : json.get("carSysId"));
				param.put("seatSt", HString.isEmpty(json.get("seatSt")) ? "" : json.get("seatSt"));
				param.put("seatEd", HString.isEmpty(json.getString("seatEd")) ? "" : json.getString("seatEd"));
				param.put("price", HString.isEmpty(json.getString("price")) ? "" : json.getString("price"));
			}
			res = carpoolService.findPriceList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value = "saveAddrPrice")
	@ResponseBody
	public PageData saveAddrPrice(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			PageData newParam = new PageData();
			Set<String> set = param.keySet();
			for (String key : set) {
				if (key.indexOf("e") == 0)
					newParam.put(key.substring(1), param.get(key));
				else
					newParam.put(key, param.get(key));
			}
			res =  carpoolService.saveAddrPrice(newParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 查询详情
	 * @return
	 */
	@RequestMapping(value = "addrPriceDetail")
	@ResponseBody
	public PageData addrPriceDetail(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			PageData detail =carpoolService.findAddrPriceDetail(param.getLong("id"));
			if(!HString.isEmpty(detail)){
				res.put("detail", detail);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除数据
	 * @return
	 */
	@RequestMapping(value = "deleteAddrPrice")
	@ResponseBody
	public PageData deleteAddrPrice(){
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			boolean isOk =carpoolService.deleteAddrPrice(param.getLong("id"));
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
