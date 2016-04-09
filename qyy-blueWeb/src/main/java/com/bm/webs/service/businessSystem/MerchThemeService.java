package com.bm.webs.service.businessSystem;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchTheme;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 酒店主题Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchThemeService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	
	public List<MerchTheme> allList() throws Exception{
		return (List<MerchTheme>) dao.findForList("MerchThemeMapper.allList", new PageData());
	}
	
	/**
	 * 获取酒店主题列表
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminThemeList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchThemeMapper.getAdminThemeList", param);
		Integer total = (Integer) dao.findForObject("MerchThemeMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 获取酒店主题总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchThemeMapper.getAdminResultNum", page);
	}
	
	/**
	 * 根据id 获取酒店主题
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public PageData getById(Long id) throws Exception{
		return (PageData)dao.findForObject("MerchThemeMapper.getById", id);
	}
	
	/**
	 * 修改酒店主题
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("MerchThemeMapper.update", pd);
	}
	
	/**
	 * 删除酒店主题
	 * @param pageData
	 * @throws Exception
	 */
	public void delete(Long id) throws Exception {
		dao.delete("MerchThemeMapper.delete", id);
	}
	
	/**
	 * 新增酒店主题
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("MerchThemeMapper.insert", pd);
	}
	
}
