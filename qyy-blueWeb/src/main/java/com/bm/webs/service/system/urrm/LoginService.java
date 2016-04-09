package com.bm.webs.service.system.urrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.webs.bean.Page;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("loginService")
public class LoginService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * @param pageData
	 * @return
	 * @throws Exception
	 */
	public AdminLogin login(PageData pageData) throws Exception {
		return (AdminLogin) dao.findForObject("SysloginMapper.login", pageData);
	}

	/**
	 * 返回列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("SysloginMapper.datalistPage", page);
	}

	public Integer saveLogin(PageData pageData) throws Exception {
		return (Integer) dao.save("SysloginMapper.saveLogin", pageData);
	}

	public void updateLoginPwd(PageData pageData) throws Exception {
		dao.update("SysloginMapper.updateLoginPwd", pageData);
	}

	public void updateIsBan(PageData pageData) throws Exception {
		dao.update("SysloginMapper.updateIsBan", pageData);
	}

}
