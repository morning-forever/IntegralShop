package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.bm.webs.bean.MerchGoods;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@SuppressWarnings("unchecked")
@Service("webMerchGoodsService")
public class WebMerchGoodsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	

	/**
	 * 返回列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<MerchGoods> findWebMerchGoodsListPage(PageData page) throws Exception {
		return (List<MerchGoods>) dao.findForList("MerchGoodsMapper.findWebMerchGoodsListPage", page);
	}

	/**
	 * 获取数据总数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Integer getResultNum(PageData page) throws Exception {
		return (Integer) dao.findForObject("MerchGoodsMapper.getResultNum", page);
	}
    
	

}
