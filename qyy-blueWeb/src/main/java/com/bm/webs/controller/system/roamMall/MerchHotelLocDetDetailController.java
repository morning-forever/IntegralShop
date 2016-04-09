package com.bm.webs.controller.system.roamMall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.roamMall.MerchHotelLocService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 漫游商城-酒店具体位置管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/hotelLocDet")
public class MerchHotelLocDetDetailController extends BaseController {

	@Autowired
	private MerchHotelLocService merchHotelLocService;//酒店位置

	@Autowired
	private WebCitysService webCitysService;//城市
	
	/**
	 * 获取酒店具体位置列表
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = this.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json = JSONObject.parseObject(str);
				param.put("provinceId",
						HString.isEmpty(json.get("provinceId")) ? "" : json
								.get("provinceId"));
				param.put("cityId", HString.isEmpty(json.get("cityId")) ? ""
						: json.get("cityId"));
				param.put("locId", HString.isEmpty(json.get("locId")) ? ""
						: json.get("locId"));
				param.put("locDetId", HString.isEmpty(json.get("locDetId")) ? ""
						: json.get("locDetId"));
			}
			res = merchHotelLocService.getAdminLocDetailList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存酒店具体位置
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Integer count = merchHotelLocService.getAdminLocDetailNum(param);
			if (count == 0) {
				String locDetId = param.getString("locDetId");
				// 新增
				if (HString.isEmpty(locDetId)) {
					merchHotelLocService.insertLocDetail(param);
				}
				// 更新
				else {
					merchHotelLocService.updateLocDetail(param);
				}
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 编辑酒店具体位置
	 * 
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public PageData edit() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String id = param.getString("id");
			if (HString.isEmpty(id)) {
				res.putStatus(XConst.ERROR);
				return res;
			}
			PageData data = merchHotelLocService.getLocDetailById(new Long(id));
			res.put("data", data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除酒店具体位置
	 * 
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = super.getSysPageData();
		try {
			PageData param = getPageData();
			merchHotelLocService.deleteLoc(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取酒店具体位置
	 * @return
	 */
	@RequestMapping("/getLocDet")
	@ResponseBody
	public PageData getLocDet() {
		PageData res = new PageData();
		try {
			// 获取市
			PageData param = super.getPageData();
			if (!HString.isEmpty(param.get("locId"))) {
				List<PageData> locList = merchHotelLocService.getListByLocId(param.getLong("locId"));
				if (!HString.isEmpty(locList)) {
					res.put("list", locList);
					res.putStatus(XConst.SUCCESS);
				}
			}
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
