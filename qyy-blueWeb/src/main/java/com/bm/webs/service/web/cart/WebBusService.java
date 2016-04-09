package com.bm.webs.service.web.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.OrderNoUtil;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;
import com.bm.webs.service.web.WebOrderService;

/**
 * 
 * 漫游商城-快旅班车Service
 * 
 * @author tangxh
 *         2015年9月9日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebBusService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	@Autowired
	private WebOrderService webOrderService;// 订单
	
	/**
	 * 获取班车列表
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getList(PageData params) throws Exception{
		return (List<PageData>) dao.findForList("WebBusMapper.getList", params);
	}
	
	public PageData getAppList(PageData params) throws Exception{
		PageData res = new PageData();
		res.putFlag(false);
		List<PageData> list = (List<PageData>) dao.findForList("WebBusMapper.getList", params);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putFlag(true);
			res.putData("busList", list);
			res.putData("thisPageSize", list.size());
		}
		return res;
	}
	
	/**
	 * 获取后台班车路线列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminRouteList(PageData pd) throws Exception{
		
		Integer total = (Integer) dao.findForObject("WebBusMapper.getAdminRouteResultNum", pd);
		pd.put("data", dao.findForList("WebBusMapper.getAdminRouteList", pd));
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return pd;
	}
	
	/**
	 * 获取后台班车车辆信息列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminBusList(PageData pd) throws Exception{
		
		Integer total = (Integer) dao.findForObject("WebBusMapper.getAdminBusResultNum", pd);
		pd.put("data", dao.findForList("WebBusMapper.getAdminBusList", pd));
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return pd;
	}
	
	/**
	 * 获取班车记录总数
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData pd) throws Exception{
		return (Integer) dao.findForObject("WebBusMapper.getResultNum", pd);
	}
	
	
	/**
	 * 获取班车详情
	 * @return
	 * @throws Exception
	 */
	public PageData findById(Long busId) throws Exception{
		return (PageData) dao.findForObject("WebBusMapper.findById", busId);
	}
	
	
	/**
	 * 获取后台班车车辆信息详情
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminById(Long id) throws Exception{
		PageData res = new PageData();
		res.put("id", id);
		return (PageData) dao.findForObject("WebBusMapper.findAdminById", res);
	}
	
	
	/**
	 * 获取后台班车路线信息详情
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminRouteById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("WebBusMapper.findAdminRouteById", pd);
	}
	
	/**
	 * 获取班车图片
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBusImageById(Long id) throws Exception{
		return (List<PageData>) dao.findForList("WebBusMapper.getBusImageById", id);
	}
	
	/**
	 * 获取班车车牌
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCarCardList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("WebBusMapper.getCarCardList", pd);
	}
	
	/**
	 * 获取班车车牌
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getFreeCardList() throws Exception{
		return (List<PageData>) dao.findForList("WebBusMapper.getFreeCardList", null);
	}
	
	/**
	 * 获取班车座位（去重）
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getBusSeatingList() throws Exception{
		return (List<PageData>) dao.findForList("WebBusMapper.getBusSeatingList", null);
	}
	
	/**
	 * 获取班车剩余座位
	 * @return
	 * @throws Exception
	 */
	public Integer getBusSeatingRemain(PageData pd) throws Exception{
		return (Integer) dao.findForObject("WebBusMapper.getBusSeatingRemain", pd);
	}
	
	/**
	 * 保存班车车辆
	 * @return
	 * @throws Exception
	 */
	public PageData saveBus(PageData pd) throws Exception{
		String[] cards = (String[]) pd.get("cards");
		
		if(!HString.isEmpty(pd.getString("carId"))){
			dao.update("WebCarMapper.updateCar", pd);
			for (String card : cards) {
				pd.put("carCard", card);
				List<PageData> list = getCarCardList(pd);
				if(list.size()<=0){
					dao.save("WebBusMapper.insertBus", pd);
				}
			}
			
			pd.put("fromId", pd.getString("carId"));
			dao.delete("CommonUploadMapper.delPics", pd);
			
			for (int i = 1; i <= 4; i++) {
				pd.put("picUrl", pd.getString("url"+i));
				pd.put("from", "bus");
				pd.put("fromId", pd.getString("carId"));
				if(i == 1)
					pd.put("type", "cover");
				else
					pd.put("type", "detail");
				
				dao.save("CommonUploadMapper.addUpload", pd);
			}
			pd.put(XConst.API_RETURN_STATUS_KEY, XConst.SUCCESS);
			
		}else{
			for (String card : cards) {
				pd.put("carCard", card);
				List<PageData> list = getCarCardList(pd);
				if(list.size()>0){
					pd.clear();
					pd.put(XConst.API_RETURN_MSG_KEY, "车牌号："+card+" 的车已存在！");
					pd.put(XConst.STATUS_KEY, "error");
					return pd;
				}
			}
			
			pd.put("carCard", "");
			pd.put("carType", "bus");
			dao.save("WebCarMapper.insertCar", pd);
			for (String card : cards) {
				pd.put("carCard", card);
				dao.save("WebBusMapper.insertBus", pd);
			}
			for (int i = 1; i <= 4; i++) {
				pd.put("picUrl", pd.getString("url"+i));
				pd.put("from", "bus");
				pd.put("fromId", pd.getString("carId"));
				if(i == 1)
					pd.put("type", "cover");
				else
					pd.put("type", "detail");
				
				dao.save("CommonUploadMapper.addUpload", pd);
			}
			pd.put(XConst.API_RETURN_STATUS_KEY, XConst.SUCCESS);
		}
		return pd;
	}
	
	/**
	 * 保存班车路线
	 * @return
	 * @throws Exception
	 */
	public PageData saveRoute(PageData pd) throws Exception{
		if(!HString.isEmpty(pd.getString("routeId"))){
			dao.update("WebCarRouteMapper.updateRoute", pd);
			pd.put(XConst.API_RETURN_STATUS_KEY, XConst.SUCCESS);
		}else{
			dao.save("WebCarRouteMapper.insertRoute", pd);
			pd.put(XConst.API_RETURN_STATUS_KEY, XConst.SUCCESS);
		}
		return pd;
	}
	
	/**
	 * 提交订单
	 * @param pd
	 * @throws Exception
	 */
	public Long submitOrder(PageData pd) throws Exception{
		
		PageData bus = findById(pd.getLong("goodsId"));
		Integer goodsCount = pd.getInt("goodsCount");
		Integer useCount = bus.getInt("use_count");
		Double safePrice = bus.getDouble("safe_price")*goodsCount;
		String orderNo= OrderNoUtil.getOrderNo();
		
		if("1".equals(pd.getString("isSafe"))){
			pd.put("safePrice", 0);
			pd.put("realPrice", bus.getDouble("price")*goodsCount);
		}else{
			pd.put("realPrice", bus.getDouble("price")*goodsCount+safePrice);
			pd.put("safePrice", safePrice);
		}
		
		pd.put("orderType", "bus");
		pd.put("orderCode", orderNo);
		pd.put("isInvoice", '1');
		// 添加基础订单信息
		webOrderService.insertOrderForm(pd);
		
		Long orderFormId = pd.getLong("orderFormId");
		
		// 添加Item信息
		webOrderService.insertOrderItem(pd);
		webOrderService.updateBusStartDate(pd);
		
		Long orderItemId = pd.getLong("orderItemId");
		
		String param = pd.getString("param");
		
		PageData map = new PageData();
		if(!HString.isEmpty(param)){
			JSONObject json  = JSONObject.parseObject(param);
			JSONArray jsonArray = json.getJSONArray("data");
			for (int i = 0; i < jsonArray.size(); i++) {
				
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				map.clear();
				map.put("orderItemId", orderItemId);
				map.put("personName", jsonObject.get("personName"));
				map.put("personType", jsonObject.get("personType"));
				map.put("cardNo", jsonObject.get("cardNo"));
				map.put("cardType", jsonObject.get("cardType"));
				map.put("personPhone", jsonObject.get("personPhone"));
				webOrderService.insertOrderItemPerson(map);
			}
			pd.put("useCount", useCount+jsonArray.size());
			pd.put("id", pd.getLong("goodsId"));
			dao.update("WebBusMapper.updateBus", pd);
			
		}
		//发送通知邮件
		SimpleMailSender.sendNoticeEmail(orderNo);
		
		return orderFormId;
	}	

	/**
	 * 
	 * 删除指定班车
	 * 
	 * @param ids
	 * @param type 
	 * @throws Exception 
	 */
	public void deletesbus(String ids, String type) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("type", type);
		dao.update("WebBusMapper.deletesBus", map);
	}
	
	/**
	 * 上架和下架
	 * @param param
	 * @throws Exception
	 */
	public void updateRouteShelves(PageData param) throws Exception {
		dao.update("WebCarRouteMapper.updateRouteShelves", param);
	}
	
	/**
	 * 
	 * 删除指定班车路线
	 * 
	 * @param ids
	 * @throws Exception 
	 */
	public void deletesRoute(String ids) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		dao.update("WebCarRouteMapper.deletesRoute", map);
	}
	
}
