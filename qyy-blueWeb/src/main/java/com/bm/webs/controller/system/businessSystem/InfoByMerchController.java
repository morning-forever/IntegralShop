package com.bm.webs.controller.system.businessSystem;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.file.FileUpload;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.MerchBrand;
import com.bm.webs.bean.MerchLinkman;
import com.bm.webs.bean.MerchRestaurant;
import com.bm.webs.bean.MerchTheme;
import com.bm.webs.bean.MerchUser;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebSimpleEquip;
import com.bm.webs.bean.WebSimpleHotelStar;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.system.AdminUser;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.LinkmanService;
import com.bm.webs.service.businessSystem.MerchBrandService;
import com.bm.webs.service.businessSystem.MerchRestaurantService;
import com.bm.webs.service.businessSystem.MerchThemeService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.MerchHotelLocService;
import com.bm.webs.service.system.WebSimpleEquipService;
import com.bm.webs.service.system.urrm.UserService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebSimpleHotelStarService;
import com.google.gson.Gson;

/**
 * 
 * 商户信息Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="merchSystem/info")
public class InfoByMerchController extends BaseController {
	
	@Autowired
	private WebCitysService webCitysService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MerchUserService merchUserService;
	
	@Autowired
	private LinkmanService linkmanService;
	
	@Autowired
	private CommonUploadService commonUploadService;

	@Autowired
	private WebSimpleHotelStarService webSimpleHotelStarService;
	
	@Autowired
	private MerchThemeService merchThemeService;
	
	@Autowired
	private MerchBrandService merchBrandService;
	
	@Autowired
	private MerchRestaurantService merchRetaurantService;
	
	@Autowired
	private WebSimpleEquipService webSimpleEquipService;
	
	@Autowired
	private MerchHotelLocService merchHotelLocService;
	
	/**
	 * 
	 * 跳转到商户信息页面
	 * 
	 * @return
	 */
	@RequestMapping("info")
	public ModelAndView info(){
		ModelAndView mav=super.getModelAndView();
		PageData map=new PageData();
		try {
			List<PageData> list=null;
			
			SystemSet sysset=(SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			
			AdminUser adminUser=userService.findUser(sysset.getU().getId());
			
			map.put("id", adminUser.getId());
			
			MerchUser merchUser=merchUserService.findMerchUser(map);
			
			map.put("merchId", merchUser.getId());
			MerchLinkman linkman=linkmanService.findLinkMan(map);
			
			PageData cityMap=webCitysService.getById(merchUser.getAtAddr());
			PageData provinceMap=webCitysService.getById((Long) cityMap.get("parentId"));
			
			List<PageData> photoList=commonUploadService.findAllPhoto(merchUser.getId());
			
			mav.addObject("merchTypeName", merchUser.getMerchTypeName());
			
			if(merchUser.getMerchType()!=2){//判断是否为酒店商户
				list=webCitysService.findProvinceList();
			}else{
				List<HashMap<String, Object>> hotelLocList=merchHotelLocService.findMerchHotelLocList(merchUser.getId());
				mav.addObject("hotelLocList", JSONObject.toJSONString(hotelLocList));
				list=webCitysService.findHotelAddrList();
			}
			
			mav.addObject("username",adminUser.getUsername());//商户名
			
			mav.addObject("city",cityMap);//城市
			mav.addObject("province",provinceMap);
			
			mav.addObject("addrDetail", merchUser.getAddrDetail());//商户具体地址
			mav.addObject("summary", merchUser.getSummary());//商户详细说明
			mav.addObject("merchType",merchUser.getMerchType());//商户类型
			
			mav.addObject("brand", merchUser.getBrand());
			mav.addObject("starLevel", merchUser.getStarLevel());
			mav.addObject("theme", merchUser.getTheme());
			mav.addObject("serviceType", merchUser.getServiceType());
			mav.addObject("facilities", merchUser.getFacilities());
			
			mav.addObject("linkName", linkman.getLinkName());//联系人名
			mav.addObject("linkPhone", linkman.getLinkPhone());//联系人手机号
			mav.addObject("linkEmail", linkman.getLinkEmail());//联系人Email
			mav.addObject("linkMerchTel", linkman.getLinkMerchTel());//联系商家电话
			
			mav.addObject("photoList",photoList);//图片list
			
			List<WebSimpleHotelStar> hotelStarList=webSimpleHotelStarService.allList();//星级List
			List<MerchTheme> merchThemeList=merchThemeService.allList();//主题List
			List<MerchBrand> merchBrandList=merchBrandService.allList();//品牌List
			List<MerchRestaurant> merchRestaurantList=merchRetaurantService.allList();//餐饮分类List
			List<WebSimpleEquip> webSimpleEquipList=webSimpleEquipService.allList();//装备分类List
			
			mav.addObject("merchRestaurantList", merchRestaurantList);
			mav.addObject("webSimpleEquipList", webSimpleEquipList);
			mav.addObject("merchBrandList", merchBrandList);
			mav.addObject("merchThemeList", merchThemeList);
			mav.addObject("hotelStarList", hotelStarList);
			mav.addObject("provinceList", list);
			mav.setViewName("businessSystem/info/merchInfo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 异步上传图片
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="imgFileUpload",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData imgFileUpload(@RequestParam("img")MultipartFile file,HttpServletRequest request){
		PageData reqData=super.getPageData();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		try {
			String oldName=file.getOriginalFilename();
			String suffix=oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath=request.getSession().getServletContext().getRealPath("")+"/uploadFiles/uploadImgs";
			String urlPath="uploadFiles/uploadImgs/";
			String fileName=sdf.format(new Date())+suffix;
//			System.out.println(request.getServletPath());
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);
//			System.out.println(fileName);
			reqData.put("imgUrl", urlPath+fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reqData;
	} 
	
	/**
	 * 
	 * 保存商户信息
	 * 
	 * @return
	 */
	@RequestMapping(value={"saveMerch"},produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PageData saveMerch(MerchUser merch,AdminUser admin,MerchLinkman linkman,String url,String hotelLocation){
		PageData map=new PageData();
		try {
//			String paramStr=IOUtils.toString(getRequest().getInputStream());
//			String paramStr=getRequest().getQueryString();
//			System.out.println(paramStr);
			
			SystemSet sysset=(SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			
			map.clear();
			map.put("username", admin.getUsername());
			map.put("id", sysset.getU().getId());
			userService.updateUser(map);
			
			map.clear();
			map.put("username", admin.getUsername());
			map.put("addrDetail", merch.getAddrDetail());
			map.put("summary", merch.getSummary());
			map.put("atAddr", merch.getAtAddr());
			map.put("id", sysset.getU().getId());
			if(!ValidateHelper.isNullOrEmpty(merch.getBrand())){
				map.put("brand", merch.getBrand());
			}
			if(!ValidateHelper.isNullOrEmpty(merch.getStarLevel())){
				map.put("starLevel", merch.getStarLevel());
			}
			if(!ValidateHelper.isNullOrEmpty(merch.getTheme())){
				map.put("theme", merch.getTheme());
			}
			map.put("facilities", merch.getFacilities());
			if(!ValidateHelper.isNullOrEmpty(merch.getServiceType())){
				map.put("serviceType", merch.getServiceType());
			}
			merchUserService.updateMerchUser(map);	
			
			map.clear();
			map.put("id", sysset.getU().getId());
			merch=merchUserService.findMerchUser(map);
			
			map.clear();
			map.put("merchId", merch.getId());
			map.put("linkName", linkman.getLinkName());
			map.put("linkPhone", linkman.getLinkPhone());
			map.put("linkEmail", linkman.getLinkEmail());
			map.put("linkMerchTel", linkman.getLinkMerchTel());
			
			linkmanService.updateLinkman(map);
			
			if(2==merch.getMerchType()){
				map.clear();
				map.put("merchId", merch.getId());
				merchHotelLocService.removeOldLocCt(map);
				String[] hotelLocationArr=hotelLocation.split(",");
				for (int i = 0; i < hotelLocationArr.length; i++) {
					map.put("locId", hotelLocationArr[i]);
					merchHotelLocService.saveLocCt(map);
					map.remove("locId");
				}
			}
			
			String[] urlArr=url.split(",");
			map.clear();
			map.put("fromId", merch.getId());
			commonUploadService.deleteAllPhoto(map);
			map.put("picFrom", "merch");
			map.put("picType", "head");
			for (int i = 0; i < urlArr.length; i++) {
				if(!ValidateHelper.isNullOrEmpty(urlArr[i])){
					map.put("picUrl", urlArr[i]);
					commonUploadService.savePhotoUrl(map);
				}
			}
			
			map.clear();
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
			
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 获取省下对应的城市
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = { "getCitys" },produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PageData getCitys(@Param("id") Long id){
		PageData map=new PageData();
		try {
			List<PageData> list=webCitysService.findChildCity(id);
			map.put("citysList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 查询酒店目的地城市
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value="getHotelCitys",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getHotelCitys(Long id){
		PageData map=new PageData();
		try {
			List<PageData> list=webCitysService.findHotelCityList(id);
			map.put("citysList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 
	 * 查询地址
	 * 
	 * @param cityId
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value="getlocation",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getlocation(Long cityId,Long parentId){
		PageData map=new PageData();
		try {
			List<PageData> list=merchHotelLocService.findLocation(cityId,parentId);
			map.put("citysList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
	public static void main(String[] args) {
		List<HashMap<String, Object>> list=new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> map1 =new HashMap<String, Object>();
		map1.put("key", 1);
		HashMap<String, Object> map2 =new HashMap<String, Object>();
		map2.put("key", 2);
		list.add(map1);
		list.add(map2);
		Gson gson=new Gson();
		System.out.println(gson.toJson(list));
	}
}
