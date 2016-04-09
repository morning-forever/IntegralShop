package com.bm.webs.service.depth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 主题深度游-行程Service
 * 
 * @author jiangl
 * 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebDepthTripService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 根据深度游id获取行程列表
	 * @param depthId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTripListByDepthId(Long depthId) throws Exception{
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (List<PageData>)dao.findForList("WebDepthTripMapper.getTripListByDepthId", param);
	}
	
	/**
	 * 根据行程id获取行程地点
	 * @param tripId
	 * @return
	 * @throws Exception
	 */
	public String getTripAddrsByTripId(Long tripId) throws Exception{
		PageData param = new PageData();
		param.put("tripId", tripId);
		return (String)dao.findForObject("WebDepthTripMapper.getTripAddrsByTripId", param);
	}
	
	public List<PageData> getTripTrafficByTripId(Long tripId) throws Exception{
		PageData param = new PageData();
		param.put("tripId", tripId);
		return (List<PageData>)dao.findForList("WebDepthTripMapper.getTripTrafficByTripId", param);
	}
	
	/**
	 * 根据行程id获取行程交通列表
	 * @param tripId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTripAddrsListByTripId(Long tripId) throws Exception{
		PageData param = new PageData();
		param.put("tripId", tripId);
		return (List<PageData>)dao.findForList("WebDepthTripMapper.getTripAddrsListByTripId", param);
	}
	
	/**
	 * 根据行程id获取行程图片列表
	 * @param tripId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTripImgByTripId(Long tripId) throws Exception{
		PageData param = new PageData();
		param.put("tripId", tripId);
		return (List<PageData>)dao.findForList("WebDepthTripMapper.getTripImgByTripId", param);
	}
	
	/**
	 * 获取app端交通，保证字段与图片list的一致
	 * @param tripId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAppTrafficByTripId(Long tripId) throws Exception{
		PageData param = new PageData();
		param.put("tripId", tripId);
		return (List<PageData>)dao.findForList("WebDepthTripMapper.getAppTrafficByTripId", param);
	}
	
	/**
	 * 保存行程
	 * @throws Exception
	 */
	public void saveTrip(PageData param) throws Exception{
		Long depthId = param.getLong("depthId");
		//行程图片
		//先删除图片
		PageData deUploadData = new PageData();
		deUploadData.put("from", "depth");
		deUploadData.put("fromId", depthId);
		//网页端图片
		deUploadData.put("type", "webTrip");
		dao.save("CommonUploadMapper.delPics", deUploadData);
		//app端图片
		deUploadData.put("type", "appTrip");
		dao.save("CommonUploadMapper.delPics", deUploadData);
		
		//再保存图片
		PageData uploadData = new PageData();
		uploadData.put("picFrom", "depth");
		uploadData.put("fromId", depthId);
		//网页端图片
		uploadData.put("picType", "webTrip");
		uploadData.put("picUrl", param.get("webTripUrl"));
		dao.save("CommonUploadMapper.savePhotoUrl", uploadData);
		//app端图片
		uploadData.put("picType", "appTrip");
		uploadData.put("picUrl", param.get("appTripUrl"));
		dao.save("CommonUploadMapper.savePhotoUrl", uploadData);
		
		//行程中的餐饮，酒店，景点图片
		deUploadData.clear();
		deUploadData.put("from", "depthTrip");
		deUploadData.put("type", "detail");
		dao.save("WebDepthTripMapper.deleteTripImg", deUploadData);//删除图片
		
		PageData delData = new PageData();
		String [] tripIdArr = param.getString("tripIds").split(",");
		for (String tripId : tripIdArr) {
			delData.put("tripId", Long.valueOf(tripId));
			dao.save("WebDepthTripMapper.deleteTripAddr", delData);//删除地址
			dao.save("WebDepthTripMapper.deleteTripTraffic", delData);//删除交通
			dao.save("WebDepthTripMapper.deleteTripImg", delData);//删除图片
		}
		
		//新增部分
		//行程地址
		PageData addrData = new PageData();
		JSONObject addrJson = JSONObject.parseObject(param.getString("addrData"));
		JSONArray addrArray = addrJson.getJSONArray("data");
		for (int i = 0; i < addrArray.size(); i++) {
			JSONObject jsonObject = addrArray.getJSONObject(i);
			addrData.put("tripId", jsonObject.get("tripId"));
			addrData.put("tripAddr", jsonObject.get("tripAddr"));
			addrData.put("tripOrder", jsonObject.get("tripOrder"));
			dao.save("WebDepthTripMapper.addTripAddr", addrData);
		}
		
		//交通
		PageData trafficData = new PageData();
		JSONObject trafficJson = JSONObject.parseObject(param.getString("trafficData"));
		JSONArray trafficArray = trafficJson.getJSONArray("data");
		for (int i = 0; i < trafficArray.size(); i++) {
			JSONObject jsonObject = trafficArray.getJSONObject(i);
			trafficData.put("tripId", jsonObject.get("tripId"));
			trafficData.put("toolId", jsonObject.get("toolId"));
			trafficData.put("usedHour", jsonObject.get("usedHour"));
			trafficData.put("usedMinute", jsonObject.get("usedMinute"));
			trafficData.put("toolOrder", jsonObject.get("toolOrder"));
			dao.save("WebDepthTripMapper.addTripTraffic", trafficData);
		}
		
		//图片
		PageData imgData = new PageData();
		JSONObject imgJson = JSONObject.parseObject(param.getString("imgData"));
		JSONArray imgArray = imgJson.getJSONArray("data");
		for (int i = 0; i < imgArray.size(); i++) {
			JSONObject jsonObject = imgArray.getJSONObject(i);
			imgData.put("tripId", jsonObject.get("tripId"));
			imgData.put("picType", jsonObject.get("imgType"));
			imgData.put("usedHour", jsonObject.get("usedHour"));
			imgData.put("usedMinute", jsonObject.get("usedMinute"));
			imgData.put("remark", jsonObject.get("remark"));
			imgData.put("imgOrder", jsonObject.get("imgOrder"));
			dao.save("WebDepthTripMapper.addTripImg", imgData);
			Long imgId = imgData.getLong("imgId");//返回刚新增的id
			
			//保存图片
			uploadData.clear();
			uploadData.put("picFrom", "depthTrip");
			uploadData.put("picType", "detail");
			uploadData.put("fromId", imgId);
			uploadData.put("picUrl", jsonObject.get("url"));
			dao.save("CommonUploadMapper.savePhotoUrl", uploadData);
		}
	}
	
}
