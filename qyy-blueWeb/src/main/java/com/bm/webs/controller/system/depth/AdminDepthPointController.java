package com.bm.webs.controller.system.depth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebDepthPointService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 后台主题深度游-亮点管理
 * 
 * @author jiangl <br>
 *         2015年11月4日
 */
@Controller
@RequestMapping(value = "admin/depth/point")
public class AdminDepthPointController extends BaseController {

	
	@Autowired
	private WebCitysService webCitysService;// 城市

	@Autowired
	private WebDepthPointService webDepthPointService;// 亮点

	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView depthIndex() {
		ModelAndView mav = new ModelAndView("system/depth/admin_depth_point_list");
		try {
			List<PageData> cityList = webCitysService.findCitysList(null, null);// 城市
			mav.addObject("cityList", cityList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询亮点列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("pointName", json.get("pointName"));
				param.put("scenicName", json.get("scenicName"));
				param.put("cityId", json.get("cityId"));
			}
			res = webDepthPointService.getAdminPointList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 查询明细
	 * 
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	public ModelAndView detail(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView("system/depth/admin_depth_point_info");
		try {
			mav.addObject("point", webDepthPointService.getPointById(id));// 亮点详情
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 保存亮点详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "savePoint")
	@ResponseBody
	public PageData savePoint() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthPointService.savePoint(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存深度游对应的亮点
	 * @return
	 */
	@RequestMapping(value = "savePointCt")
	@ResponseBody
	public PageData savePointCt() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			res = webDepthPointService.savePointCt(param.getLong("depthId"), param.getString("pointIds"));
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除深度游对应的亮点
	 * @return
	 */
	@RequestMapping(value = "deletePointCt")
	@ResponseBody
	public PageData deletePointCt() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthPointService.deletePointCt(param.getLong("pointCtId"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除亮点
	 * @return
	 */
	@RequestMapping(value = "deletePoint")
	@ResponseBody
	public PageData deletePoint() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthPointService.deletePoint(param.getLong("pointId"));
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
