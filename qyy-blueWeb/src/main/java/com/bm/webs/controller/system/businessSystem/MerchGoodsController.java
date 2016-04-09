package com.bm.webs.controller.system.businessSystem;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.MerchGoodsCater;
import com.bm.webs.bean.MerchGoodsEquip;
import com.bm.webs.bean.MerchGoodsHotel;
import com.bm.webs.bean.MerchGoodsScenic;
import com.bm.webs.bean.MerchUser;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.businessSystem.MerchGoodsService;
import com.bm.webs.service.businessSystem.MerchUserService;
import com.bm.webs.service.common.CommonUploadService;
import com.bm.webs.service.roamMall.MerchScenicDestService;
import com.bm.webs.service.web.WebCitysService;

/**
 * 
 * 商户商品Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping("merchSystem/goods")
public class MerchGoodsController extends BaseController {

	@Autowired
	private MerchGoodsService merchGoodsService;

	@Autowired
	private MerchUserService merchUserService;

	@Autowired
	private WebCitysService webCitysService;

	@Autowired
	private CommonUploadService commonUploadService;
	
	@Autowired
	private MerchScenicDestService merchScenidDest;

	private SimpleDateFormat timestampFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");// 生成格式化时间戳

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");// 将前端返回来的字符串时间转成Date对象
	private SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");// 将前端返回来的字符串时间转成Date对象

	/**
	 * 
	 * 跳转到商品列表页面
	 * 
	 * @return
	 */
	@RequestMapping("/page")
	public ModelAndView goodListPage() {
		ModelAndView mav = new ModelAndView();
		try {
			PageData map = new PageData();
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			if (merchUser.getMerchType() == 1) {
				mav.setViewName("businessSystem/goods/scenicGoodsList");
			} else if (merchUser.getMerchType() == 2) {
				mav.setViewName("businessSystem/goods/hotelGoodsList");
			} else if (merchUser.getMerchType() == 3) {
				mav.setViewName("businessSystem/goods/caterGoodsList");
			} else if (merchUser.getMerchType() == 4) {
				mav.setViewName("businessSystem/goods/equipGoodsList");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("addProduct")
	public ModelAndView addProduct() {
		ModelAndView mav = new ModelAndView();
		try {
			List<PageData> list = webCitysService.findProvinceList();
			PageData map = new PageData();
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			if (merchUser.getMerchType() == 1) {
				mav.setViewName("businessSystem/goods/scenicGoodsInfo");
			} else if (merchUser.getMerchType() == 2) {
				mav.setViewName("businessSystem/goods/hotelGoodsInfo");
			} else if (merchUser.getMerchType() == 3) {
				mav.setViewName("businessSystem/goods/caterGoodsInfo");
			} else if (merchUser.getMerchType() == 4) {
				mav.setViewName("businessSystem/goods/equipGoodsInfo");
			}
			mav.addObject("provinceList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 跳转编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("editProduct")
	public ModelAndView editProduct(Long id) {
		ModelAndView mav = new ModelAndView();
		PageData map = new PageData();
		List<String> photoUrlList = null;
		try {
			String urls = "";

			List<PageData> list = webCitysService.findProvinceList();

			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);

			MerchGoods goods = merchGoodsService.findGoodsById(id, getMerchTypeString(merchUser));
			
			if ("scenic".equals(goods.getGoodsType())) {// 景区商品部分
				MerchGoodsScenic goodsScenic = merchGoodsService.findGoodsScenicById(goods.getId());

				PageData citysIdMap = webCitysService.findPGId(goodsScenic.getAtAreaId());

				// 格式化有效期日期
				String periodStart = dateFormat.format(goodsScenic.getPeriodStart());
				String periodEnd = dateFormat.format(goodsScenic.getPeriodEnd());

				// 格式化使用时间
				String startTime = timeFormat.format(goodsScenic.getTimeStart());
				String endTime = timeFormat.format(goodsScenic.getTimeEnd());
				
				String couponTime = dateFormat.format(goodsScenic.getCouponTime());

				mav.addObject("period", periodStart + " to " + periodEnd);
				mav.addObject("startTime", startTime);
				mav.addObject("endTime", endTime);
				mav.addObject("couponTime", couponTime);

				mav.addObject("goodsScenic", goodsScenic);
				mav.addObject("citysIdMap", citysIdMap);
				mav.setViewName("businessSystem/goods/scenicGoodsInfo");
			} else if ("hotel".equals(goods.getGoodsType())) {// 酒店商品部分
				MerchGoodsHotel goodsHotel = merchGoodsService.findGoodsHotelById(goods.getId());

				// 格式化使用时间
				String startTime = timeFormat.format(goodsHotel.getTimeStart());
				String endTime = timeFormat.format(goodsHotel.getTimeEnd());

				mav.addObject("startTime", startTime);
				mav.addObject("endTime", endTime);
				mav.addObject("goodsHotel", goodsHotel);
				mav.setViewName("businessSystem/goods/hotelGoodsInfo");
			} else if ("cater".equals(goods.getGoodsType())) {// 餐饮商品部分

				MerchGoodsCater goodsCater = merchGoodsService.findGoodsCaterById(goods.getId());

				mav.addObject("goodsCater", goodsCater);
				mav.setViewName("businessSystem/goods/caterGoodsInfo");
			} else if ("equip".equals(goods.getGoodsType())) {// 装备商品部分

				PageData goodsEquipListStr = merchGoodsService.findGoodsEquipStrById(goods.getId());

				mav.addObject("goodsEquipListStr", goodsEquipListStr);
				mav.setViewName("businessSystem/goods/equipGoodsInfo");
			}
			photoUrlList = commonUploadService.findGoodsPhoto(goods.getId(), goods.getGoodsType() + "Goods");

			StringBuffer urlsBuffer = new StringBuffer();
			for (String url : photoUrlList) {
				urlsBuffer.append(url);
				urlsBuffer.append(",");
			}
			urls = urlsBuffer.toString();

			mav.addObject("goods", goods);
			mav.addObject("urls", urls);
			mav.addObject("provinceList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 
	 * 查询商品列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData goodsList() {
		PageData map = getSysPageData();
		try {
			String goodsId = null;
			String goodsName = null;
			String status = null;
			String serchDate = null;
			String jsonStr = map.getString("search[value]");
			if (!ValidateHelper.isNullOrEmpty(jsonStr)) {
				JSONObject json = JSONObject.parseObject(jsonStr);
				goodsId = (String) json.get("goodsId");
				goodsName = (String) json.get("goodsName");
				status = (String) json.get("status");
				serchDate = (String) json.get("Serchdate");
			}

			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);
			List<PageData> list = null;
			Long countNum = null;
			if (merchUser.getMerchType() == 1) {// 景区商品列表
				list = merchGoodsService.findScenicGoodsListByMerchId(merchUser.getId(), goodsId, goodsName,
						status,map);
				countNum = merchGoodsService.findScenicGoodsNumber(merchUser.getId(), goodsId, goodsName,
						status);
			} else if (merchUser.getMerchType() == 2) {// 酒店商品列表
				list = merchGoodsService.finHotelGoodsByMerchId(merchUser.getId(), goodsId, goodsName,
						serchDate, status,map);
				countNum = merchGoodsService.findHotelGoodsNumber(merchUser.getId(), goodsId, goodsName,
						serchDate, status);
			} else if (merchUser.getMerchType() == 3) {// 餐饮商品列表
				list = merchGoodsService.findCaterGoodsByMerchId(merchUser.getId(), goodsId, goodsName,
						status,map);
				countNum = merchGoodsService.findCaterGoodsNumber(merchUser.getId(), goodsId, goodsName,
						status);
			} else if (merchUser.getMerchType() == 4) {
				list = merchGoodsService.findEquipGoodsByMerchId(merchUser.getId(), goodsId, goodsName,
						status,map);
				countNum = merchGoodsService.findEquipGoodsNumber(merchUser.getId(), goodsId, goodsName,
						status);
			}
			map.clear();

			map.put("data", list);

			map.put("recordsTotal", countNum);
			map.put("recordsFiltered", countNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 上架商品
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "online", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData online(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			merchGoodsService.changeGoodsStatus(ids, 0);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(XConst.STATUS_KEY, XConst.ERROR);
		}
		return map;
	}

	/**
	 * 
	 * 下架商品
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "offline", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData offline(String ids) {
		PageData map = new PageData();
		try {
			int lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			merchGoodsService.changeGoodsStatus(ids, 1);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(XConst.STATUS_KEY, XConst.ERROR);
		}
		return map;
	}

	/**
	 * 
	 * 删除商品
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
			merchGoodsService.deleteGoods(ids);
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(XConst.STATUS_KEY, XConst.ERROR);
		}
		return map;
	}

	/**
	 * 
	 * 保存景区商品信息
	 * 
	 * @param goods
	 * @param goodsScenic
	 * @param url
	 * @param periodTime
	 * @return
	 */
	@RequestMapping(value = "submitScenicProduct", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitScenicProduct(MerchGoods goods, MerchGoodsScenic goodsScenic, String url,
			String periodTime, String timeStartStr, String timeEndStr, Long goodsScenicId, Long goodsId,String couponTimeStr) {
		PageData map = new PageData();
		Date periodStartTime = null;
		Date periodEndTime = null;
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);

			goods.setMerchUserId(merchUser.getId());
			goods.setGoodsType(getMerchTypeString(merchUser));
			if (!ValidateHelper.isNullOrEmpty(timeStartStr) && !ValidateHelper.isNullOrEmpty(timeEndStr)
					&& !ValidateHelper.isNullOrEmpty(periodTime)) {
				if (goodsScenicId != null && goodsId != null) {// 更新
					goods.setId(goodsId);
					goodsScenic.setId(goodsScenicId);
					merchGoodsService.updateGoods(goods);
					if (!ValidateHelper.isNullOrEmpty(periodTime)
							&& !ValidateHelper.isNullOrEmpty(timeStartStr)
							&& !ValidateHelper.isNullOrEmpty(timeEndStr)) {
						String[] periodTimeArr = periodTime.split("to");
						periodStartTime = dateFormat.parse(periodTimeArr[0]);
						periodEndTime = dateFormat.parse(periodTimeArr[1]);
						goodsScenic.setPeriodStart(periodStartTime);
						goodsScenic.setPeriodEnd(periodEndTime);
						goodsScenic.setTimeStart(timeFormat.parse(timeStartStr));
						goodsScenic.setTimeEnd(timeFormat.parse(timeEndStr));
						goodsScenic.setCouponTime(dateFormat.parse(couponTimeStr));
					}

					merchGoodsService.updateScenicGoods(goodsScenic);

					map.put("fromId", goods.getId());
					commonUploadService.deleteAllPhoto(map);

					String[] urlArr = url.split(",");
					PageData urlMap = new PageData();
					urlMap.put("picType", "banner");
					urlMap.put("fromId", goods.getId());
					urlMap.put("picFrom", goods.getGoodsType() + "Goods");
					for (String urlItem : urlArr) {
						urlMap.put("picUrl", urlItem);
						commonUploadService.savePhotoUrl(urlMap);
					}
				} else {// 新加
					goods.setNumber("lk" + timestampFormat.format(new Date()));

					merchGoodsService.saveGoods(goods);
					goodsScenic.setGoodsId(goods.getId());
					if (!ValidateHelper.isNullOrEmpty(periodTime)
							&& !ValidateHelper.isNullOrEmpty(timeStartStr)
							&& !ValidateHelper.isNullOrEmpty(timeEndStr)) {
						String[] periodTimeArr = periodTime.split("to");
						periodStartTime = dateFormat.parse(periodTimeArr[0]);
						periodEndTime = dateFormat.parse(periodTimeArr[1]);
						goodsScenic.setPeriodStart(periodStartTime);
						goodsScenic.setPeriodEnd(periodEndTime);
						goodsScenic.setTimeStart(timeFormat.parse(timeStartStr));
						goodsScenic.setTimeEnd(timeFormat.parse(timeEndStr));
						goodsScenic.setCouponTime(dateFormat.parse(couponTimeStr));
					}

					merchGoodsService.saveScenicGoods(goodsScenic);

					String[] urlArr = url.split(",");
					PageData urlMap = new PageData();
					urlMap.put("picType", "banner");
					urlMap.put("fromId", goods.getId());
					urlMap.put("picFrom", goods.getGoodsType() + "Goods");
					for (String urlItem : urlArr) {
						urlMap.put("picUrl", urlItem);
						commonUploadService.savePhotoUrl(urlMap);
					}
				}
			}

			map.put(XConst.STATUS_KEY, XConst.SUCCESS);
		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 保存景区商品信息
	 * 
	 * @param goods
	 * @param goodsScenic
	 * @param url
	 * @param periodTime
	 * @return
	 */
	@RequestMapping(value = "submitHotelProduct", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitHotelProduct(MerchGoods goods, MerchGoodsHotel goodsHotel, String url,
			String timeStartStr, String timeEndStr, Long goodsHotelId, Long goodsId) {
		PageData map = new PageData();
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);

			goods.setMerchUserId(merchUser.getId());
			goods.setGoodsType(getMerchTypeString(merchUser));
			if (!ValidateHelper.isNullOrEmpty(timeStartStr) && !ValidateHelper.isNullOrEmpty(timeEndStr)) {
				if (goodsHotelId != null && goodsId != null) {// 更新
					goods.setId(goodsId);
					goodsHotel.setId(goodsHotelId);
					merchGoodsService.updateGoods(goods);
					goodsHotel.setTimeStart(timeFormat.parse(timeStartStr));
					goodsHotel.setTimeEnd(timeFormat.parse(timeEndStr));

					merchGoodsService.updateHotelGoods(goodsHotel);

					map.put("fromId", goods.getId());
					commonUploadService.deleteAllPhoto(map);

				} else {// 新加
					goods.setNumber("lk" + timestampFormat.format(new Date()));

					merchGoodsService.saveGoods(goods);
					goodsHotel.setGoodsId(goods.getId());
					goodsHotel.setTimeStart(timeFormat.parse(timeStartStr));
					goodsHotel.setTimeEnd(timeFormat.parse(timeEndStr));

					merchGoodsService.saveHotelGoods(goodsHotel);

				}
				String[] urlArr = url.split(",");// 处理上传的图片
				PageData urlMap = new PageData();
				urlMap.put("picType", "banner");
				urlMap.put("fromId", goods.getId());
				urlMap.put("picFrom", goods.getGoodsType() + "Goods");
				for (String urlItem : urlArr) {
					urlMap.put("picUrl", urlItem);
					commonUploadService.savePhotoUrl(urlMap);
				}
				map.put(XConst.STATUS_KEY, XConst.SUCCESS);
			} else {
				map.put(XConst.STATUS_KEY, XConst.ERROR);
			}

		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 保存餐饮商户
	 * 
	 * @param goods
	 * @param goodsCater
	 * @param url
	 * @param goodsId
	 * @param goodsCaterId
	 * @return
	 */
	@RequestMapping(value = "submitCaterProduct", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitCaterProduct(MerchGoods goods, MerchGoodsCater goodsCater, String url,
			Long goodsId, Long goodsCaterId) {
		PageData map = new PageData();
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);

			goods.setMerchUserId(merchUser.getId());
			goods.setGoodsType(getMerchTypeString(merchUser));
			if (goodsCaterId != null && goodsId != null) {// 更新
				goods.setId(goodsId);
				goodsCater.setId(goodsCaterId);
				merchGoodsService.updateGoods(goods);

				merchGoodsService.updateCaterGoods(goodsCater);

				map.put("fromId", goods.getId());
				commonUploadService.deleteAllPhoto(map);

			} else {// 新加
				goods.setNumber("lk" + timestampFormat.format(new Date()));

				merchGoodsService.saveGoods(goods);
				goodsCater.setGoodsId(goods.getId());

				merchGoodsService.saveCaterGoods(goodsCater);

			}
			String[] urlArr = url.split(",");// 处理上传的图片
			PageData urlMap = new PageData();
			urlMap.put("picType", "banner");
			urlMap.put("fromId", goods.getId());
			urlMap.put("picFrom", goods.getGoodsType() + "Goods");
			for (String urlItem : urlArr) {
				urlMap.put("picUrl", urlItem);
				commonUploadService.savePhotoUrl(urlMap);
			}
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);

		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 
	 * 保存装备商品
	 * 
	 * @param goods
	 * @param spec
	 * @param originalPrice
	 * @param currentPrice
	 * @param volume
	 * @param url
	 * @param goodsId
	 * @return
	 */
	@RequestMapping(value = "submitEquipProduct", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitEquipProduct(MerchGoods goods, String spec, String originalPrice,
			String currentPrice, String volume, String url, Long goodsId) {
		PageData map = new PageData();
		try {
			SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
			map.put("id", sysset.getU().getId());
			MerchUser merchUser = merchUserService.findMerchUser(map);

			goods.setMerchUserId(merchUser.getId());
			goods.setGoodsType(getMerchTypeString(merchUser));
			String[] specArr=spec.split(",");
			String[] originalPriceArr=originalPrice.split(",");
			String[] currentPriceArr=currentPrice.split(",");
			String[] volumeArr=volume.split(",");
			MerchGoodsEquip goodsEquip=new MerchGoodsEquip();
			if (!ValidateHelper.isNullOrEmpty(goodsId)) {// 更新
				goods.setId(goodsId);
				//goodsEquip.setId(goodsEquipId);
				merchGoodsService.updateGoods(goods);
				
				
				
				map.put("fromId", goods.getId());
				
				merchGoodsService.deleteEquipGoods(goods.getId());
				
				commonUploadService.deleteAllPhoto(map);

			} else {// 新加
				goods.setNumber("lk" + timestampFormat.format(new Date()));

				merchGoodsService.saveGoods(goods);
				goodsEquip.setGoodsId(goods.getId());


			}
			
			goodsEquip.setGoodsId(goods.getId());
			for (int i = 0; i < specArr.length; i++) {
				goodsEquip.setSpec(specArr[i]);
				goodsEquip.setOriginalPrice(Double.parseDouble(originalPriceArr[i]));
				goodsEquip.setCurrentPrice(Double.parseDouble(currentPriceArr[i]));
				goodsEquip.setVolume(Integer.parseInt(volumeArr[i]));
				merchGoodsService.saveEquipGoods(goodsEquip);
			}
			
			String[] urlArr = url.split(",");// 处理上传的图片
			PageData urlMap = new PageData();
			urlMap.put("picType", "banner");
			urlMap.put("fromId", goods.getId());
			urlMap.put("picFrom", goods.getGoodsType() + "Goods");
			for (String urlItem : urlArr) {
				urlMap.put("picUrl", urlItem);
				commonUploadService.savePhotoUrl(urlMap);
			}
			map.put(XConst.STATUS_KEY, XConst.SUCCESS);

		} catch (Exception e) {
			map.put(XConst.STATUS_KEY, XConst.ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="getScenicDest",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData getScenicDest(Long id){
		PageData map=new PageData();
		try {
			List<PageData> list=merchScenidDest.getListByCityId(id);
			map.put("list", list);
			map.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			map.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return map;
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

	@Override
	protected String getMenuKey() {
		return null;
	}

	public static void main(String[] args) {
		String test = "123,123,,,,";
		String[] arr = test.split(",");
		System.out.println(arr);
	}

}
