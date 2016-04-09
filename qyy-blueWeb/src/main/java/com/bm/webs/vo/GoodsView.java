package com.bm.webs.vo;

import java.util.List;

import com.bm.webs.bean.integralShop.GoodsImage;
import com.bm.webs.bean.integralShop.HotLevel;
import com.bm.webs.bean.integralShop.IntegralGoods;

public class GoodsView extends IntegralGoods{
	
	private List<String> imgUrls;
	private HotLevel hotLevel;
	private List<GoodsImage> goodsImages;

	public List<String> getImgUrls() {
		return imgUrls;
	}

	public void setImgUrls(List<String> imgUrls) {
		this.imgUrls = imgUrls;
	}

	public HotLevel getHotLevel() {
		return hotLevel;
	}

	public void setHotLevel(HotLevel hotLevel) {
		this.hotLevel = hotLevel;
	}

	public List<GoodsImage> getGoodsImages() {
		return goodsImages;
	}

	public void setGoodsImages(List<GoodsImage> goodsImages) {
		this.goodsImages = goodsImages;
	}
	
	

}
