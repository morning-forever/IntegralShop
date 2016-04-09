package com.bm.webs.service.integralShop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.GoodsType;
import com.bm.webs.dao.DaoSupport;


@Service
@Transactional
@SuppressWarnings("unchecked")
public class GoodsTypeService {

		@Resource(name = "daoSupport")
		private DaoSupport dao;

		/**
		 * 后台获取商品类型列表
		 * @param param
		 * @return
		 * @throws Exception
		 */
		public PageData getAdminGoodsTypeList() throws Exception {
			PageData pageData = new PageData();
			Integer total = (Integer) dao.findForObject("GoodsTypeMapper.getAdminGoodsTypeListCount", null);
			List<PageData> list = (List<PageData>)dao.findForList("GoodsTypeMapper.getAdminGoodsTypeList", null);
			pageData.put("data", list);
			pageData.put("recordsTotal", total);
			pageData.put("recordsFiltered", total);
			return pageData;
		}
		
		/**
		 * 商品添加页面需要商品类型数据
		 * @return
		 * @throws Exception
		 */
		public List<PageData> getGoodsTypeList() throws Exception{
			
			 List<PageData> list = (List<PageData>)dao.findForList("GoodsTypeMapper.getAdminGoodsTypeList", null);
			 
			 return list;
		}
		
		/**
		 * 根据id删除商品类型
		 * @param id
		 * @throws Exception
		 */
		public void deleteById(Integer id) throws Exception{
			dao.delete("GoodsTypeMapper.delete", id);
		}
		
	
		public void save(GoodsType goodsType) throws Exception{
			dao.save("GoodsTypeMapper.insert", goodsType);
		}
		
		public GoodsType getGoodsTypeById(Integer id) throws Exception {
			return (GoodsType) dao.findForObject("GoodsTypeMapper.getGoodsTypeById", id);
		}
		
		public void updateGoodsType(GoodsType goodsType) throws Exception{
			dao.update("GoodsTypeMapper.update", goodsType);
		}
	}


