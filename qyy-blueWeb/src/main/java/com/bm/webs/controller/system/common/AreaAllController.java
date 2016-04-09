package com.bm.webs.controller.system.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.AreaAll;
import com.bm.webs.bean.PageData;
import com.bm.webs.service.common.AreaAllService;

/**
 * 
 * 所有地区Controller
 * 
 * 用于发票地址和注册用户地址选择
 * 
 * @author Hham
 *
 */
@Controller("AreaAllController")
@RequestMapping("pc/areaAll")
public class AreaAllController {
	
	@Autowired
	private AreaAllService areaAllService;
	
	@RequestMapping(value="getChildren",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getChildren(Long id){
		PageData map=new PageData();
		try {
			List<AreaAll> list=areaAllService.findAreaByParentId(id);
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
