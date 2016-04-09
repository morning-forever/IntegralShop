package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.WebSimpleHotelStar;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebSimpleHotelStarService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public List<WebSimpleHotelStar> allList() throws Exception {
		return (List<WebSimpleHotelStar>) dao.findForList("WebSimpleHotelStarMapper.allList", new PageData());
	}

	/**
	 * 获取酒店星级列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData getAdminStarList(PageData param) throws Exception{
		List<PageData> data = (List<PageData>) dao.findForList("WebSimpleHotelStarMapper.getAdminStarList", param);
		Integer total = (Integer) dao.findForObject("WebSimpleHotelStarMapper.getAdminResultNum", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 获取酒店星级总数
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("WebSimpleHotelStarMapper.getAdminResultNum", page);
	}

	/**
	 * 根据id 获取酒店星级
	 * 
	 * @param bannerId
	 * @return
	 * @throws Exception
	 */
	public WebSimpleHotelStar getById(Long id) throws Exception {
		return (WebSimpleHotelStar) dao.findForObject("WebSimpleHotelStarMapper.getById", id);
	}

	/**
	 * 修改酒店星级
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception {
		dao.update("WebSimpleHotelStarMapper.update", pd);
	}

	/**
	 * 删除酒店星级
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	@Deprecated
	public void delete(Long id) throws Exception {
		dao.delete("WebSimpleHotelStarMapper.delete", id);
	}

	/**
	 * 新增酒店星级
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception {
		dao.save("WebSimpleHotelStarMapper.insert", pd);
	}

	/**
	 * 返回分页数据
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findStarList(PageData param) throws Exception {
		List<PageData> data = (List<PageData>) dao.findForList("WebSimpleHotelStarMapper.findStarList", param);
		Integer total = (Integer) dao.findForObject("WebSimpleHotelStarMapper.findStarListCount", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 保存或者更新
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData save(PageData param) throws Exception {
		PageData res = new PageData(true);
		Integer count = 0;
		Long id = param.getLong("id");
		count = (Integer) dao.findForObject("WebSimpleHotelStarMapper.checkIsHave", param);
		if (count < 1) {
			if (!HString.isEmpty(id)) {
				dao.update("WebSimpleHotelStarMapper.update", param);
			} else {
				dao.save("WebSimpleHotelStarMapper.insert", param);
			}
			res.putStatus(XConst.SUCCESS);
		} else {
			res.putStatus(XConst.EXISTS);
		}
		return res;
	}

	/**
	 * 删除星级，添加了关联查询
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData delStar(Long id) throws Exception {
		PageData res = new PageData(true);
		PageData param = new PageData();
		param.put("starId", id);
		List<Integer> list = (List<Integer>) dao.findForList("WebSimpleHotelStarMapper.checkIsUsed", param);
		if (!HString.isEmpty(list)) {
			for (Integer count : list) {
				if (count > 0) {
					res.putStatus(XConst.USED);
					return res;
				}
			}
			dao.delete("WebSimpleHotelStarMapper.delete", id);
			res.putStatus(XConst.SUCCESS);
		}
		return res;
	}

}
