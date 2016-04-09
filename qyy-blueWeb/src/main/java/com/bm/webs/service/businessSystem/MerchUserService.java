package com.bm.webs.service.businessSystem;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.MerchUser;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class MerchUserService {

	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 
	 * 更新商户信息
	 * 
	 * @param map
	 * @throws Exception 
	 */
	public void updateMerchUser(PageData map) throws Exception {
		dao.update("MerchUserMapper.updateMerchUser", map);
	}

	/**
	 * 
	 * 根据AdminId查询商户信息
	 * 
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public MerchUser findMerchUser(PageData map) throws Exception {
		return (MerchUser) dao.findForObject("MerchUserMapper.findMerchUser", map);
	}
	
	/**
	 * 获取商户列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData getMerchantList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("MerchUserMapper.findMerchUserList", param);
		Integer total = (Integer) dao.findForObject("MerchUserMapper.getResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	/**
	 * 
	 * 根据id查询商户信息
	 * 
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public PageData findById(PageData map) throws Exception {
		return (PageData) dao.findForObject("MerchUserMapper.findById", map);
	}
	
	/**
	 * 物理删除商户
	 * @param id
	 * @throws Exception
	 */
	public void updateDeleteStatus(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		dao.save("MerchUserMapper.updateDeleteStatus", param);
	}
	
	/**
	 * 根据id查询商户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findMerchUserById(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (PageData) dao.findForObject("MerchUserMapper.findMerchUserById", param);
	}
}
