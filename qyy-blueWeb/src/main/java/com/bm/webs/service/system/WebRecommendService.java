package com.bm.webs.service.system;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebRecommendService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 查询网页端显示List
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findWebList(PageData pd) throws Exception {
		Float total=(Float) dao.findForObject("WebRecommendMapper.findWebCount", pd);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("WebRecommendMapper.findWebList", pd);
	}

	/**
	 * 修改上下架状态
	 * @param pd
	 * @throws Exception 
	 */
	public void updateEnable(PageData pd) throws Exception {
		dao.update("WebRecommendMapper.updateEnable", pd);
	}

	/**
	 * 删除推荐
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteRecommend(PageData pd) throws Exception {
		dao.update("WebRecommendMapper.deleteRecommend", pd);
	}

	/**
	 * 添加推荐
	 * @param pd
	 * @throws Exception 
	 */
	public void insertRecommend(PageData pd) throws Exception {
		dao.save("WebRecommendMapper.insertRecommend", pd);
	}

	/**
	 * 验证同排序的推荐
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkRecommend(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebRecommendMapper.checkRecommend", pd);
	}

	/**
	 * 查询推荐详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findRecommendDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebRecommendMapper.findRecommendDetial", pd);
	}
	
	/**
	 * 查询 深度游推荐详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findDepthRecommendDetial(PageData param) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebRecommendMapper.findDepthRecommendDetial", param);
	}

	/**
	 * 修改推荐
	 * @param pd
	 * @throws Exception 
	 */
	public void updateRecommend(PageData pd) throws Exception {
		dao.update("WebRecommendMapper.updateRecommend", pd);
	}

	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findTravelsRecommendList(PageData param) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebRecommendMapper.findTravelsRecommendList", param);
	}

	
}
