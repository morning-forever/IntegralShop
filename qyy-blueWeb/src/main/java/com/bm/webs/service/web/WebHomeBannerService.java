package com.bm.webs.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("webHomeService")
public class WebHomeBannerService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> bannerList(String type) throws Exception {
		PageData param = new PageData();
		param.put("bannerType", type);
		return (List<PageData>) dao.findForList("WebHomeBannerMapper.bannerList", param);
	}

	public void updateEnable(PageData pd) throws Exception {
		dao.update("WebHomeBannerMapper.updateEnable", pd);
	}

	public void deleteRecommend(PageData pd) throws Exception {
		dao.update("WebHomeBannerMapper.deleteRecommend", pd);
	}

	/**
	 * 查询论坛BannerList
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findBbsBannerList(PageData pd) throws Exception {
		Float total=(Float) dao.findForObject("WebHomeBannerMapper.findBbsBannerCount", pd);
		pd.put("recordsTotal", total);
		pd.put("recordsFiltered", total);
		return (List<Map<String, Object>>) dao.findForList("WebHomeBannerMapper.findBbsBannerList", pd);
	}

	/**
	 * 检查是否有重复位置Banner
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkBanner(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebHomeBannerMapper.checkBanner", pd);
	}

	/**
	 * 添加Banner
	 * @param pd
	 * @throws Exception 
	 */
	public void insertBanner(PageData pd) throws Exception {
		dao.save("WebHomeBannerMapper.insertBanner", pd);
		pd.put("fromId", pd.get("bannerId"));
		dao.save("CommonUploadMapper.addUpload", pd);
	}
	
	/**
	 * 查询Banner详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findBannerDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebHomeBannerMapper.findBannerDetial", pd);
	}
	
	/**
	 * 查询深度游Banner详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findDetphBannerDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebHomeBannerMapper.findDetphBannerDetial", pd);
	}
	
	/**
	 * 查询广告Banner详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findAdvertBannerDetial(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebHomeBannerMapper.findAdvertBannerDetial", pd);
	}
	
	/**
	 * 查找banner链接到哪个表
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Long findBannerLink(Long id) throws Exception {
		PageData param = new PageData();
		param.put("id", id);
		return (Long)dao.findForObject("WebHomeBannerMapper.findBannerLink", param);
	}
	
	/**
	 * 编辑Banner
	 * @param pd
	 * @throws Exception 
	 */
	public void updateBanner(PageData pd) throws Exception {
		dao.update("WebHomeBannerMapper.updateBanner", pd);
		pd.put("fromId", pd.get("id"));
		dao.delete("CommonUploadMapper.delPics", pd);
		dao.save("CommonUploadMapper.addUpload", pd);
	}

	
	
	/******************pc端查询开始*/
	
	
	/**
	 * 获取web端banner
	 * @param type
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> webBannerList(String type) throws Exception{
		PageData param = new PageData();
		param.put("bannerType", type);
		return (List<PageData>) dao.findForList("WebHomeBannerMapper.webBannerList", param);
	}
	
	
	/**
	 * 获取web端banner的条数
	 * 
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public Integer webBannerListCount(String type) throws Exception{
		PageData param = new PageData();
		param.put("bannerType", type);
		return (Integer) dao.findForObject("WebHomeBannerMapper.webBannerListCount", param);
	}
	
	
	
	
	
	
	
	
}
