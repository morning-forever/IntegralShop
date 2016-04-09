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
import com.bm.webs.service.web.cart.WebCarTypeService;

/**
 * 
 * 后台车辆类型Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping("admin/type")
public class WebCarTypeController extends BaseController{
	
	
	@Autowired
	private WebCarTypeService webCarTypeService;

	/**
	 * 
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value="list")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("system/type/list");
		return mav;
	}

	
	
	/**
	 * 
	 * 查询列表数据
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value="data",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData data(String type){
		PageData map=getSysPageData();
		try {
			String typeName = "";
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				typeName = json.getString("typeName");
			}
			List<PageData> list=webCarTypeService.findAdminTypeList(type,typeName,map);
			map.put("data", list);
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 保存类型
	 * 
	 * @param addTypeName
	 * @param typeType
	 * @param id
	 * @return
	 */
	@RequestMapping(value="submitType",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitType(String addTypeName,String typeType,Long id){
		PageData map=new PageData();
		try {
			if(id==null){
				webCarTypeService.insertType(addTypeName,typeType);
			}else{
				webCarTypeService.updateType(addTypeName,typeType,id);
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
	 * 删除类型
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deletes",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes(String ids){
		PageData map=new PageData();
		try {
			int lastIndex=ids.lastIndexOf(",");
			if(lastIndex!=-1){
				ids=ids.substring(0,lastIndex);
			}
			webCarTypeService.deleteType(ids);
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
