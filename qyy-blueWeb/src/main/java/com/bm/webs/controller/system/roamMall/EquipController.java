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
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.roamMall.MerchEquipService;
import com.bm.webs.service.roamMall.WebPriceSearchService;

/**
 * 漫游商城-装备管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/equip")
public class EquipController  extends BaseController{
	
	@Autowired
	private MerchEquipService merchEquipService;//装备
	
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
			List<PageData> equipList = merchEquipService.allList();
			List<WebPriceSearch> priceList = webPriceSearchService.getList("equip");
			mav.addObject("equipList", equipList);//装备分类
			mav.addObject("priceList", priceList);//价格筛选
			mav.setViewName("system/roamMall/equip_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 获取装备列表 分页
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
				param.put("equipId", json.get("equipId"));
			}
			res = merchEquipService.getAdminEquipList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存装备
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			if(!HString.isEmpty(param.getString("equipName"))){
				Integer count = merchEquipService.getResultNum(param);
				if(count == 0){
					String equipId = param.getString("equipId");
					param.put("id", param.getString("equipId"));
					//新增
					if(HString.isEmpty(equipId)){
						merchEquipService.insert(param);
					}
					//更新
					else{
						merchEquipService.update(param);
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
	 * 删除装备
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			merchEquipService.delete(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 编辑装备
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
			PageData data = merchEquipService.getById(new Long(id));
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
