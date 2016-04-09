package com.bm.webs.service.web.simple;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service
@Transactional(rollbackFor = Exception.class)
public class WebSimpleHotelService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回分页数据
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public PageData findList(PageData param) throws Exception {
		List<PageData> data = (List<PageData>) dao.findForList("WebSimpleHotelMapper.findList", param);
		Integer total = (Integer) dao.findForObject("WebSimpleHotelMapper.pageListTotalCount", param);
		param.clear();
		param.put("data", data);
		param.put("recordsTotal", total);
		param.put("recordsFiltered", total);
		return param;
	}

	/**
	 * 返回详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData hotelDetail(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);

		PageData res = (PageData) dao.findForObject("WebSimpleHotelMapper.hotelDetail", param);
		// 获取图片
		PageData picParam = new PageData();
		picParam.put("from", "simple");
		picParam.put("type", "detail");
		picParam.put("fromId", id);
		List<String> picList = (List<String>) dao.findForList("CommonUploadMapper.findPathList", picParam);
		res.put("picList", picList);
		return res;
	}

	/**
	 * 添加酒店信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean addHotel(PageData param) throws Exception {
		String picUrls = param.getString("picUrls");
		List<String> list = Arrays.asList(picUrls.split(","));
		param.put("id", null);
		int count = (int) dao.save("WebSimpleHotelMapper.addHotel", param);

		if (count > 0) {
			PageData picParam = new PageData();
			picParam.put("from", "simple");
			picParam.put("type", "detail");

			Integer id = (Integer) dao.findForObject("WebSimpleHotelMapper.findId", param);
			picParam.put("fromId", id);

			for (String str : list) {
				picParam.put("picUrl", str);
				dao.save("CommonUploadMapper.addUpload", picParam);
			}
		}

		return count > 0;
	}

	/**
	 * 修改酒店信息
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean modHotel(PageData param) throws Exception {
		int count = (int) dao.update("WebSimpleHotelMapper.modHotel", param);
		String picUrls = param.getString("picUrls");
		List<String> list = Arrays.asList(picUrls.split(","));
		if (count > 0) {
			PageData picParam = new PageData();
			picParam.put("from", "simple");
			picParam.put("type", "detail");
			picParam.put("fromId", param.get("id"));

			dao.delete("CommonUploadMapper.delPics", picParam);

			for (String str : list) {
				picParam.put("picUrl", str);
				dao.save("CommonUploadMapper.addUpload", picParam);
			}
		}

		return count > 0;
	}

	/**
	 * 返回酒店星级列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> starList() throws Exception {
		return (List<PageData>) dao.findForList("WebSimpleHotelMapper.starList", null);
	}

	/**
	 * 所在城市列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> cityList() throws Exception {
		return (List<PageData>) dao.findForList("WebSimpleHotelMapper.cityList", null);
	}

	/**
	 * 删除信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delHotel(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		param.put("whereId", id);
		param.put("whereType", "hotel");
		Integer count = (Integer) dao.findForObject("WebSimpleHotelMapper.checkIsUsed", param);

		if (count > 0) {
			return false;
		} else {
			count = (Integer) dao.delete("WebSimpleHotelMapper.delHotel", param);
		}
		return true;
	}
	
}
