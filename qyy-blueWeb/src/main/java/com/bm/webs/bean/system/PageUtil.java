package com.bm.webs.bean.system;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * 分页管理工具类
 * 
 * @author Hham
 *
 */
public class PageUtil {

	
	private Integer pageNo;
	private Integer pageSize;
	private Integer totalPage;
	private Integer totalItem;
	
	public PageUtil(){
		super();
	}

	public PageUtil(Integer pageNo,Integer pageSize){
		super();
		this.pageNo=pageNo;
		this.pageSize=pageSize;
	}
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(Integer totalItem) {
		this.totalItem = totalItem;
	}

	/**
	 * 返回开始位置 
	 * @return
	 */
	public Integer getStartItem() {
		return (pageNo-1)*pageSize;
	}
	
	/**
	 * 设置总条数，并算出总页数 
	 * @param total
	 */
	public void sumCount(Integer total){
		totalItem=total;
		totalPage=total%pageSize==0?total/pageSize:total/pageSize+1;
	}
	
	public Map<String, Object> generatePageMap(){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startItem", getStartItem());
		map.put("pageSize", getPageSize());
		return map;
	}
	
}
