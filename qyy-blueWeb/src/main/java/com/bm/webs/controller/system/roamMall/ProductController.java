package com.bm.webs.controller.system.roamMall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.util.HString;
import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.MerchGoodsHotel;
import com.bm.webs.bean.MerchGoodsScenic;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.ProductService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 漫游商城-商品管理
 * 
 * @author jiangl <br>
 *         2015年9月3日
 */
@Controller
@RequestMapping(value = "admin/roamMall/product")
public class ProductController  extends BaseController{
	
	@Autowired
	private MerchGoodsService merchGoodsService;//商品
	
	@Autowired
	private MerchUserService merchUserService;//用户
	
	@Autowired
	private ProductService productService;//商品
	
	@Autowired
	private WebCitysService webCitysService;//城市
	
	@Autowired
	private CommonUploadService commonUploadService;//文件上传
	
	/**
	 * 进入主页
	 * @param tab
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main(String tab) {
		ModelAndView mav = super.getModelAndView();
		try {
			mav.addObject("tab", tab);
			mav.setViewName("system/roamMall/product_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 列表页
	 * @param goodsType
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list(String goodsType) {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json  = JSONObject.parseObject(str);
				param.put("username", json.get("username"));
				param.put("productNo", json.get("productNo"));
				param.put("title", json.get("title"));
				param.put("isShelves", json.get("isShelves"));
			}
			//景区
			if("scenic".equals(goodsType)){
				res = productService.getAdminScenicList(param);
			}
			//酒店
			else if("hotel".equals(goodsType)){
				res = productService.getAdminHotelList(param);
			}
			//餐饮
			else if("cater".equals(goodsType)){
				res = productService.getAdminCaterList(param);
			}
			//装备
			else if("equip".equals(goodsType)){
				res = productService.getAdminEquipList(param);
			}
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 查询详情
	 * @param id (goods_id)
	 * @param goodsType
	 * @return
	 */
	@RequestMapping("/detail")
	public ModelAndView detail(Long id, String goodsType) {
		ModelAndView mav = new ModelAndView();
		try {
			List<String> photoUrlList = null;
			MerchGoods goods = merchGoodsService.findGoodsById(id, null);
			PageData param = new PageData();
			param.put("id", goods.getMerchUserId());
			PageData merchUser = merchUserService.findById(param);
			String loc = webCitysService.getSpecificAddress(merchUser.getLong("at_addr"));
			//景区
			if("scenic".equals(goodsType)){
				MerchGoodsScenic goodsScenic = merchGoodsService.findGoodsScenicById(goods.getId());
				mav.addObject("goodsScenic",goodsScenic);
				mav.setViewName("system/roamMall/product_scenic_detail");
			}
			//酒店
			else if("hotel".equals(goodsType)){
				MerchGoodsHotel goodsHotel = merchGoodsService.findGoodsHotelById(goods.getId());
				mav.addObject("goodsHotel",goodsHotel);
				mav.setViewName("system/roamMall/product_hotel_detail");
			}
			//餐饮
			else if("cater".equals(goodsType)){
				PageData goodsCater = merchGoodsService.findMerchGoodsCaterById(goods.getId());
				mav.addObject("goodsCater",goodsCater);
				mav.setViewName("system/roamMall/product_cater_detail");
			}
			//装备
			else if("equip".equals(goodsType)){
				List<PageData> goodsEquipList = productService.getEquipById(goods.getId());
				mav.addObject("goodsEquipList",goodsEquipList);
				mav.setViewName("system/roamMall/product_equip_detail");
			}
			photoUrlList = commonUploadService.findGoodsPhoto(goods.getId(), goodsType + "Goods");
			mav.addObject("loc",loc);
			mav.addObject("merchUser",merchUser);
			mav.addObject("goods", goods);
			mav.addObject("photoUrlList", photoUrlList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
