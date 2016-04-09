package com.bm.webs.service.system.urrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminMenuRight;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("menuRightService")
public class MenuRightService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public List<AdminMenuRight> getListByKeyOrModel(PageData pageData) throws Exception {
		return (List<AdminMenuRight>) dao.findForList("SysmenuRightMapper.getListByKeyOrModel", pageData);
	}

}
