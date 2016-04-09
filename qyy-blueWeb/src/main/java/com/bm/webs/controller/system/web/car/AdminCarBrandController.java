package com.bm.webs.controller.system.web.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebCarSysService;
import com.bm.webs.service.web.cart.WebCarBrandService;

/**
 * 
 * 车辆品牌管理Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping("admin/brand")
public class AdminCarBrandController extends BaseController {

	@Autowired
	private WebCarBrandService webCarBrandService;

	@Autowired
	private WebCarSysService webCarSysService;

	/**
	 * 
	 * 跳转到List页面
	 * 
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("system/brand/list");
		return mav;
	}

	/**
	 * 
	 * 查询数据
	 * 
	 * @param brandName
	 * @return
	 */
	@RequestMapping(value = "data", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData data(String brandType) {
		PageData map = getSysPageData();
		try {
			String brandName = "";
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				brandName = json.getString("brandName");
			}
			List<PageData> sysList = webCarSysService.findCarSysByBrandType(brandType, brandName,map);
			map.put("data", sysList);
			//map.put("recordsTotal", sysList.size());
			//map.put("recordsFiltered", sysList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 保存品牌
	 * 
	 * @param brandName
	 * @param brandType
	 * @return
	 */
	@RequestMapping(value = "addBrand", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addBrand(String brandName, String brandType) {
		PageData map = new PageData();
		try {
			Long checkId=webCarBrandService.checkBrandNameOnly(brandName, brandType);
			if(checkId!=null){
				map.putStatus(XConst.EXISTS);
			}else{
				webCarBrandService.insertBrand(brandName, brandType);
				map.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查询指定类型的品牌List
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "getBrandList", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getBrandList(String type) {
		PageData map = new PageData();
		try {
			List<PageData> list = webCarBrandService.findCarBrandList(type);
			map.put("list", list);
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 保存车系
	 * 
	 * @param addBrandId
	 * @param addSysName
	 * @return
	 */
	@RequestMapping(value = "addSys", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addSys(Long id, String addBrandId, String addSysName) {
		PageData map = new PageData();
		try {
			if (id == null) {
				webCarSysService.insertSys(addBrandId, addSysName);
			} else {
				webCarSysService.updateSys(id, addBrandId, addSysName);
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
	 * 删除车系
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deletes", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes(String ids) {
		PageData map = new PageData();
		try {
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids=ids.substring(0, lastIndex);
			}
			webCarSysService.deletesCarSys(ids);
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}
}
