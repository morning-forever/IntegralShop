package com.bm.webs.bean.integralShop;

import java.util.List;

public class IntegralGoods {
	private int id;
	private String name;//商品名称
	private Integer originalPrice;//原价
	private Integer currentPrice;//现价
	private int allNumber;//总数量
	private int residueNumber;//剩余数量
	private String summary;//商品概述（描述）
	private int pv;//商品浏览量
	private String detailImage;
	private GoodsType goodsType;
	private int goodsTypeId;
	
	private List<GoodsImage> goodsImgs;
	
	public int getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(int goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public Integer getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Integer getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Integer currentPrice) {
		this.currentPrice = currentPrice;
	}
	public int getAllNumber() {
		return allNumber;
	}
	public void setAllNumber(int allNumber) {
		this.allNumber = allNumber;
	}
	public int getResidueNumber() {
		return residueNumber;
	}
	public void setResidueNumber(int residueNumber) {
		this.residueNumber = residueNumber;
	}
	
	public int getPv() {
		return pv;
	}
	public void setPv(int pv) {
		this.pv = pv;
	}
	
	
	public String getDetailImage() {
		return detailImage;
	}
	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}
	public GoodsType getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public List<GoodsImage> getGoodsImgs() {
		return goodsImgs;
	}
	public void setGoodsImgs(List<GoodsImage> goodsImgs) {
		this.goodsImgs = goodsImgs;
	}
	
	
	
}
