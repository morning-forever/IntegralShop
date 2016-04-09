package com.bm.common.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.bm.common.beans.XConst;

/**
 * 非法参数过滤
 * 
 * @author mike <br>
 *         2015年4月13日
 */
public class IllegalFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		request = new Request((HttpServletRequest) request);
		filterChain.doFilter(request, response);
	}

	public String filterDangerString(String value) {
		if (value == null)
			return null;
		List<String> chList = XConst.CHARLIST;
		for (int i = 0; i < chList.size(); i++) {
			String rStr = chList.get(i);
			if (value.indexOf(rStr) >= 0)
				value = value.replace(rStr, "****");
		}
		return value;
	}

	/**
	 * 重新定义request 过滤字符中的非法参数
	 * 
	 * @author mike <br>
	 *         2015年4月13日
	 */
	class Request extends HttpServletRequestWrapper {
		public Request(HttpServletRequest request) {
			super(request);
		}

		@Override
		public String getParameter(String name) {
			// 返回值之前 先进行过滤
			return filterDangerString(super.getParameter(name));
		}

		@Override
		public String[] getParameterValues(String name) {
			// 返回值之前 先进行过滤
			String[] values = super.getParameterValues(name);
			for (int i = 0; i < values.length; i++) {
				values[i] = filterDangerString(values[i]);
			}
			return values;
		}
	}
}
