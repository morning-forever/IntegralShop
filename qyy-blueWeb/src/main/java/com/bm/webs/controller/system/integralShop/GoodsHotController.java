package com.bm.webs.controller.system.integralShop;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.HotLevel;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.GoodsHotService;
@Controller
@RequestMapping("admin/integralShop/goods_hot_manage/")
public class GoodsHotController extends BaseController{
	
	@Resource
	private GoodsHotService goodsHotService;
	
	@RequestMapping("main")
	public ModelAndView main(){
		ModelAndView mav=new ModelAndView("system/integralShop/goods_hot_manage_main");
		return mav;
	}
	
	@RequestMapping("list")
	@ResponseBody
	public PageData list() throws Exception{
		
		PageData pageData ;
		PageData param = getSysPageData();
		pageData=goodsHotService.getAdminGoodsHotList(param);
		
		return pageData;
		
	}
	
	@RequestMapping("saveUI")
	public ModelAndView saveUI(){
		ModelAndView mav = new ModelAndView("system/integralShop/goods_hot_manage_saveUI");
		
		return mav;
		
	}
	
	@RequestMapping("save")
	@ResponseBody
	public PageData save(HotLevel hotLevel){
		PageData pageData = new PageData();
		try {
			goodsHotService.save(hotLevel);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			pageData.putStatus(XConst.FAIL);
		}
		return pageData;
	}
	
	@RequestMapping("delete/{id}")
	@ResponseBody
	public PageData delete(@PathVariable Integer id){
		PageData pageData = new PageData();
		try {
			goodsHotService.deleteById(id);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			pageData.putStatus(XConst.FAIL);
		}
		return pageData;
		
	}
	
	@RequestMapping("editUI/{id}")
	public ModelAndView editUI(@PathVariable Integer id) throws Exception{
		
		ModelAndView mav = new ModelAndView("system/integralShop/goods_hot_manage_editUI");
		HotLevel hotLevel = goodsHotService.getHotLevelById(id);
		mav.addObject("hotLevel", hotLevel);
		
		return mav;
	}
	
	@RequestMapping("update")
	@ResponseBody
	public PageData update(HotLevel hotLevel){
		PageData pageData = new PageData();
		try {
			goodsHotService.update(hotLevel);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			pageData.putStatus(XConst.FAIL);
		}
		
		return pageData;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
