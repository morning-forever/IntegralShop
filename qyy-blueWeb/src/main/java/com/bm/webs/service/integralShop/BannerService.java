package com.bm.webs.service.integralShop;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.Banner;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
public class BannerService {
	
	@Resource
	private DaoSupport dao;
	
	public void save(Banner banner) throws Exception{
		System.out.println(banner.getName()+"："+banner.getUrl());
		dao.save("BannerMapper.insert", banner);
	}
	
	@SuppressWarnings("unchecked")
	public PageData getBannerList(PageData param) throws Exception{
		
		PageData result = new PageData();
		
		List<Banner> banners = (List<Banner>) dao.findForList("BannerMapper.getBannerList", param);
		Integer total = (Integer) dao.findForObject("BannerMapper.getBannerCount", param);
		
		result.put("data", banners);
		result.put("recordsTotal", total);
		result.put("recordsFiltered", total);
		return result;
		
		
	}
	
	//根据ID删除Banner(包括删除Banner图片)
	public boolean deleteById(Integer id,String serverPath) throws Exception{
		
		
		//真实地删除banner图片
		//1.查询数据库获得Banner对象
		Banner banner = (Banner) dao.findForObject("BannerMapper.getById", id);
		
		//这是插曲
		dao.delete("BannerMapper.deleteById", id);
		
		//2.通过Banner对象获得图片url
		String filePath = serverPath+banner.getUrl();
		//3.根据filePath新建File
		File file = new File(filePath);
		//4.调用Apache的FileUtils删除图片文件
		return FileUtils.deleteQuietly(file);
		
	}
	
	public List<Banner> getBanners() throws Exception{
		@SuppressWarnings("unchecked")
		List<Banner> banners = (List<Banner>) dao.findForList("BannerMapper.getBannerList", null);
		return banners;
	}
}
