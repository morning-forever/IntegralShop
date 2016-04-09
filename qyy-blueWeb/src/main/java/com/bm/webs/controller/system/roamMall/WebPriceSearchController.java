package com.bm.webs.controller.system.roamMall;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 
 * 价格筛选
 * 
 * 
 * @author jiangl <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "roamMall/price")
public class WebPriceSearchController  extends BaseController {

	@Resource(name = "webPriceSearchService")
	private WebPriceSearchService webPriceSearchService;
	
	/**
	 * 汽车价格筛选首页
	 * @return
	 */
	@RequestMapping("car")
	public ModelAndView car(){
		ModelAndView mav = new ModelAndView("system/car/price_main");
		return mav;
	}
	
	/**
	 * 获取价格筛选
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json  = JSONObject.parseObject(str);
				param.put("priceId", json.get("priceId"));
				param.put("searchType", json.get("searchType"));
			}
			res = webPriceSearchService.getListPage(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存价格筛选
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String priceId = param.getString("priceId");
			param.put("id", param.getString("priceId"));
			String depict = "";
			//把输入的价格区段，转化为汉字
			if(HString.isEmpty(param.get("priceStart")) || 0 == Integer.valueOf(param.get("priceStart").toString()) ){
				depict = param.get("priceEnd") + "以下";
			}else if(HString.isEmpty(param.get("priceEnd"))){
				depict = param.get("priceStart") + "以上";
				param.put("priceEnd", null);
			}else{
				depict = param.get("priceStart") + "-" +param.get("priceEnd");
			}
			param.put("depict", depict);
			//检验此价格区间是否存在
			Integer count = webPriceSearchService.getResultNum(param);
			if(count == 0){
				//新增
				if(HString.isEmpty(priceId)){
					webPriceSearchService.insert(param);
				}
				//更新
				else{
					webPriceSearchService.update(param);
				}
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * 删除价格筛选
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webPriceSearchService.delete(param.getString("ids"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 编辑价格筛选
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
			WebPriceSearch data = webPriceSearchService.getById(new Long(id));
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
