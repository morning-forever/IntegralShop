package com.bm.webs.service.integralShop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.HotLevel;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
public class GoodsHotService {
	
	@Resource
	private DaoSupport dao;
	
	public PageData getAdminGoodsHotList(PageData param) throws Exception{
		PageData result = new PageData();
		
		@SuppressWarnings("unchecked")
		List<PageData> list = (List<PageData>) dao.findForList("GoodsHotMapper.getAdminGoodsHotList", param);
		int total = (Integer) dao.findForObject("GoodsHotMapper.getAdminGoodsHotCount", param);
		
		result.put("data", list);
		result.put("recordsTotal", total);
		result.put("recordsFiltered", total);
		
		return result;
		
	}
	public List<HotLevel> getHotLevelList() throws Exception{
		
		@SuppressWarnings("unchecked")
		List<HotLevel> hotLevels=(List<HotLevel>) dao.findForList("GoodsHotMapper.getHotLevelList", null);
		return hotLevels;
	}
	
	public void save(HotLevel hotLevel) throws Exception{
		dao.save("GoodsHotMapper.insert", hotLevel);
	}
	
	public void deleteById(Integer id) throws Exception{
		dao.delete("GoodsHotMapper.delete", id);
	}
	
	public void update(HotLevel hotLevel) throws Exception{
		dao.update("GoodsHotMapper.update", hotLevel);
	}
	
	public HotLevel getHotLevelById(Integer id) throws Exception{
		return (HotLevel) dao.findForObject("GoodsHotMapper.getHotLevelById", id);
	}
}
