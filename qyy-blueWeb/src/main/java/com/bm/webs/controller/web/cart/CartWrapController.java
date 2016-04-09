package com.bm.webs.controller.web.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.AreaAll;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebPriceSearch;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.common.AreaAllService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.WebPriceSearchService;
import com.bm.webs.service.web.WebCarDatePriceService;
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebOrderService;
import com.bm.webs.service.web.cart.WebCarAddrsService;
import com.bm.webs.service.web.cart.WebCarRuleService;
import com.bm.webs.service.web.cart.WebCarSafeService;
import com.bm.webs.service.web.cart.WebCarWrapService;
import com.bm.webs.service.web.user.WebUserService;

/**
 * 快旅出行-包车
 * 
 * @author jiangl <br>
 *         2015年9月3日
 */
@Controller
@RequestMapping(value = "pc/cart/wrap")
public class CartWrapController extends BaseController {

	@Autowired
	private WebCarWrapService webCarWrapService;// 包车

	@Autowired
	private WebCitysService webCitysService;// 城市

	@Autowired
	private WebPriceSearchService WebPriceSearchService;// 价格筛选

	@Autowired
	private CommonUploadService commonUploadService;// 文件上传

	@Autowired
	private WebCarAddrsService webCarAddrsService;// 车辆地址管理

	@Autowired
	private WebCarDatePriceService webCarDatePriceService;// 车日期价格

	@Autowired
	private WebCarRuleService webCarRuleService;// 车规则

	@Autowired
	private WebCarSafeService webCarSafeService;// 保险

	@Autowired
	private WebOrderService webOrderService;// 订单

	@Autowired
	private WebUserService webUserService;// 用户

	@Autowired
	private AreaAllService areaAllService;// 所有地区

	private static final int PAGE_SIZE = 10;

	/**
	 * 主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("web/cart/wrap_list");
		try {
			PageData pd = getPageData();
			// 包车类型
			List<PageData> wrapTypeList = webCarWrapService.getWrapTypeList();
			// 获取车类型
			List<PageData> carTypeList = webCarWrapService.getCarTypeList();
			// 获取品牌
			List<PageData> carBrandList = webCarWrapService.getBrandTypeList();
			// 获取日租金
			List<WebPriceSearch> carPriceList = WebPriceSearchService
					.getList("car_wrap");
			// 目的地-包车
			List<PageData> addrList = webCarAddrsService.findListByType("wrap");
			mav.addObject("wrapTypeList", wrapTypeList);
			mav.addObject("carTypeList", carTypeList);
			mav.addObject("carBrandList", carBrandList);
			mav.addObject("carPriceList", carPriceList);
			mav.addObject("addrList", addrList);
			mav.addObject("thisPageSize", 0);
			mav.addObject("totalPage", 0);
			mav.addObject("pageNo", 1);
			mav.addObject("homeWrapData", pd);
			
			if(!HString.isEmpty(pd.getString("startAddrIds")) && !HString.isEmpty(pd.getString("endAddrIds"))){
				List<PageData> routeList = getRouteList(pd);
				mav.addObject("routeList", routeList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 查询列表
	 * 
	 * @return
	 */

	@RequestMapping(value = "search")
	@ResponseBody
	public PageData search() {
		PageData res = new PageData();
		try {
			PageData pd = this.getSysPageData();
			Long total = webCarWrapService.getCarWrapListTotal(pd);
			Long totalPage = total % PAGE_SIZE == 0 ? total / PAGE_SIZE : total
					/ PAGE_SIZE + 1;
			List<PageData> carWrapList = webCarWrapService.getCarWrapList(pd,
					PAGE_SIZE);
			res.put("carWrapList", carWrapList);
			res.put("thisPageSize", carWrapList.size());
			res.put("totalPage", totalPage);
			res.put("pageNo", Long.valueOf(pd.getString("pageNo")));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 进入订单页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "order")
	public ModelAndView order() {
		ModelAndView mav = new ModelAndView("web/cart/wrap_order");
		try {
			PageData param = this.getPageData();
			PageData carWrap = webCarWrapService.getCarWrapById(param);
			// 解析路线
			List<PageData> routeList = getRouteList(param);
			// 根据出发时间和结束时间得到价格列表
			List<PageData> datePriceList = webCarDatePriceService
					.findListByDate(param);
			// 获取规则和保险
			PageData param2 = new PageData();
			param2.put("type", "wrap");
			PageData webCarRule = webCarRuleService.findRuleByType(param2);
			PageData webCarSafe = webCarSafeService.findByType(param2);
			// 获取当前登录人信息
			SystemSet sysset = (SystemSet) getRequest().getSession()
					.getAttribute(XConst.SESSION_SYSSET);
			if (sysset != null) {
				WebUser webUser = sysset.getWebUser();
				if (webUser != null) {
					List<AreaAll> areaList = areaAllService.findAreaByParentId(0l);
					mav.addObject("carWrap", carWrap);
					//解决乱码问题
					/*if(!HString.isEmpty(param.get("fromCityName"))){
						param.put("fromCityName",getUnEncode(param.getString("fromCityName")));
					}
					if(!HString.isEmpty(param.get("fromAddrDetail"))){
						param.put("fromAddrDetail",getUnEncode(param.getString("fromAddrDetail"))); 
					}*/
					String cn = getEncoding(param.get("fromCityName").toString());
					String ad = getEncoding(param.get("fromAddrDetail").toString());
					if(("ISO-8859-1").equals(cn)){
						param.put("fromCityName", new String(param.get("fromCityName").toString().getBytes("ISO-8859-1"), "UTF-8"));
					}
					if(("ISO-8859-1").equals(ad)){
						param.put("fromAddrDetail", new String(param.get("fromAddrDetail").toString().getBytes("ISO-8859-1"), "UTF-8"));
					}
					mav.addObject("cartWrapOrder", param);// 上一个页面填写的信息
					mav.addObject("routeList", routeList);// 路线
					mav.addObject("datePriceList", datePriceList);// 日期价格
					mav.addObject("dayCount", datePriceList.size());// 总天数
					mav.addObject("webCarRule", webCarRule);// 规则
					mav.addObject("webCarSafe", webCarSafe);// 保险
					mav.addObject("webUser", webUser);// 用户
					mav.addObject("areaList", areaList);// 省份
				} else {
					mav.setViewName("pc/login?op=toLogin");
				}
			} else {
				mav.setViewName("pc/login?op=toLogin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 解析路线
	 * @param param
	 * @return
	 */
	public List<PageData> getRouteList(PageData param){
		List<PageData> routeList = new ArrayList<PageData>();
		try {
			String[] startAddrIds = param.getString("startAddrIds").split(",");
			String[] endAddrIds = param.getString("endAddrIds").split(",");
			if (startAddrIds.length <= endAddrIds.length) {
				for (int i = 0; i < startAddrIds.length; i++) {
					PageData pdr = new PageData();
					// 起始地址
					PageData pd = webCarAddrsService.findSotreById(Long
							.valueOf(startAddrIds[i]));
					// 结束地址
					PageData pd2 = webCarAddrsService.findSotreById(Long
							.valueOf(endAddrIds[i]));
					if (null != pd) {
						pdr.put("startAddrId", pd.get("id"));
						pdr.put("startAddr", pd.get("store"));
					}
					if (null != pd2) {
						pdr.put("endAddrId", pd2.get("id")); 
						pdr.put("endCityId", pd2.get("city_id"));
						pdr.put("endArea", pd2.get("area"));
						pdr.put("endAddr", pd2.get("store"));
					}
					routeList.add(pdr);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return routeList;
	}

	/**
	 * 校验验证码
	 * 
	 * @return
	 */
	@RequestMapping(value = "validateCode")
	@ResponseBody
	public PageData validateCode() {
		PageData res = new PageData();
		try {
			PageData pd = this.getSysPageData();
			String vcode = (String) super.getRequest().getSession()
					.getAttribute("VCODE");
			if (!vcode.equals(pd.getString("code"))) {
				res.putStatus(XConst.V_CODE_ERROR);
			} else {
				res.putStatus(XConst.SUCCESS);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 提交订单到支付页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "order/pay")
	public ModelAndView submitOrder() {
		ModelAndView mav = new ModelAndView("web/common/payment");
		try {
			PageData param = this.getPageData();
			SystemSet sysset = (SystemSet) getRequest().getSession()
					.getAttribute(XConst.SESSION_SYSSET);
			if (sysset != null) {
				WebUser webUser = sysset.getWebUser();
				if (webUser != null) {
					param.put("userId", webUser.getId());// 当前登录人id
					String dayPrice=param.getString("dayPrice");
					Integer lastIndex=dayPrice.lastIndexOf(",");
					if(lastIndex!=-1){
						param.put("dayPrice", dayPrice.substring(0,lastIndex));
					}
					Long orderFormId = webCarWrapService.saveOrder(param);
					PageData detail = new PageData();
					detail.put("realPrice", param.get("realPrice"));
					detail.put("orderId", orderFormId);
					detail.put("orderType", "carWrap");
					mav.addObject("detail", detail);
				} else {
					mav.setViewName("pc/login?op=toLogin");
				}
			} else {
				mav.setViewName("pc/login?op=toLogin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 进入明细页
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail")
	public ModelAndView detail() {
		ModelAndView mav = null;
		mav = new ModelAndView("web/cart/wrap_detail");
		try {
			PageData param = this.getSysPageData();
			PageData carWrap = webCarWrapService.getCarWrapById(param);
			// 图片
			List<PageData> uploadList = commonUploadService.listUpload(
					"carWrap", "banner", carWrap.get("id").toString());
			mav.addObject("carWrap", carWrap);
			mav.addObject("uploadList", uploadList);
			mav.addObject("cartWrapOrder", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 获取包车类型
	 * @return
	 */
	@RequestMapping(value = "getWrapTypeList")
	@ResponseBody
	public PageData getWrapTypeList() {
		PageData res = new PageData();
		try {
			// 包车类型
			List<PageData> wrapTypeList = webCarWrapService.getWrapTypeList();
			res.put("list", wrapTypeList);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	static String enANum = "^[A-Za-z0-9_]*$";
	static Pattern enANumPat = Pattern.compile(enANum);
	static String[] encode = { "GB2312", "GBK", "ISO-8859-1", "UTF-8" };
	static String cnEx = "[\u4e00-\u9fa5]";
	static Pattern cnPat = Pattern.compile(cnEx);
	
	public static boolean isEnglishAndNumber(String str) {
		Matcher matcher = enANumPat.matcher(str);
		boolean flg = false;
		if (matcher.find()) {
			flg = true;
		}
		return flg;
	}
	
	public static String getUnEncode(String str) throws Exception {
		String newStr = null;
		if (!isEnglishAndNumber(str)) {
			for (int i = 0; i < encode.length; i++) {
				for (int j = 0; j < encode.length; j++) {
					newStr = new String(str.getBytes(encode[i]), encode[j]);
					char temp[] = newStr.toCharArray();
					boolean isAll = true;
					for (char c : temp) {
						if (!HString.isChinese(c)) {
							isAll = false;
							break;
						}
					}
					if (isAll) {
						return newStr;
					}
				}
			}
		}
		return "";
	}
	
	public static String getEncoding(String str) {      
	       String encode = "GB2312";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s = encode;      
	              return s;      
	           }      
	       } catch (Exception exception) {      
	       }      
	       encode = "ISO-8859-1";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s1 = encode;      
	              return s1;      
	           }      
	       } catch (Exception exception1) {      
	       }      
	       encode = "UTF-8";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s2 = encode;      
	              return s2;      
	           }      
	       } catch (Exception exception2) {      
	       }      
	       encode = "GBK";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s3 = encode;      
	              return s3;      
	           }      
	       } catch (Exception exception3) {      
	       }      
	      return "";      
	   } 

	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
