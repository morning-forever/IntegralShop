package com.bm.webs.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;
import com.bm.webs.service.common.CommonUploadService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebEvaluataService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Autowired
	private CommonUploadService commonUploadService;// 图片上传

	/**
	 * 
	 * 查询商户评价列表
	 * 
	 * @param map
	 * 
	 * @param id
	 * @param goodsName
	 * @param upperLimit
	 * @param downLimit
	 * @param merchTypeString
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findMerchEvaluataList(PageData map, Long id, String goodsType, String goodsName,
			Long downLimit, Long upperLimit) throws Exception {
		map.put("id", id);
		map.put("goodsType", goodsType);
		map.put("goodsName", goodsName);
		map.put("downLimit", downLimit);
		map.put("upperLimit", upperLimit);
		Long total = (Long) dao.findForObject("WebEvaluataMapper.findMerchEvaluataCount", map);
		map.put("recordsTotal", total);
		map.put("recordsFiltered", total);
		return (List<PageData>) dao.findForList("WebEvaluataMapper.findMerchEvaluataList", map);
	}

	public List<PageData> findGoodsEvaluataList(PageData map, String goodsType, Long goodsId,
			String nickName, String comment, String startTime, String endTime) throws Exception {
		map.put("goodsId", goodsId);
		map.put("goodsType", goodsType);
		map.put("nickName", nickName);
		map.put("comment", comment);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		Long total = (Long) dao.findForObject("WebEvaluataMapper.findGoodsEvaluataCount", map);
		map.put("recordsTotal", total);
		map.put("recordsFiltered", total);
		return (List<PageData>) dao.findForList("WebEvaluataMapper.findGoodsEvaluataList", map);
	}

	public void deleteEvals(String ids) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ids", ids);
		dao.update("WebEvaluataMapper.deleteEvals", map);
	}
	
	/**
	 * app 得到商品的所有评价
	 * @param fromType
	 * @param goodsId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAppEvaluateList(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("WebEvaluataMapper.findEvaluateList", param);
	}
	
	/**
	 * pc 得到商品评价列表 分页
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findPCEvaluateList(PageData param) throws Exception {
		PageData res = new PageData();
		int pageSize = 5;
		param.put("fromType", "depth");
		param.put("goodsId", param.getLong("depthId"));
		Long total = (Long) dao.findForObject("WebEvaluataMapper.findEvaluateListTotal", param);
		Long totalPage = total % pageSize == 0 ? total / pageSize : total  / pageSize + 1;
		Long pageNo = (HString.isEmpty(param.getLong("pageNo")) ? 1 : param.getLong("pageNo"));
		param.put("startLine", (pageNo - 1) * pageSize);
		param.put("showLine", pageSize);
		List<PageData> list = (List<PageData>) dao.findForList("WebEvaluataMapper.findEvaluateList", param);
		if (!HString.isEmpty(list)) {
			for (PageData evaluate : list) {
				String id = evaluate.getString("id");
				List<PageData> photoList = commonUploadService.listUpload(
						"evaluate", "depth", id);
				evaluate.put("photoList", photoList);
			}
			res.put("list", list);
			res.putStatus(XConst.SUCCESS);
		}
		res.put("totalPage", totalPage);
		res.put("pageNo", param.getLong("pageNo"));
		return res;
	}
	
	/**
	 * 新增一条评论
	 * @param param
	 * @throws Exception
	 */
	public PageData saveEvaluate(PageData param) throws Exception {
		PageData res = new PageData();
		PageData orderData = new PageData();
		orderData.put("id", param.getLong("orderId"));//订单id
		int count = (Integer)dao.findForObject("WebOrderMapper.checkIsEvaluate", orderData);
		//未评价过则新增评价
		if(count == 0){
			//新增评价
			param.put("fromId", param.getLong("goodsId"));//来自的表id
			dao.save("WebEvaluataMapper.addEvaluate", param);
			//上传图片
			if(!ValidateHelper.isNullOrEmpty(param.getString("url"))){
				PageData picData = new PageData();
				String url = param.getString("url");
				String[] urlArr = url.split(",");
				picData.put("picFrom", "evaluate");
				picData.put("picType", param.get("picType"));
				picData.put("fromId", param.getLong("evaluateId"));//图片来自的表id
				for (int i = 0; i < urlArr.length; i++) {//保存图片
					if(!"".equals(urlArr[i])){
						picData.put("picUrl", urlArr[i]);//图片路径
						dao.save("CommonUploadMapper.savePhotoUrl", picData);
					}
				}
			}
			//修改订单的评价状态
			dao.save("WebOrderMapper.updateOrderEvaluate", orderData);
			res.putStatus(XConst.SUCCESS);
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
		}
		//已评价过则返回已存在
		else{
			res.putStatus(XConst.EXISTS);
			res.putMessage(XConst.EXISTS);
		}
		return res;
	}
	
	/**
	 * 获取后台评价列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminEvaluateList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebEvaluataMapper.findAdminEvaluateListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("WebEvaluataMapper.findAdminEvaluateList", param);
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取后台具体深度游评价列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findAdminDepthEvaluateList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("WebEvaluataMapper.findAdminDepthEvaluateListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("WebEvaluataMapper.findAdminDepthEvaluateList", param);
		param.put("data", list);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 删除某条评价
	 * @param id
	 * @throws Exception
	 */
	public void deleteEvaluate(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		dao.save("WebEvaluataMapper.deleteEvaluate", param);
	}
	
	/**
	 * 删除某个深度游的所有评价
	 * @param id
	 * @throws Exception
	 */
	public void deleteByDepth(Long fromId) throws Exception {
		PageData param = new PageData();
		param.put("fromId", fromId);
		dao.save("WebEvaluataMapper.deleteByDepth", param);
	}

}
