package com.bm.webs.service.depth;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebDepth;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 主题深度游Service
 * 
 * @author jiangl 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebDepthService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 返回列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<WebDepth> findWebDepthListPage(PageData page) throws Exception {
		return (List<WebDepth>) dao.findForList(
				"WebDepthMapper.findWebDepthListPage", page);
	}

	/**
	 * 获取数据总数
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("WebDepthMapper.getResultNum", page);
	}

	/**
	 * 获取深度游天数列表 app和pc端
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dayList() throws Exception {
		return (List<PageData>) dao.findForList("WebDepthMapper.dayList",new PageData());
	}
	
	/**
	 * app和pc端 获取6个推荐
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getRecommendList(String picType, Long userId) throws Exception {
		PageData param = new PageData();
		param.put("picType", picType);
		if(ValidateHelper.isNullOrEmpty(userId)){
			userId = Long.valueOf(0);
		}
		param.put("userId", userId);
		return (List<PageData>) dao.findForList("WebDepthMapper.getRecommendList",param);
	}

	/**
	 * 获取深度游列表 app端
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAppDepthList(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("WebDepthMapper.getDepthList",
				param);
	}
	
	/**
	 * 获取深度游列表 pc端
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getPCDepthList(PageData param) throws Exception {
		PageData res = new PageData();
		int pageSize = 16;
		param.put("picType", "webCover");//网页端封面图片
		Long total = (Long) dao.findForObject("WebDepthMapper.getDepthListTotal", param);
		Long totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		Long pageNo = (HString.isEmpty(param.getLong("pageNo")) ? 1 : param.getLong("pageNo"));
		param.put("startLine", (pageNo - 1) * pageSize);
		param.put("showLine", pageSize);
		List<PageData> list = (List<PageData>) dao.findForList("WebDepthMapper.getDepthList", param);
		if (!HString.isEmpty(list)) {
			res.put("list", list);
			res.putStatus(XConst.SUCCESS);
		}
		res.put("totalPage", totalPage);
		res.put("pageNo", param.getLong("pageNo"));
		return res;
	}
	
	/**
	 * 后台 获取深度游列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminDepthList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebDepthMapper.getAdminDepthListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("WebDepthMapper.getAdminDepthList", param);
		for (PageData pageData : list) {
			pageData.put("addrNames", findAddrNames(pageData.getLong("id")));
			pageData.put("subjectNames", findSubjectNames(pageData.getLong("id")));
		}
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 根据id获取深度游详情 app和pc端
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getDepthById(PageData param) throws Exception {
		if(ValidateHelper.isNullOrEmpty(param.get("userId"))){
			param.put("userId", 0);
		}
		return (PageData) dao.findForObject("WebDepthMapper.getDepthById",
				param);
	}
	
	/**
	 * 后台 根据id获取深度游详情
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminDepthById(Long depthId) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (PageData) dao.findForObject("WebDepthMapper.findAdminDepthById",
				param);
	}
	
	/**
	 * 获取具体深度游的所在地名称拼接的字符串
	 * @param depthId
	 * @return
	 * @throws Exception
	 */
	public String findAddrNames(Long depthId) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (String) dao.findForObject("WebDepthMapper.findAddrNamesByDepthId",param);
	}
	
	/**
	 * 获取具体深度游的主题名称拼接的字符串
	 * @param depthId
	 * @return
	 * @throws Exception
	 */
	public String findSubjectNames(Long depthId) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (String) dao.findForObject("WebDepthMapper.findSubjectNamesByDepthId",param);
	}
	
	/**
	 * pc端和app端 获取深度游收藏列表
	 * @param userId
	 * @param picType
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findDepthCollection(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("WebDepthMapper.findDepthCollection",param);
	}
	
	/**
	 * 获取所有的交通工具方式列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findToolList() throws Exception {
		return (List<PageData>) dao.findForList("WebDepthMapper.findToolList", new PageData());
	}
	
	/**
	 * 删除深度游
	 * @param depthId
	 * @throws Exception
	 */
	public void deleteDepth(Long depthId) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		dao.save("WebDepthMapper.deleteDepth", param);
	}
	
	/**
	 * 上架和下架
	 * @param depthId
	 * @param isShelves
	 * @throws Exception
	 */
	public void onOffLine(Long depthId, Long isShelves) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		param.put("isShelves", isShelves);
		dao.save("WebDepthMapper.onOffLine", param);
	}
	
	/**
	 * 获取所有未评价过的，且当前时间大于出发时间，即可以评价的订单列表，消息通知时用到
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCommentOrderList() throws Exception {
		return (List<PageData>)dao.findForList("WebDepthMapper.findCommentOrderList", new PageData());
	}
	
	/**
	 * 提交订单
	 * 
	 * @param param
	 * @throws Exception
	 */
	public void saveOrder(PageData param) throws Exception {
		
		Date time = new Date();
		
		// 新增订单表
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(time)
				+ param.get("userId")
				+ String.format("%03d", new Random().nextInt(1000));
		
		param.put("orderCode", orderCode);// 订单编号
		param.put("orderType", "depth");//订单类型
		dao.save("WebOrderMapper.insertOrderForm", param);

		// 新增深度游订单表
		dao.save("WebDepthMapper.insertDepthOrder", param);

		// 新增订单条目表
		param.put("goodsCount", 1);
		dao.save("WebOrderMapper.insertOrderItem", param);
		// 新增订单条目使用人表
		PageData personData = new PageData();
		JSONObject json = JSONObject.parseObject(param.getString("jsonData"));
		JSONArray jsonArray = json.getJSONArray("data");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			personData.clear();
			personData.put("orderItemId", param.getLong("orderItemId"));
			personData.put("personName", jsonObject.get("personName"));
			personData.put("personType", jsonObject.get("personType"));
			personData.put("cardNo", jsonObject.get("cardNo"));
			personData.put("cardType", jsonObject.get("cardType"));
			personData.put("personPhone", jsonObject.get("personPhone"));
			dao.save("WebOrderMapper.insertOrderItemPerson", personData);
		}
		
		//发送通知邮件
//		SimpleMailSender.sendNoticeEmail(orderCode);
		
		SimpleMailSender.sendNoticeEmail(orderCode,
				param.getString("nickname"), 
				"主题深度游",
				new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(time));
		
	}
	
	/**
	 * 修改点击量+1
	 */
	public void updateClickNum(Long depthId) throws Exception {
		PageData param = new PageData();
		param.put("depthId", depthId);
		dao.save("WebDepthMapper.updateClickNum",param);
	}
	
	/**
	 * 保存深度游详情
	 * @param param
	 * @throws Exception
	 */
	public void saveDepth(PageData param) throws Exception {
		Long depthId = param.getLong("depthId");//深度游id
		//新增
		if(ValidateHelper.isNullOrEmpty(depthId)){
			dao.save("WebDepthMapper.insert", param);
			depthId = param.getLong("depthId");
			
			//行程表
			PageData tripData = new PageData();
			tripData.put("depthId", depthId);//所属深度游id
			Long day = param.getLong("days");//行程天数
			for (int i = 0; i < day; i++) {
				tripData.put("currentDay", i);//当前天数，从0开始
				if(i == 0){
					tripData.put("dayType", "start");
				}else if(i == (day - 1)){
					tripData.put("dayType", "end");
				}else{
					tripData.put("dayType", "ing");
				}
				dao.save("WebDepthTripMapper.addTrip", tripData);
			}
		}
		//编辑
		else {
			
			//如果行程天数未改变，则不删除行程表
			PageData depth = (PageData)dao.findForObject("WebDepthMapper.findAdminDepthById", param);
			//只有当行程天数改变时，才重新更新行程表
			if(depth.getLong("days") != param.getLong("days")){
				//先删除行程相关表
				dao.save("WebDepthTripMapper.deleteTrip", param);//行程主表
				//行程表
				PageData tripData = new PageData();
				tripData.put("depthId", depthId);//所属深度游id
				Long day = param.getLong("days");//行程天数
				for (int i = 0; i < day; i++) {
					tripData.put("currentDay", i);//当前天数，从0开始
					if(i == 0){
						tripData.put("dayType", "start");
					}else if(i == (day - 1)){
						tripData.put("dayType", "end");
					}else{
						tripData.put("dayType", "ing");
					}
					dao.save("WebDepthTripMapper.addTrip", tripData);
				}
			}
			
			//更新深度游
			dao.save("WebDepthMapper.update", param);
			
			//删除深度游所在地
			dao.save("WebDepthAddrMapper.delete", param);
			
			//删除深度游主题
			dao.save("WebDepthSubjectMapper.deleteDepthSubject", param);
			
			//删除价格包含
			dao.save("WebDepthPricesContainMapper.deletePriceContain", param);
			
			//删除日期价格
			dao.save("WebDepthPricesMapper.delete", param);
			
			//删除封面图片
			PageData deUploadData = new PageData();
			deUploadData.put("from", "depth");
			deUploadData.put("fromId", depthId);
			deUploadData.put("type", "webCover");
			dao.save("CommonUploadMapper.delPics", deUploadData);
			deUploadData.put("type", "appCover");
			dao.save("CommonUploadMapper.delPics", deUploadData);
			
		}
		
		//新增深度游所在地
		PageData addrData = new PageData();
		addrData.put("depthId", depthId);
		if(!HString.isEmpty(param.getString("cityIds"))){
			String [] cityIdArr = param.getString("cityIds").split(",");
			for (String cityId : cityIdArr) {
				addrData.put("addrId", cityId);
				dao.save("WebDepthAddrMapper.insert", addrData);
			}
		}
		
		//新增深度游主题
		PageData subjectData = new PageData();
		subjectData.put("depthId", depthId);
		if(!HString.isEmpty(param.getString("subjectIds"))){
			String [] subjectIdArr = param.getString("subjectIds").split(",");
			for (String subjectId : subjectIdArr) {
				subjectData.put("subjectId", subjectId);
				dao.save("WebDepthSubjectMapper.insertDepthSubject", subjectData);
			}
		}
		
		//新增价格包含
		PageData containData = new PageData();
		//交通
		containData.put("depthId", depthId);//所在深度游id
		JSONObject trafficJson = JSONObject.parseObject(param.getString("trafficData"));
		JSONArray trafficArray = trafficJson.getJSONArray("data");
		for (int i = 0; i < trafficArray.size(); i++) {
			JSONObject jsonObject = trafficArray.getJSONObject(i);
			containData.put("containType", "traffic");
			containData.put("fromAddr", jsonObject.get("fromAddr"));
			containData.put("toAddr", jsonObject.get("toAddr"));
			dao.save("WebDepthPricesContainMapper.addPriceContain", containData);
		}
		containData.clear();
		
		//酒店
		containData.put("depthId", depthId);//所在深度游id
		JSONObject hotelJson = JSONObject.parseObject(param.getString("hotelData"));
		JSONArray hotelArray = hotelJson.getJSONArray("data");
		for (int i = 0; i < hotelArray.size(); i++) {
			JSONObject jsonObject = hotelArray.getJSONObject(i);
			containData.put("containType", "hotel");
			containData.put("checkDay", jsonObject.get("checkDay"));
			containData.put("checkHotel", jsonObject.get("checkHotel"));
			dao.save("WebDepthPricesContainMapper.addPriceContain", containData);
		}
		containData.clear();
		
		//观光
		containData.put("depthId", depthId);//所在深度游id
		JSONObject visitJson = JSONObject.parseObject(param.getString("visitData"));
		JSONArray visitArray = visitJson.getJSONArray("data");
		for (int i = 0; i < visitArray.size(); i++) {
			JSONObject jsonObject = visitArray.getJSONObject(i);
			containData.put("containType", "visit");
			containData.put("visit", jsonObject.get("visit"));
			containData.put("remark", jsonObject.get("remark"));
			dao.save("WebDepthPricesContainMapper.addPriceContain", containData);
		}
		containData.clear();
		
		//新增日期价格
		PageData datePriceData = new PageData();
		if(!HString.isEmpty(param.getString("priceTimes"))){
			String [] priceTimesArr = param.getString("priceTimes").split(",");
			String [] adultPricesArr = param.getString("adultPrices").split(",");
			String [] childPricesArr = param.getString("childPrices").split(",");
			String [] isOddsArr = param.getString("isOdds").split(",");
			for (int i = 0; i < priceTimesArr.length; i++) {
				datePriceData.clear();
				datePriceData.put("priceTime", new Date(Long.valueOf(priceTimesArr[i])));//价格时间
				datePriceData.put("adultPrice", adultPricesArr[i]);//成人价
				datePriceData.put("childPrice", childPricesArr[i]);//儿童价
				datePriceData.put("isOdds", Long.valueOf(isOddsArr[i]));//是否优惠
				datePriceData.put("depthId", depthId);//深度游id
				dao.save("WebDepthPricesMapper.insert", datePriceData);
			}
		}
		
		//图片上传
		PageData uploadData = new PageData();
		String url = param.getString("url");
		String [] urlArr = url.split(",");
		String picType = param.getString("picType");
		String [] picTypeArr = picType.split(",");
		uploadData.put("picFrom", "depth");
		uploadData.put("fromId", depthId);
		for (int i = 0; i < urlArr.length; i++) {//保存图片
			if(!"".equals(urlArr[i])){
				uploadData.put("picType", picTypeArr[i]);//图片类型
				uploadData.put("picUrl", urlArr[i]);//图片类型
				dao.save("CommonUploadMapper.savePhotoUrl", uploadData);
			}
		}
		
		
	}
}
