package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service
@Transactional
public class WebUserLevelService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 根据父id来查询
	 * 
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findList(Long parentId) throws Exception {
		PageData pd = new PageData();
		pd.put("parentId", parentId);
		return (List<PageData>) dao.findForList("WebUserLevelMapper.findList", pd);
	}

	/**
	 * 查询所有的等级列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData getAllList() throws Exception {
		List<PageData> parentList = findList(0l);
		PageData pd = new PageData();
		pd.put("parentList", parentList);
		for (PageData pageData : parentList) {
			Long id = (Long) pageData.get("id");
			List<PageData> subList = findList(id);
			pd.put(id, subList);
		}
		return pd;
	}

	/**
	 * 更新所有的等级列表
	 * 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public boolean update(List<PageData> params) throws Exception {
		int i = 0;
		for (PageData pageData : params) {
			dao.update("WebUserLevelMapper.updateLevel", pageData);
			i++;
		}
		if (params.size() == i)
			return true;
		return false;
	}

	/**
	 * 查询详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception {
		PageData pageData = new PageData();
		pageData.put("id", id);
		return (PageData) dao.findForObject("WebUserLevelMapper.getById", pageData);

	}

}
