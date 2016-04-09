package com.bm.webs.service.web.center;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 帮助中心管理
 * 
 * @author mike <br>
 *         2015年10月22日
 */
@Service
@Transactional
public class WebHelperService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 帮助中心list
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData helperList(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		List<PageData> list = (List<PageData>) dao.findForList("WebHelperMapper.helperList", null);
		if (!HString.isEmpty(list)) {
			res.putFlag(true);
			res.putMessage(XConst.SUCCESS);
			res.putData("helpList", list);
		}
		return res;
	}

	@SuppressWarnings("unchecked")
	public PageData helperWebList(PageData param) throws Exception {
		PageData res = new PageData();
		res.putFlag(false);
		res.putMessage(XConst.FAIL);
		Long pageNo = param.getLong("pageNo");
		Long total = (Long) dao.findForObject("WebHelperMapper.helperWebListCount", param);
		Long totalPage = total % XConst.PAGE_SIZE == 0 ? total / XConst.PAGE_SIZE : total / XConst.PAGE_SIZE + 1;
		pageNo = (HString.isEmpty(pageNo) ? 1 : pageNo);
		param.put("startLine", (pageNo - 1) * XConst.PAGE_SIZE);
		param.put("showLine", XConst.PAGE_SIZE);
		List<PageData> list = (List<PageData>) dao.findForList("WebHelperMapper.helperWebList", param);
		if (!HString.isEmpty(list)) {
			res.putMessage(XConst.SUCCESS);
			res.putData("list", list);
			res.putData("thisPageSize", list.size());
			res.putData("totalPage", totalPage);
			res.putData("pageNo", pageNo);
			res.putFlag(true);
		}
		return res;
	}

	/**
	 * 
	 * 用于后台管理list
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData helperAdminList(PageData param) throws Exception {
		Long total = (Long) dao.findForObject("WebHelperMapper.helperWebListCount", param);
		param.put("data", dao.findForList("WebHelperMapper.helperWebList", param));
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 
	 * 详情
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData detail(PageData param) throws Exception {
		return (PageData) dao.findForObject("WebHelperMapper.detail", param);
	}

	/**
	 * 添加帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean addHelper(PageData param) throws Exception {
		Integer count = (Integer) dao.save("WebHelperMapper.addHelper", param);
		return count > 0;
	}

	/**
	 * 更新帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean updateHelper(PageData param) throws Exception {
		Integer count = (Integer) dao.update("WebHelperMapper.updateHelper", param);
		return count > 0;
	}

	/**
	 * 删除帮助问题
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean delHelper(PageData param) throws Exception {
		Integer count = (Integer) dao.delete("WebHelperMapper.delHelper", param);
		return count > 0;
	}

}
