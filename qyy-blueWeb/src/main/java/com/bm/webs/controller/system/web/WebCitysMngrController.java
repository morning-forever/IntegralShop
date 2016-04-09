package com.bm.webs.controller.system.web;

import java.util.ArrayList;
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
import com.bm.webs.service.web.WebCitysService;

@Controller
@RequestMapping("admin/webcitymngr")
public class WebCitysMngrController extends BaseController {

	@Autowired
	private WebCitysService webCitysService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/web/citys_main");
		try {
			// 获取省
			List<PageData> provinceList = webCitysService.findProvinceList();
			mav.addObject("provinceList", provinceList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		PageData pd;
		try {
			pd = this.getSysPageData();
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("provinceId", HString.isEmpty(json.get("provinceId")) ? "" : json.get("provinceId"));
				pd.put("cityId", HString.isEmpty(json.get("cityId")) ? "" : json.get("cityId"));
				pd.put("countyId", HString.isEmpty(json.get("countyId")) ? "" : json.get("countyId"));
			}
			res = webCitysService.findAllList(pd);
			res.put("draw", pd.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取所有的省
	 * 
	 * @return
	 */
	@RequestMapping(value = "provinceList")
	@ResponseBody
	public PageData provinceList() {
		PageData res = new PageData();
		try {
			// 获取省
			List<PageData> provinceList = webCitysService.findProvinceList();
			if (!HString.isEmpty(provinceList)) {
				res.put("list", provinceList);
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取城市列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "cityList")
	@ResponseBody
	public PageData cityList() {
		PageData res = new PageData();
		try {
			// 获取市
			PageData data = super.getPageData();
			if (!HString.isEmpty(data.get("provinceId"))) {
				Long provinceId = Long.valueOf(data.getString("provinceId"));
				List<PageData> cityList = webCitysService.findCitysList(provinceId, null);
				if (!HString.isEmpty(cityList)) {
					res.put("list", cityList);
					res.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 获取区县列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "countyList")
	@ResponseBody
	public PageData countyList() {
		PageData res = new PageData();
		try {
			// 获取区县
			PageData data = super.getPageData();
			// if (!HString.isEmpty(data.get("provinceId"))) {
			// Long provinceId = (Long) data.get("provinceId");
			// }
			res = webCitysService.findAllList(data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveCitys")
	@ResponseBody
	public PageData saveCitys() {
		PageData data = super.getPageData();
		try {
			boolean isHave = webCitysService.checkIsHave(data);
			if (isHave) {
				boolean isSave = webCitysService.insertCitys(data);
				data.putStatus(XConst.STATUS_KEY);
				if (isSave) {
					data.clear();
					data.putStatus(XConst.SUCCESS);
				}
			} else {
				data.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 查询完整的省市区信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public PageData detail() {
		PageData data = super.getPageData();
		try {
			PageData res = webCitysService.findAllObject(Long.valueOf(data.getString("id")));
			data.putStatus(XConst.SUCCESS);
			data.put("obj", res);
		} catch (NumberFormatException e) {
			data.putStatus(XConst.PARAM_ERR);
			e.printStackTrace();
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	/**
	 * 编辑保存
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveEdit")
	@ResponseBody
	public PageData saveEdit() {
		PageData data = super.getPageData();
		try {

			String province = data.getString("eprovinceName");
			String provinceId = data.getString("eprovinceId");

			String city = data.getString("ecityName");
			String cityId = data.getString("ecityId");

			String county = data.getString("ecountyName");
			String countyId = data.getString("ecountyId");

			boolean isCheckProvince = webCitysService.checkEditIsHave(province, "province", Long.valueOf(provinceId), null);
			if (!isCheckProvince) {
				data.clear();
				data.putStatus(XConst.EXISTS);
				data.put("msg", province + "已经存在了，请修改为其他的名称！");
				data.put("check", "province");
				return data;
			}

			boolean isCheckCity = webCitysService.checkEditIsHave(city, "city", Long.valueOf(cityId), Long.valueOf(provinceId));
			if (!isCheckCity) {
				data.clear();
				data.putStatus(XConst.EXISTS);
				data.put("msg", city + "已经存在了，请修改为其他的名称！");
				data.put("check", "city");
				return data;
			}

			boolean isCheckCounty = webCitysService.checkEditIsHave(county, "county", Long.valueOf(countyId), Long.valueOf(cityId));
			if (!isCheckCounty) {
				data.clear();
				data.putStatus(XConst.EXISTS);
				data.put("msg", county + "已经存在了，请修改为其他的名称！");
				data.put("check", "county");
				return data;
			}

			List<PageData> params = new ArrayList<PageData>();
			PageData param = new PageData();
			param.put("name", province);
			param.put("id", provinceId);
			params.add(param);
			param = new PageData();
			param.put("name", city);
			param.put("id", cityId);
			params.add(param);
			param = new PageData();
			param.put("name", county);
			param.put("id", countyId);
			params.add(param);

			boolean isSave = webCitysService.updateBatch(params);
			if (isSave) {
				data.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			data.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "initAddrList")
	@ResponseBody
	public PageData initAddrList(Long addrId) {
		PageData res = new PageData(true);
		try {
			PageData allId = webCitysService.findAllId(addrId);
			if (!HString.isEmpty(allId)) {
				Long cityId = Long.valueOf(allId.get("cityId").toString());
				Long provinceId = Long.valueOf(allId.get("provinceId").toString());

				List<PageData> countyList = webCitysService.getListByParentId(cityId, addrId);
				List<PageData> cityList = webCitysService.getListByParentId(provinceId, cityId);
				List<PageData> provinceList = webCitysService.getListByParentId(0l, provinceId);

				res.put("countyList", countyList);
				res.put("cityList", cityList);
				res.put("provinceList", provinceList);

				res.put(XConst.STATUS_KEY, XConst.SUCCESS);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	/**
	 * 删除城市中区域
	 * 
	 * @return
	 */
	@RequestMapping(value = "delCitys")
	@ResponseBody
	public PageData delCitys() {
		PageData res = new PageData(true);
		try {
			PageData param = super.getPageData();
			int re = webCitysService.delCitys(param);
			if (re == 0) {
				res.putStatus(XConst.SUCCESS);
			} else if (re == 1) {
				res.putStatus(XConst.EXISTS);
			} else {
				res.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value="editProvince",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData editProvince(){
		PageData res = getApiPageData();
		try {
			webCitysService.updateProvince(res);
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
