package com.bm.webs.bean;

/**
 * 分页类
 * 
 * @author xiaoqi
 * 
 */
public class Pages {

	private int pageSize = -1;// 当前页
	private int pageTotal = -1;// 总页数
	private int showLine = 20;// 展示条数
	private int totalLine = 0;// 总条数
	private int startLine = -1;// 起始数
	private String reqParams;//请求参数
	

	public Pages() {
	}
	
	public Pages(int totalLine, int showLine) {
		this.showLine = showLine;
		this.totalLine = totalLine;
		pageSize = 1;
		calcPageTotal();
		calcPageSize();
		calcStartLine();
	}
	public Pages(int pageSize, int pageTotal, int showLine) {
		this.pageSize = pageSize;
		this.showLine = showLine;
		this.pageTotal = pageTotal;
	}

	public Pages(int totalLine) {
		this.totalLine = totalLine;
		pageSize = 1;
		calcPageTotal();
		calcPageSize();
		calcStartLine();
	}

	// 总页数pageTotal =
	// 总条数totalLine%展示条数showLine>0?总条数totalLine/展示条数showLine+1:总条数totalLine/展示条数showLine
	public void calcPageTotal() {
		if (pageTotal < 0)
			pageTotal = 0;
		if (totalLine % showLine > 0)
			pageTotal = totalLine / showLine + 1;
		else
			pageTotal = totalLine / showLine;
	}

	// 当前起始行数
	// 起始行数startLine = (当前页pageSize-1)*展示条数showLine;
	public void calcStartLine() {
		startLine = (pageSize - 1) * showLine;
		if(startLine<=-1)startLine=0;
	}

	public void calcPageSize() {
		if (pageSize <= 0)
			pageSize = 1;
		if (pageSize > pageTotal)
			pageSize = pageTotal;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public int getShowLine() {
		return showLine;
	}

	public int getTotalLine() {
		return totalLine;
	}

	public int getStartLine() {
		if(startLine==-1)
			calcStartLine();
		return startLine;
	}

	public String getReqParams() {
		return reqParams;
	}

	public void setReqParams(String reqParams) {
		this.reqParams = reqParams;
	}

}
