package com.bm.webs.service.web.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 车辆规则
 * 
 * @author <br>
 *         2015年9月17日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional(rollbackFor = Exception.class)
public class WebCarRuleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回快旅首页的规则信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findListToIndex() throws Exception {
		return (List<PageData>) dao.findForList("WebCarRuleMapper.findList", null);
	}

	/**
	 * 根据类型查找规则
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findRuleByType(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebCarRuleMapper.findRuleByType", param);
	}

	/**
	 * 保存规则信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateCarRule(PageData param) throws Exception {
		Integer count = (Integer) dao.update("WebCarRuleMapper.updateCarRule", param);
		return count > 0;
	}

}
