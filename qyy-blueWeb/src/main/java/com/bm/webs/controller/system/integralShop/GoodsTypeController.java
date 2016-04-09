package com.bm.webs.controller.system.integralShop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.GoodsType;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.GoodsTypeService;

@Controller(value = "goodsTypeController")
@RequestMapping(value = "admin/integralShop/goods_type_manage/")
public class GoodsTypeController extends BaseController {

	@Autowired
	private GoodsTypeService goodsTypeService;

	@RequestMapping(value = "main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/integralShop/goods_type_manage_main");
		return mav;
	}

	/**
	 * 后台获取所有商品类型列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() throws Exception{
		PageData res = new PageData();
			res = goodsTypeService.getAdminGoodsTypeList();
		
		return res;
	}
	
	@RequestMapping("delete/{id}")
	@ResponseBody
	public PageData delete(@PathVariable Integer id){
		
		PageData pageData = new PageData();
		try {
			goodsTypeService.deleteById(id);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pageData.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		
		return pageData;
	}
	
	@RequestMapping("saveUI")
	public ModelAndView  saveUI(){
		ModelAndView mav = new ModelAndView("system/integralShop/goods_type_manage_saveUI");
		
		return mav;
	}
	
	@RequestMapping("save")
	@ResponseBody
	public PageData save(GoodsType goodsType){
		PageData pageData = new PageData();
			try {
				goodsTypeService.save(goodsType);
				pageData.putStatus(XConst.SUCCESS);
			} catch (Exception e) {
				e.printStackTrace();
				pageData.putStatus(XConst.FAIL);
			}
		return pageData;
	
	}
	
	@RequestMapping("editUI/{id}")
	public ModelAndView editUI(@PathVariable Integer id) throws Exception{
		ModelAndView mav = new ModelAndView("system/integralShop/goods_type_manage_editUI");
		GoodsType goodsType = goodsTypeService.getGoodsTypeById(id);
		mav.addObject("goodsType", goodsType);
		return mav;
		
	}
	
	@RequestMapping("update")
	@ResponseBody
	public PageData updateGoodsType(GoodsType goodsType){
		PageData pageData = new PageData();
		try {
			goodsTypeService.updateGoodsType(goodsType);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pageData.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		return pageData;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
