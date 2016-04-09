package com.bm.webs.service.depth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 主题深度游-亮点Service
 * 
 * @author jiangl
 * 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebDepthPointService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 根据深度游id获取亮点列表
	 * @param depthId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getPointListByDepthId(Long depthId) throws Exception{
		PageData param = new PageData();
		param.put("depthId", depthId);
		return (List<PageData>)dao.findForList("WebDepthPointMapper.getPointListByDepthId", param);
	}
	
	/**
	 * 根据亮点id获取亮点详情
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData getPointById(Long id) throws Exception{
		PageData param = new PageData();
		param.put("id", id);
		return (PageData)dao.findForObject("WebDepthPointMapper.getPointById", param);
	}
	
	/**
	 * 修改点击量+1
	 */
	public void updateClickNum(Long pointId) throws Exception {
		PageData param = new PageData();
		param.put("pointId", pointId);
		dao.save("WebDepthPointMapper.updateClickNum",param);
	}
	
	/**
	 * 后台 获取所有亮点列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminPointList(PageData param) throws Exception {
		PageData res = new PageData();
		Integer total = (Integer) dao.findForObject("WebDepthPointMapper.getAdminPointListCount", param);
		List<PageData> list = (List<PageData>)dao.findForList("WebDepthPointMapper.getAdminPointList", param);
		res.put("data", list);
		res.put("recordsTotal", total);
		res.put("recordsFiltered", total);
		return res;
	}
	
	
	/**
	 * 保存 新增或更新亮点
	 * @param param
	 * @throws Exception
	 */
	public void savePoint(PageData param) throws Exception {
		Long pointId = param.getLong("pointId");
		//新增
		if(ValidateHelper.isNullOrEmpty(pointId)){
			//新增亮点
			dao.save("WebDepthPointMapper.addPoint",param);
			pointId = param.getLong("pointId");//新增返回的id
		}
		//更新
		else{
			//更新亮点
			dao.update("WebDepthPointMapper.updatePoint",param);
			
			//删除图片
			PageData deUploadData = new PageData();
			deUploadData.put("from", "depthPoint");
			deUploadData.put("type", "cover");
			deUploadData.put("fromId", pointId);
			dao.save("CommonUploadMapper.delPics", deUploadData);
		}
		
		//新增图片
		PageData uploadData = new PageData();
		uploadData.put("picFrom", "depthPoint");
		uploadData.put("fromId", pointId);
		uploadData.put("picType", "cover");//图片类型
		uploadData.put("picUrl", param.get("url"));//图片路径
		dao.save("CommonUploadMapper.savePhotoUrl", uploadData);
	}
	
	/**
	 * 保存深度游对应的亮点
	 * @param depthId
	 * @param pointIds
	 * @throws Exception
	 */
	public PageData savePointCt(Long depthId, String pointIds) throws Exception {
		PageData res = new PageData();
		if(!HString.isEmpty(pointIds)){
			PageData param = new PageData();
			param.put("depthId", depthId);
			param.put("pointIds", pointIds);
			Integer count = (Integer)dao.findForObject("WebDepthPointMapper.checkIsHave", param);
			//如果该亮点已添加，则不能添加
			if(count == 0){
				String [] pointIdArr = pointIds.split(",");
				for (String pointId : pointIdArr) {
					param.put("pointId", pointId);	
					dao.save("WebDepthPointMapper.addPointCt", param);
					res.putStatus(XConst.SUCCESS);
				}
			}else{
				res.putStatus(XConst.EXISTS);
			}
		}
		return res;
	}
	
	/**
	 * 删除深度游对应的亮点
	 * @param pointCtId
	 * @throws Exception
	 */
	public void deletePointCt(Long pointCtId) throws Exception {
		PageData param = new PageData();
		param.put("pointCtId", pointCtId);
		dao.save("WebDepthPointMapper.deletePointCt", param);
	}
	
	/**
	 * 删除亮点
	 * @param pointId
	 * @throws Exception
	 */
	public void deletePoint(Long pointId) throws Exception {
		PageData param = new PageData();
		param.put("pointId", pointId);
		dao.save("WebDepthPointMapper.deletePoint", param);
	}
	
}
