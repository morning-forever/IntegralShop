package com.bm.webs.controller.system.roamMall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchBrandService;

/**
 * 漫游商城-酒店品牌管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/brand")
public class MerchBrandController  extends BaseController{
	
	@Autowired
	private MerchBrandService merchBrandService;//品牌
	
	/**
	 * 获取酒店品牌品牌列表
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
				param.put("brandId", json.get("brandId"));
			}
			res = merchBrandService.getAdminBrandList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存酒店品牌
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			if(!HString.isEmpty(param.getString("brandName"))){
				Integer count = merchBrandService.getResultNum(param);
				if(count == 0){
					String brandId = param.getString("brandId");
					param.put("id", param.getString("brandId"));
					//新增
					if(HString.isEmpty(brandId)){
						merchBrandService.insert(param);
					}
					//更新
					else{
						merchBrandService.update(param);
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
	 * 删除酒店品牌
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			merchBrandService.delete(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 编辑酒店品牌
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
			PageData data = merchBrandService.getById(new Long(id));
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
