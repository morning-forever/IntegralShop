package com.bm.webs.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * app 版本管理
 * 
 * @author mike <br>
 *         2015年10月27日
 */
@Service
@Transactional
public class AppVersionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 获取是新版本
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData findAppNewVersion(String type) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		PageData data = (PageData) dao.findForObject("AppVersionMapper.findAppNewVersion", type);
		if (!HString.isEmpty(data)) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("version", data);
		}
		return res;
	}

	public PageData findVersionList(PageData param) throws Exception {
		Integer total = (Integer) dao.findForObject("AppVersionMapper.findVersionListCount", param);
		param.put("data", dao.findForList("AppVersionMapper.findVersionList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	public PageData detail(PageData param) throws Exception {
		return (PageData) dao.findForObject("AppVersionMapper.detail", param);
	}

	public boolean updateVersion(PageData param) throws Exception {
		Integer count = (Integer) dao.findForObject("AppVersionMapper.checkVersion", param);
		if (count < 1) {
			dao.update("AppVersionMapper.updateVersion", param);
			return true;
		}
		return false;
	}

	public boolean addVersion(PageData param) throws Exception {
		Integer count = (Integer) dao.findForObject("AppVersionMapper.checkVersion", param);
		if (count < 1) {
			dao.save("AppVersionMapper.addVersion", param);
			return true;
		}
		return false;
	}

	public boolean delVersion(PageData param) throws Exception {
		dao.findForObject("AppVersionMapper.delVersion", param);
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<PageData> selectVersionList() throws Exception {
		return (List<PageData>) dao.findForList("AppVersionMapper.selectVersionList", null);
	}

}
