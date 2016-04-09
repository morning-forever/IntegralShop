package com.bm.webs.service.system.urrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.webs.bean.system.AdminRight;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("rightService")
public class RightService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * @param rightKeys
	 * @return
	 * @throws Exception
	 */
	public List<AdminRight> getListRightKeys(List<String> rightKeys) throws Exception {
		return (List<AdminRight>) dao.findForList("SysrightMapper.getListRightKeys", rightKeys);
	}

}
