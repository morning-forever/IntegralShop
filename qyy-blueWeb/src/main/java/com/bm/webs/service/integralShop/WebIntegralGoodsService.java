package com.bm.webs.service.integralShop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.GoodsImage;
import com.bm.webs.dao.DaoSupport;
import com.bm.webs.vo.GoodsView;


@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebIntegralGoodsService {

		@Resource(name = "daoSupport")
		private DaoSupport dao;
		
		@Resource
		private GoodsImageService gis;

		
		
		/**
		 * 根据id查询商品
		 * @param id
		 * @return
		 * @throws Exception
		 */
		public GoodsView findGoodsById(Integer id) throws Exception {
			return (GoodsView) dao.findForObject("IntegralGoodsMapper.getGoodsById", id);
		}

		/**
		 * 后台上传商品
		 * @param gv
		 * @return
		 * @throws Exception
		 */
		public Integer saveGoods(GoodsView gv) throws Exception{
			
			dao.save("IntegralGoodsMapper.insert", gv);
			List<String>  imgUrls = gv.getImgUrls();
			for(String url:imgUrls){
				Map<String,Object> param = new HashMap<String,Object>();
				param.put("imgUrl", url);
				param.put("goodsId", gv.getId());
				gis.saveGoodsImage(param);
			}
			return gv.getId();
		}
		
		
		/**
		 * 更新商品信息
		 * @param id
		 * @param goods
		 * @return
		 * @throws Exception
		 */
		public void updateGoods(GoodsView gv) throws Exception{
			
			 dao.update("IntegralGoodsMapper.updateGoods", gv);
			
			 //更新商品图片(这里只是将商品图片的url改变，并没有删除原来的图片)
			 List<GoodsImage> goodsImgs = gv.getGoodsImages();
			 for(GoodsImage image:goodsImgs){
				 gis.updateGoodsImage(image);
			 }
			 
			 
		}
	
		/**
		 * 
		 * 删除商品信息
		 * 
		 * @param ids
		 * @throws Exception 
		 */
			public void deleteGoods(Integer id) throws Exception{
				//先删除商品图片，再删除商品
				 gis.deleteGoodsImageByGoodsId(id);
				 
				 dao.delete("IntegralGoodsMapper.deleteGoods", id);
			}
		

		/**
		 * 后台获取商品列表
		 * @param param
		 * @return
		 * @throws Exception
		 */
		public PageData getAdminGoodsList(PageData param) throws Exception {
			Integer total = (Integer) dao.findForObject("IntegralGoodsMapper.getAdminGoodsListCount", param);
			List<PageData> list = (List<PageData>)dao.findForList("IntegralGoodsMapper.getAdminGoodsList", param);
			param.put("data", list);
			param.put("recordsTotal", total);
			param.put("recordsFiltered", total);
			return param;
		}
		
		//获得推荐商品
		public GoodsView getRecommendGoods() throws Exception{
			
			return (GoodsView) dao.findForObject("IntegralGoodsMapper.getRecommendGoods", null);
		}
		
		//获得最新上架商品
		public List<GoodsView> getNewShevelsGoods() throws Exception{
			
			return (List<GoodsView>) dao.findForList("IntegralGoodsMapper.getNewShevelsGoods", null);
		}
		
		//获得创意商品
		public List<GoodsView> getOriginalityGoods() throws Exception{
			return (List<GoodsView>) dao.findForList("IntegralGoodsMapper.getOriginalityGoods", null);
		}
		
		//获得旅行装备
		public List<GoodsView> getTravEqpmtGoods() throws Exception{
			return (List<GoodsView>) dao.findForList("IntegralGoodsMapper.getTravEqpmtGoods", null);
		}
		
		//获得易游专品
		public List<GoodsView> getYyzpGoods() throws Exception{
			return (List<GoodsView>) dao.findForList("IntegralGoodsMapper.getYyzpGoods", null);
		}
		
		//获得民族印象
		public List<GoodsView> getMzyxGoods() throws Exception{
			return (List<GoodsView>) dao.findForList("IntegralGoodsMapper.getMzyxGoods", null);
		}
		
		//当商品被浏览时，更新商品浏览量
		public void updateGoodsPV(Integer id) throws Exception{

			dao.update("IntegralGoodsMapper.updatePV", id);
		}
		
	}


