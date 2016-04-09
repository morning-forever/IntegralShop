package com.bm.webs.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebSimpleEquip;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 装备分类Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebSimpleEquipService {

	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<WebSimpleEquip> allList() throws Exception{
		return (List<WebSimpleEquip>) dao.findForList("WebSimpleEquipService.allList", new PageData());
	}
	
}
