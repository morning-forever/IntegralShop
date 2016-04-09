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
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 漫游商城-商户管理
 * 
 * @author jiangl <br>
 *         2015年9月7日
 */
@Controller
@RequestMapping(value = "admin/roamMall/merchant")
public class MerchantController  extends BaseController{
	
	@Autowired
	private MerchGoodsService merchGoodsService;
	
	@Autowired
	private MerchUserService merchUserService;//商户
	
	@Autowired
	private WebCitysService webCitysService;//城市
	
	@Autowired
	private CommonUploadService commonUploadService;//文件上传
	
	/**
	 * 进入主页面
	 * @param tab
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main(String tab) {
		ModelAndView mav = super.getModelAndView();
		try {
			mav.addObject("tab", tab);
			mav.setViewName("system/roamMall/merchant_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 列表页
	 * @param merchType 商户类型（1：景区商户   2：酒店商户   3：餐饮商户  4：装备商户）
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list(String merchType) {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			String str = param.getString("search[value]");
			if (!HString.isEmpty(str)) {
				JSONObject json  = JSONObject.parseObject(str);
				param.put("username", json.get("username"));
				param.put("linkPhone", json.get("linkPhone"));
				param.put("addrDetail", json.get("addrDetail"));
			}
			param.put("merchType", merchType);
			res = merchUserService.getMerchantList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 查询详情
	 * @param id 
	 * @param merchType
	 * @return
	 */
	@RequestMapping("/detail")
	public ModelAndView detail(Long id, String merchType) {
		ModelAndView mav = new ModelAndView();
		try {
			PageData param = getPageData();
			param.put("id", id);
			PageData merchUser = merchUserService.findById(param);
			String loc = webCitysService.getSpecificAddress(merchUser.getLong("at_addr"));
			List<PageData> photoUrlList = commonUploadService.listUpload("merch", "head", merchUser.getLong("id").toString());
			//景区
			if("1".equals(merchType)){
				mav.setViewName("system/roamMall/merchant_scenic_detail");
			}
			//酒店
			else if("2".equals(merchType)){
				mav.setViewName("system/roamMall/merchant_hotel_detail");
			}
			//餐饮
			else if("3".equals(merchType)){
				mav.setViewName("system/roamMall/merchant_cater_detail");
			}
			//装备
			else if("4".equals(merchType)){
				mav.setViewName("system/roamMall/merchant_equip_detail");
			}
			mav.addObject("loc",loc);
			mav.addObject("merchUser",merchUser);
			mav.addObject("photoUrlList", photoUrlList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 物理删除
	 * @param merchType
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			merchUserService.updateDeleteStatus(param.getLong("id"));
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
