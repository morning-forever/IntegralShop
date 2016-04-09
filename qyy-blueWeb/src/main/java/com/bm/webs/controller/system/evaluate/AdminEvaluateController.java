package com.bm.webs.controller.system.evaluate;

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
import com.bm.webs.service.web.WebEvaluataService;

/**
 * 后台评价
 * 
 * @author jiangl <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "admin/evaluate")
public class AdminEvaluateController extends BaseController {

	@Autowired
	private WebEvaluataService webEvaluataService;//评价
	
	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/evaluate/admin_evaluate_main");
		return mav;
	}

	/**
	 * 查询评价列表
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
				param.put("depthName", json.get("depthName"));
				param.put("scoreFrom", json.get("scoreFrom"));
				param.put("scoreTo", json.get("scoreTo"));
				param.put("timeFrom", json.get("timeFrom"));
				param.put("timeTo", json.get("timeTo"));
			}
			res = webEvaluataService.findAdminEvaluateList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 跳转至深度游评价列表页
	 * @return
	 */
	@RequestMapping(value = "toDepthEvaluate")
	public ModelAndView toDepthEvaluate() {
		ModelAndView mav = new ModelAndView("system/evaluate/depth_evaluate_list");
		try {
			PageData param = getSysPageData();
			mav.addObject("depthId", param.get("depthId"));//深度游id
			mav.addObject("depthName", param.get("depthName"));//路线名称
			mav.addObject("avgScore", param.get("avgScore"));//总评分
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询具体深度游的所有评价列表
	 * @return
	 */
	@RequestMapping(value = "listByDepth")
	@ResponseBody
	public PageData listByDepth() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			param.put("depthId", param.get("depthId"));
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("nickName", json.get("nickName"));
				param.put("comment", json.get("comment"));
				param.put("timeFrom", json.get("timeFrom"));
				param.put("timeTo", json.get("timeTo"));
			}
			res = webEvaluataService.findAdminDepthEvaluateList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除某条评价
	 * @return
	 */
	@RequestMapping(value = "deleteEvaluate")
	@ResponseBody
	public PageData deleteEvaluate() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			webEvaluataService.deleteEvaluate(param.getLong("id"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除某个深度游的所有评价
	 * @return
	 */
	@RequestMapping(value = "deleteByDepth")
	@ResponseBody
	public PageData deleteByDepth() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			webEvaluataService.deleteByDepth(param.getLong("depthId"));
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
