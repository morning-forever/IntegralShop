package com.bm.webs.controller.system.roamMall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.MerchRestaurant;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchRestaurantService;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 漫游商城-餐饮管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/cater")
public class CaterController  extends BaseController{
	
	@Autowired
	private MerchRestaurantService merchRestaurantService;//餐饮
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	/**
	 * 进入首页
	 * @param page
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = super.getModelAndView();
		try {
			List<MerchRestaurant> caterList = merchRestaurantService.allList();//餐饮分类
			List<WebPriceSearch> priceList = webPriceSearchService.getList("cater");
			mav.addObject("caterList", caterList);
			mav.addObject("priceList", priceList);
			mav.setViewName("system/roamMall/cater_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 获取餐饮列表
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json  = JSONObject.parseObject(str);
				param.put("caterId", json.get("caterId"));
			}
			res = merchRestaurantService.getAdminList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存餐饮
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			if(!HString.isEmpty(param.getString("caterName"))){
				Integer count = merchRestaurantService.getResultNum(param);
				if(count == 0){
					String caterId = param.getString("caterId");
					param.put("id", param.getString("caterId"));
					//新增
					if(HString.isEmpty(caterId)){
						merchRestaurantService.insert(param);
					}
					//更新
					else{
						merchRestaurantService.update(param);
					}
					res.putStatus(XConst.SUCCESS);
				}else{
					res.putStatus(XConst.EXISTS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * 删除餐饮
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			merchRestaurantService.delete(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 编辑餐饮
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public PageData edit() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String id = param.getString("id");
			if(HString.isEmpty(id)){
				res.putStatus(XConst.ERROR);
				return res;
			}
			PageData data = merchRestaurantService.getById(new Long(id));
			res.put("data", data);
			res.putStatus(XConst.SUCCESS);
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
