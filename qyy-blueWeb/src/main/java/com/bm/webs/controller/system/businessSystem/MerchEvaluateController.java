package com.bm.webs.controller.system.businessSystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.MerchUser;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.web.WebEvaluataService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 
 * 商户评论Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="merchSystem/evaluate")
public class MerchEvaluateController extends BaseController{
	
	@Autowired
	private MerchUserService merchUserService;
	
	@Autowired
	private WebEvaluataService webEvaluataService;
	
	@Autowired
	private WebUserService webUserService;

	/**
	 * 
	 * 跳转到商品列表页面
	 * 
	 * @return
	 */
	@RequestMapping("/page")
	public ModelAndView evaluateListPage() {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("businessSystem/evaluate/evaluate_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * 
	 * 查询评论List
	 * 
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData evaluateList(){
		
		PageData map = getSysPageData();
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			
			String goodsName=null;
			Long downLimit=1l;
			Long upperLimit=5l;
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				goodsName = (String) json.get("goodsName");
				downLimit = objectOfValue(json.get("downLimit"), Long.class);
				upperLimit = objectOfValue(json.get("upperLimit"), Long.class);
			}
			
			String goodsType=getMerchTypeString(merchUser);
			
			List<PageData> list=webEvaluataService.findMerchEvaluataList(map,merchUser.getId(),goodsType,goodsName,downLimit,upperLimit);
			map.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 跳转到商品评论列表
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkGoodsEvaluata")
	public ModelAndView checkGoodsEvaluata(Long id){
		ModelAndView mav=new ModelAndView("businessSystem/evaluate/goods_evaluate_list");
		mav.addObject("goodsId", id);
		return mav;
	}
	
	/**
	 * 
	 * 查询商品评论列表
	 * 
	 * @param goodsId
	 * @return
	 */
	@RequestMapping(value="goodsEvaluataList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData goodsEvaluataList(Long goodsId){
		PageData map = getSysPageData();
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			
			String nickName=null;
			String comment=null;
			String startTime=null;
			String endTime=null;
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				nickName = (String) json.get("nickName");
				comment = (String) json.get("comment");
				startTime = (String) json.get("startTime");
				endTime = (String) json.get("endTime");
			}
			String goodsType=getMerchTypeString(merchUser);
			
			List<PageData> list=webEvaluataService.findGoodsEvaluataList(map,goodsType,goodsId,nickName,comment,startTime,endTime);
			map.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 删除评论
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "delete", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			webEvaluataService.deleteEvals(ids);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 查看用户
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkUser",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData checkUser(Long id){
		PageData map = new PageData();
		try {
			PageData user=webUserService.findById(id);
			map.put("user", user);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}
	
	/**
	 * 
	 * 设置商品类型
	 * 
	 * 商品类型（scenic：景点,hotel:酒店, cater：餐饮,equip：装备） 对应（1,2,3,4）
	 * 
	 * @param goods
	 * @param merchUser
	 */
	private String getMerchTypeString(MerchUser merchUser) {
		String type = "";
		switch (merchUser.getMerchType()) {
		case 1:
			type = "scenic";// 景点
			break;
		case 2:
			type = "hotel";// 酒店
			break;
		case 3:
			type = "cater";// 餐饮
			break;
		case 4:
			type = "equip";// 装备
			break;

		default:
			break;
		}
		return type;
	}
	
}
