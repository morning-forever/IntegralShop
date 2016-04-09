package com.bm.webs.controller.app.roamMall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.AppData;
import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.app.roamMall.AppProductService;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.ProductService;

/**
 * 商品模块 APP接口
 * 
 * @author jiangl
 * 
 * 2015年9月29日
 */
@Controller
@RequestMapping(value = "app/roamMall/product")
public class AppProductController extends BaseController {

	@Autowired
	private AppProductService appProductService;//商品
	
	@Autowired
	private MerchUserService merchUserService;//商户
	
	@Autowired
	private CommonUploadService commonUploadService;//图片上传
	
	@Autowired
	private MerchGoodsService merchGoodsService;//商品
	
	@Autowired
	private ProductService productService;//商品
	
	/**
	 * 得到该商家所有的商品（或是进入某个商品页面后，查询该商家的其他商品）
	 * @return
	 */
	@RequestMapping(value = "listByMerch")
	@ResponseBody
	public AppData listByMerch() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long merchUserId = param.getLong("merchUserId");
			if (ValidateHelper.isNullOrEmpty(merchUserId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				PageData merchUser = merchUserService.findMerchUserById(merchUserId);
				String type = merchUser.getString("merch_type");//商户类型：（1：景区商户 2：酒店商户 3：餐饮商户 4：装备商户）
				List<PageData> list = null;
				//景区
				if("1".equals(type)){
					list = appProductService.getScenicByMerch(param);
				}
				//酒店
				else if("2".equals(type)){
					list = appProductService.getHotelByMerch(param);
				}
				//餐饮
				else if("3".equals(type)){
					list = appProductService.getCaterByMerch(param);
				}
				//装备
				else if("4".equals(type)){
					list = appProductService.getEquipByMerch(param);
				}
				res.setData("list", list);
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 商品详情
	 * @return
	 */
	@RequestMapping(value = "detail")
	@ResponseBody
	public AppData detail() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long goodsId = param.getLong("goodsId");
			if (ValidateHelper.isNullOrEmpty(goodsId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				PageData data = new PageData();
				MerchGoods merchGood = merchGoodsService.findGoodsById(goodsId,null);
				PageData merchUser = merchUserService.findMerchUserById(merchGood.getMerchUserId());
				String type = merchGood.getGoodsType();//商品类型：（scenic：景点   hotal:酒店   cater：餐饮  equip：装备）
				//景区
				if("scenic".equals(type)){
					data.put("goodsScenic", merchGoodsService.findGoodsScenicById(goodsId));
				}
				//酒店
				else if("hotel".equals(type)){
					data.put("goodsHotel", merchGoodsService.findGoodsHotelById(goodsId));
				}
				//餐饮
				else if("cater".equals(type)){
					data.put("goodsCater", merchGoodsService.findMerchGoodsCaterById(goodsId));
				}
				//装备
				else if("equip".equals(type)){
					List<PageData> goodsEquipList = productService.getEquipById(goodsId);
					data.put("goodsEquipList", goodsEquipList);
				}
				data.put("merchGood",merchGood);
				data.put("merchUser", merchUser);
				res.setData("data",data);
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 得到商品图片
	 * @return
	 */
	@RequestMapping(value = "pic")
	@ResponseBody
	public AppData pic() {
		AppData res = new AppData();
		try {
			PageData param = super.getApiPageData();
			Long goodsId = param.getLong("goodsId");
			if (ValidateHelper.isNullOrEmpty(goodsId)) {
				res.setMsg(XConst.PARAM_ERR);
			} else {
				MerchGoods merchGood = merchGoodsService.findGoodsById(goodsId,null);
				String type = merchGood.getGoodsType();
				res.setData("list", commonUploadService.listUpload(type+"Goods", "banner", goodsId.toString()));
				res.setStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.setStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
