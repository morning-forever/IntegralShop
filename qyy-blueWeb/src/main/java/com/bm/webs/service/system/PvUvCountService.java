package com.bm.webs.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PVUV;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 
 * 统计pv ，uv的service
 * 
 * @author mike <br>
 *         2015年12月15日
 * @version 1.0
 */
@Service
@Transactional
public class PvUvCountService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 添加一个统计信息
	 * 
	 * @param accessIp
	 * @param accessUrl
	 * @return boolean
	 * @throws Exception
	 */
	public boolean addPvUvCount(String accessIp, String accessUrl) throws Exception {
		PageData param = new PageData();
		param.put("accessIp", accessIp);
		param.put("accessUrl", accessUrl);
		int count = (int) dao.save("PvUvCountMapper.addPvUvCount", param);
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	public PageData getPVUVCountList(PageData param) throws Exception {
		Long total = (Long) dao.findForObject("PvUvCountMapper.getPVCountCount", param);
		List<PVUV> pulist = (List<PVUV>) dao.findForList("PvUvCountMapper.getPVCount", param);
		List<PVUV> ulist = (List<PVUV>) dao.findForList("PvUvCountMapper.getUVCount", param);
		for (int i = 0; i < pulist.size(); i++) {
			PVUV pv = pulist.get(i);
			for (PVUV uv : ulist) {
				if (pv.getAccessTime().equals(uv.getAccessTime()))
					pulist.get(i).setUvTotalCount(uv.getUvTotalCount());
			}
		}
		param.put("data", pulist);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}
	
	public PageData getPVDetailByUrl(PageData param) throws Exception{
		return (PageData) dao.findForObject("PvUvCountMapper.getPVDetailByUrl", param);
	}
	
	
	
}
