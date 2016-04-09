package com.bm.webs.controller.web.integralShop;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.bean.integralShop.Area;
import com.bm.webs.bean.integralShop.Banner;
import com.bm.webs.bean.integralShop.City;
import com.bm.webs.bean.integralShop.Province;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.AddressService;
import com.bm.webs.service.integralShop.BannerService;
import com.bm.webs.service.integralShop.OrderService;
import com.bm.webs.service.integralShop.WebIntegralGoodsService;
import com.bm.webs.service.web.WebUserLevelService;
import com.bm.webs.service.web.user.WebUserService;
import com.bm.webs.vo.GoodsView;
import com.bm.webs.vo.OrderView;

@Controller(value = "integralShopController")
@RequestMapping(value = "integralShop")
public class IntegralShopController extends BaseController {
	
	@Resource
	private BannerService bannerService;

	@Resource
	private WebIntegralGoodsService webIntegralGoodsService;
	
	@Resource
	private AddressService addressService;
	
	@Resource 
	private OrderService orderService;
	
	@Autowired
	private WebUserService userService;
	
	@Resource
	private WebUserLevelService userLevelService;
	
	private static final String MY_TRACKS = "myTracks";
	
	@RequestMapping("home")
	public ModelAndView home(){
		ModelAndView mav = new ModelAndView("web/integralShop/home");
		return mav;
		
	}
	
	
	
	@RequestMapping("index")
	public ModelAndView index() throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/index");
		List<Banner> banners=bannerService.getBanners();
		mav.addObject("banners", banners);
		
		//推荐商品
		GoodsView rcmdGoods = webIntegralGoodsService.getRecommendGoods();
		mav.addObject("rcmdGoods",rcmdGoods);
		
		//最新上架
		List<GoodsView> newShevelsGoods = webIntegralGoodsService.getNewShevelsGoods();
		mav.addObject("newShevelsGoods", newShevelsGoods);
		
		//创意商品
		List<GoodsView> originalityGoods =webIntegralGoodsService.getOriginalityGoods();
		mav.addObject("originalityGoods",originalityGoods);
		
		return mav;
	}
	
	
	
	@RequestMapping("travelEquipment")
	public ModelAndView travelEquipment(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/travelEquipment");
		List<GoodsView> travEqpmtGoods = webIntegralGoodsService.getTravEqpmtGoods();
		mav.addObject("travEqpmtGoods", travEqpmtGoods)	;
		//获得当前用户
		HttpSession session = request.getSession();
		SystemSet sysSet = (SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		if(sysSet!=null){
			WebUser user = sysSet.getWebUser();
			if(user!=null){
				PageData webUser = userService.getDetail(user.getId());
				mav.addObject("user",webUser);
			}
		}
		return mav;
	}
	
	@RequestMapping("yiyouzp")
	public ModelAndView yiyouzp(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/yiyouzp");
		
		List<GoodsView> yyzpGoods = webIntegralGoodsService.getYyzpGoods();
		mav.addObject("yyzpGoods", yyzpGoods);
		
		//获得当前用户
		HttpSession session = request.getSession();
		SystemSet sysSet = (SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		if(sysSet!=null){
			WebUser user = sysSet.getWebUser();
			if(user!=null){
				PageData webUser = userService.getDetail(user.getId());
				mav.addObject("user",webUser);
			}
		}
		return mav;
	}
	
	@RequestMapping("minzuyx")
	public ModelAndView minzuyx(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("web/integralShop/minzuyx");
		
		List<GoodsView> mzyxGoods = webIntegralGoodsService.getMzyxGoods();
		mav.addObject("mzyxGoods", mzyxGoods);
		
		//获得当前用户
		HttpSession session = request.getSession();
		SystemSet sysSet = (SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		if(sysSet!=null){
			WebUser user = sysSet.getWebUser();
			if(user!=null){
				PageData webUser = userService.getDetail(user.getId());
				mav.addObject("user",webUser);
			}
		}
		return mav;
	}
	
	@RequestMapping("goodsDetail/{id}")
	public ModelAndView goodsDetail(@PathVariable Integer id,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/goodsDetail");
		GoodsView goods = webIntegralGoodsService.findGoodsById(id);
		mav.addObject("goods", goods);
		
		//更新商品浏览量
		webIntegralGoodsService.updateGoodsPV(id);
		
		//每当商品被浏览，把商品添加至我的足迹
		HttpSession session = request.getSession();
		Object object = session.getAttribute(MY_TRACKS);
		if(object != null && object instanceof List<?>){
			
			ArrayList<?> myTracksList = (ArrayList<?>)object;
			
			if(myTracksList.get(0) !=null && myTracksList.get(0) instanceof GoodsView){
				
				
				
				@SuppressWarnings("unchecked")
				ArrayList<GoodsView> myTracks =(ArrayList<GoodsView>) myTracksList;
				
				//如果当前商品之前已被放入myTracks，那么就别放了
				for(GoodsView goodsView : myTracks){
					if(goodsView.getId()== id){
						return mav;
					}
				}
				
				myTracks.add(goods);
				session.setAttribute(MY_TRACKS,myTracks );
				return mav;
			}
		}
		
		List<GoodsView> myTracks = new ArrayList<GoodsView>();
		myTracks.add(goods);
		session.setAttribute(MY_TRACKS, myTracks);
		
		return mav;
		
	}
	
	@RequestMapping(value="pc/exchangeGoods/{id}/{goodsQuantity}")
	@ResponseBody
	public PageData exchangeGoods(@PathVariable("id") Integer id,@PathVariable("goodsQuantity") Integer goodsQuantity,HttpServletRequest request) throws Exception{
		
		PageData pageData = new PageData();
		
		GoodsView goods = webIntegralGoodsService.findGoodsById(id);
		
		//获得当前用户
		HttpSession session = request.getSession();
		SystemSet sysSet = (SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		WebUser user = sysSet.getWebUser();
		
		//用户桃子数
		PageData webUser = userService.getDetail(user.getId());
		
		if(goods.getCurrentPrice()*goodsQuantity>webUser.getInt("score")){
			pageData.putStatus(XConst.FAIL);
		}else{
			pageData.putStatus(XConst.SUCCESS);
		}
		return pageData;
		
	}
	
	@RequestMapping("pc/editOrderUI/{id}/{goodsQuantity}")
	public ModelAndView editOrderUI(@PathVariable("id") Integer id,@PathVariable("goodsQuantity") Integer goodsQuantity) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/editOrderUI");
		
		/*
		 * 查出商品
		 */
		GoodsView goods = webIntegralGoodsService.findGoodsById(id);
		mav.addObject("goods", goods);
		
		mav.addObject("goodsQuantity",goodsQuantity);
		mav.addObject("totalPrice",goodsQuantity*goods.getCurrentPrice());
		/*
		 *查出国家所有省份
		 */
		List<Province> provinces = addressService.getAllProvinces();
		mav.addObject("provinces", provinces);
		
		return mav;
		
	}
	
	@RequestMapping("getCities/{provinceId}")
	@ResponseBody
	public List<City> getCities(@PathVariable String provinceId) throws Exception{
		
		List<City> cities=addressService.getCitiesByProvinceId(provinceId);
		
		return cities;
	}
	
	@RequestMapping("getAreas/{cityId}")
	@ResponseBody
	public List<Area> getAreas(@PathVariable String cityId) throws Exception{
		List<Area> areas = addressService.getAreasByCityId(cityId);
		return areas;
	}
	
	@RequestMapping("orderConfirm")
	public ModelAndView orderConfirm(OrderView orderView,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/orderConfirm");
		
		//查出地址
		Area area = addressService.getAreaById(orderView.getArea().getAreaId());
	
		City city = addressService.getCityById(area.getCityId());
		Province province = addressService.getProvinceById(city.getProvinceId());
		orderView.setAddress(province.getProvince()+city.getCity()+area.getArea()+orderView.getDetailStreet());
		
		//查出商品
		GoodsView goods = webIntegralGoodsService.findGoodsById(orderView.getGoods().getId());
		orderView.setGoods(goods);
		
		//将订单相关信息存入session以待确认
		HttpSession session = request.getSession();
		session.setAttribute("orderView", orderView);
		return mav;
	}
	
	@RequestMapping("submitOrder")
	@ResponseBody
	public PageData submitOrder(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		OrderView orderView = (OrderView) session.getAttribute("orderView");
		PageData pageData=new PageData();
		try {
			 orderService.submitOrder(orderView);
			 pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			if("residuNumber<=0".equals(e.getMessage())){
				session.removeAttribute("orderView");
				pageData.putStatus(XConst.FAIL);
			}
			e.printStackTrace();
		}
		return  pageData;
		
	}
	
	@RequestMapping("exchangeSuccess")
	public ModelAndView exchangeSuccess(){
		
		ModelAndView mav = new ModelAndView("web/integralShop/exchangeSuccess");
		
		return mav;
	}
	
	@RequestMapping("exchangeRecord")
	public ModelAndView exchangeRecord(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("web/integralShop/exchangeRecord");
		
		//获得当前用户
		HttpSession session = request.getSession();
		SystemSet sysSet = (SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		WebUser user = sysSet.getWebUser();
		
		//用户桃子数
		PageData webUser = userService.getDetail(user.getId());
		mav.addObject("user", webUser);
		
		//用户等级
		PageData userLevel = userLevelService.getById(user.getUserLevelId());
		mav.addObject("userLevel", userLevel);
		
		//用户兑换记录
		List<OrderView> exchRcds = orderService.getExchRcds(user.getId());
		mav.addObject("exchRcds", exchRcds);
		return mav;
	}
	
	@RequestMapping("userReceiveGoods/{id}")
	@ResponseBody
	public PageData userReceiveGoods(@PathVariable Integer id){
		PageData pageData =  new PageData();
		
		try {
			orderService.userReceiveGoods(id);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pageData.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		return pageData;
	}
	
	@RequestMapping("deleteRecord/{id}")
	@ResponseBody
	public PageData deleteRecord(@PathVariable Integer id){
		PageData pageData = new PageData();
		try {
			orderService.deleteRecordById(id);
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
