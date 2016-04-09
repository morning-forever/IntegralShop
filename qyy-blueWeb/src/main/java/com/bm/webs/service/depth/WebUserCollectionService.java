package com.bm.webs.service.depth;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.CollectionItem;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 收藏Service
 * 
 * @author jiangl 2015年10月13日
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebUserCollectionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 新增一个收藏
	 * @param param
	 * @throws Exception
	 */
	public void insert(Long fromId, Long userId, String fromTable) throws Exception {
		PageData param = new PageData();
		param.put("fromId",fromId);
		param.put("userId",userId);
		param.put("fromTable",fromTable);
		dao.save("WebUserCollectionMapper.insert", param);
	}
	
	/**
	 * 取消一个收藏
	 * @param fromId
	 * @param userId
	 * @param fromTable
	 * @throws Exception
	 */
	public void delete(Long fromId, Long userId, String fromTable) throws Exception {
		PageData param = new PageData();
		param.put("fromId",fromId);
		param.put("userId",userId);
		param.put("fromTable",fromTable);
		dao.save("WebUserCollectionMapper.delete", param);
	}

	/**
	 * 查询是否已收藏
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkCollection(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebUserCollectionMapper.checkCollection", pd);
	}

		
	/**
	 * 查询已收藏文章
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findTravelsCollectionList(PageData pd) throws Exception {
		Integer total=(Integer) dao.findForObject("WebUserCollectionMapper.findTravelsCollectionCount", pd);
		Integer pageSize=pd.getInt("showLine");
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		pd.put("totalPage", total%pageSize==0?total/pageSize:total/pageSize+1);
		return (List<Map<String, Object>>) dao.findForList("WebUserCollectionMapper.findTravelsCollectionList", pd);
	}

	/**
	 * 查询已收藏数量
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public Long findCollectionCount(PageData param) throws Exception {
		return (Long) dao.findForObject("WebUserCollectionMapper.findAllCollectionCount", param);
	}

	/**
	 * 查询收藏主题深度游
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findDepthCollectionList(PageData pd) throws Exception {
		Integer total=(Integer) dao.findForObject("WebUserCollectionMapper.findDepthCollectionCount", pd);
		Integer pageSize=pd.getInt("showLine");
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		pd.put("totalPage", total%pageSize==0?total/pageSize:total/pageSize+1);
		return (List<Map<String, Object>>) dao.findForList("WebUserCollectionMapper.findDepthCollectionList", pd);
	}

	/**
	 * 查询所有订单列表
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public List<CollectionItem> findAllCollectionList(PageData param) throws Exception {
		return (List<CollectionItem>) dao.findForList("WebUserCollectionMapper.findAllCollectionList", param);
	}
}
