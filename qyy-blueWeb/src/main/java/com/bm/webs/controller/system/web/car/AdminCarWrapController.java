package com.bm.webs.controller.system.web.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebCarSys;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebCarSysService;
import com.bm.webs.service.web.cart.WebCarBrandService;
import com.bm.webs.service.web.cart.WebCarService;
import com.bm.webs.service.web.cart.WebCarWrapService;


/**
 * 
 * 包车后台管理Controller
 * 
 * @author jiangl
 *
 */
@Controller
@RequestMapping("admin/cart/wrap")
public class AdminCarWrapController extends BaseController{
	
	
	@Autowired
	private WebCarWrapService webCarWrapService;//包车
	
	@Autowired
	private WebCarBrandService webCarBrandService;//品牌
	
	@Autowired
	private WebCarSysService webCarSysService;//车系
	
	@Autowired
	private WebCarService webCarService;//车
	
	@Autowired
	private WebCarDatePriceService webCarDatePriceService;//车日期价格
	
	@Autowired
	private CommonUploadService commonUploadService;//文件上传

	/**
	 * 
	 * 跳转到包车页面
	 * 
	 * @return
	 */
	@RequestMapping("main")
	public ModelAndView main(){
		ModelAndView mav=new ModelAndView();
		try {
			List<PageData> brandList=webCarBrandService.findCarBrandList("wrap");
			List<PageData> seatingList = webCarWrapService
								.getWrapTypeList();
			mav.addObject("brandList", brandList);//车辆品牌
			mav.addObject("seatingList", seatingList);//座位数
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("system/car/admin_wrap_list");
		return mav;
	}
	
	/**
	 * 根据品牌得到系别
	 * @return
	 */
	@RequestMapping(value="getSys")
	@ResponseBody
	public PageData getSys(){
		PageData res = new PageData();
		try {
			PageData param = this.getSysPageData();
			List<WebCarSys> list = webCarSysService.findCarSysByBrandId(param.getLong("brandId"));
			res.put("list", list);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 
	 * 获取包车列表
	 * 
	 * @return
	 */
	@RequestMapping(value="list")
	@ResponseBody
	public PageData list(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			String jsonStr = param.getString("search[value]");
			if(!HString.isEmpty(jsonStr)){
				JSONObject json = JSONObject.parseObject(jsonStr);
				param.put("brandId", json.getLong("brandId"));
				param.put("sysId", json.getLong("sysId"));
				param.put("seating", json.getLong("seating"));
				param.put("price", json.getLong("price"));
			}
			Integer num = webCarWrapService.findAdminWrapNum(param);
			List<PageData> list=webCarWrapService.findAdminWrapList(param);
			res.put("data", list);
			res.put("recordsTotal", num);
			res.put("recordsFiltered", num);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 上架和下架
	 * @return
	 */
	@RequestMapping(value="onOffLine")
	@ResponseBody
	public PageData onOffLine(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webCarWrapService.updateCarShelves(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 进入编辑页面
	 * @return
	 */
	@RequestMapping("edit/{id}")
	public ModelAndView edit(@PathVariable(value = "id") Long id){
		ModelAndView mav=new ModelAndView();
		try {
			if(0 != id){
				//车辆基本信息
				PageData carWrap = webCarWrapService.findAdminCarWrapById(id);
				//车日期价格
				PageData param = new PageData();
				param.put("id", id);
				List<PageData> datePriceList = webCarDatePriceService.findListByDate(param);
				//车辆图片
				List<PageData> photoList = commonUploadService.listUpload("carWrap", "banner", id.toString()); 
				
				mav.addObject("carWrap", carWrap);
				mav.addObject("datePriceList", JSONObject.toJSON(datePriceList));
				mav.addObject("photoList", photoList);
			}
			List<PageData> brandList=webCarBrandService.findCarBrandList("wrap");
			mav.addObject("brandList", brandList);//车辆品牌
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("system/car/admin_wrap_info");
		return mav;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value="delete")
	@ResponseBody
	public PageData delete(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webCarWrapService.deleteCar(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存并返回到列表页
	 * @return
	 */
	@RequestMapping("saveReturn")
	public ModelAndView saveReturn(){
		ModelAndView mav=new ModelAndView("system/car/admin_wrap_list");
		try {
			PageData param = getPageData();
			webCarWrapService.saveCar(param);
			List<PageData> brandList=webCarBrandService.findCarBrandList("wrap");
			List<PageData> seatingList = webCarWrapService
								.getWrapTypeList();
			mav.addObject("brandList", brandList);//车辆品牌
			mav.addObject("seatingList", seatingList);//座位数
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 保存车辆基本信息
	 * @return
	 */
	@RequestMapping(value="saveCar")
	@ResponseBody
	public PageData saveCar(){
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webCarWrapService.saveCar(param);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
