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
import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.roamMall.MerchScenicDestService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 漫游商城-景区管理
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/roamMall/scenic")
public class ScenicController extends BaseController {

	@Autowired
	private MerchScenicDestService merchScenicDestService;//景区目的地

	@Autowired
	private WebCitysService webCitysService;//城市
	
	@Autowired
	private WebPriceSearchService webPriceSearchService;//价格筛选
	
	@Autowired
	private MerchGoodsService merchGoodsService;//商品
	
	@Autowired
	private MerchUserService merchUserService;//用户

	/**
	 * 进入主页面
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = super.getModelAndView();
		try {
			List<WebPriceSearch> priceList = webPriceSearchService.getList("scenic");
			mav.addObject("priceList", priceList);//价格筛选
			mav.setViewName("system/roamMall/scenic_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 获取景区目的地列表
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = this.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json = JSONObject.parseObject(str);
				param.put("provinceId",
						HString.isEmpty(json.get("provinceId")) ? "" : json
								.get("provinceId"));
				param.put("cityId", HString.isEmpty(json.get("cityId")) ? ""
						: json.get("cityId"));
				param.put("destId", HString.isEmpty(json.get("destId")) ? ""
						: json.get("destId"));
			}
			res = merchScenicDestService.getAdminList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 保存景区目的地
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Integer count = merchScenicDestService.getResultNum(param);
			if (count == 0) {
				String scenicId = param.getString("scenicId");
				// 新增
				if (HString.isEmpty(scenicId)) {
					merchScenicDestService.insert(param);
				}
				// 更新
				else {
					merchScenicDestService.update(param);
				}
				res.putStatus(XConst.SUCCESS);
			} else {
				res.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 编辑景区目的地
	 * 
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public PageData edit() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String id = param.getString("id");
			if (HString.isEmpty(id)) {
				res.putStatus(XConst.ERROR);
				return res;
			}
			PageData data = merchScenicDestService.getById(new Long(id));
			res.put("data", data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除景区目的地
	 * 
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = super.getSysPageData();
		try {
			PageData param = getPageData();
			merchScenicDestService.delete(new Long(param.getString("id")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 获取景区目的地
	 * @return
	 */
	@RequestMapping("/getDest")
	@ResponseBody
	public PageData getDest() {
		PageData res = new PageData();
		try {
			PageData param = super.getPageData();
			if (!HString.isEmpty(param.get("cityId"))) {
				List<PageData> destList = merchScenicDestService.getListByCityId(param.getLong("cityId"));
				if (!HString.isEmpty(destList)) {
					res.put("list", destList);
					res.putStatus(XConst.SUCCESS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 进入订购券信息页面
	 * @return
	 */
	@RequestMapping("/toCoupon")
	public ModelAndView toCoupon(Long goodsId) {
		ModelAndView mav = super.getModelAndView();
		try {
			MerchGoods goods = merchGoodsService.findGoodsById(goodsId, "scenicGoods");
			PageData param = new PageData();
			param.put("id", goods.getMerchUserId());
			PageData merchUser  = merchUserService.findById(param);
			mav.addObject("goods", goods);
			mav.addObject("merchUser", merchUser);
			mav.setViewName("system/roamMall/product_scenic_coupon");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 查询景区购物券列表
	 * @return
	 */
	@RequestMapping("/getCoupon")
	@ResponseBody
	public PageData getCoupon() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json = JSONObject.parseObject(str);
				param.put("coupon",
						HString.isEmpty(json.get("coupon")) ? "" : json
								.get("coupon"));
				param.put("personName", HString.isEmpty(json.get("personName")) ? ""
						: json.get("personName"));
				param.put("personPhone", HString.isEmpty(json.get("personPhone")) ? ""
						: json.get("personPhone"));
				param.put("goodsId", HString.isEmpty(json.get("goodsId")) ? ""
						: json.get("goodsId"));
			}
			res = merchScenicDestService.getCouponListByGoodsId(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
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
