package com.bm.webs.service.integralShop;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.integralShop.GoodsImage;
import com.bm.webs.dao.DaoSupport;


@Service
@Transactional
public class GoodsImageService {

		@Resource(name = "daoSupport")
		private DaoSupport dao;

		
		

		public Integer saveGoodsImage(Map<String,Object> param) throws Exception{
			return (Integer) dao.save("GoodsImageMapper.insert",param );
		}
		
		public void deleteGoodsImageByGoodsId(Integer id) throws Exception{
			dao.delete("GoodsImageMapper.delGoodsImgByGoodsId", id);
		}
		
		public void  updateGoodsImage(GoodsImage image) throws Exception{
			dao.update("GoodsImageMapper.update", image);
			
		}
	}


