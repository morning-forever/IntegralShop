package com.bm.common.interceptor;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.listener.SpringContextListener;
import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.util.html.ip.IpUtil;
import com.bm.common.util.sync.PvUvCountHandler;
import com.bm.common.util.sync.SyncTask;
import com.bm.common.util.sync.thread.NetTaskThread;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;

/**
 * 请求拦截器
 * 
 * @author mike <br>
 *         2015年4月13日
 */
public class SessionInterceptor implements HandlerInterceptor {

	private List<String> allowUrls;

	public List<String> getAllowUrls() {
		return allowUrls;
	}

	public void setAllowUrls(List<String> allowUrls) {
		this.allowUrls = allowUrls;
	}
	
	public static volatile Map<String, String> sessionMap=new ConcurrentHashMap<String, String>();

	/*
	 * 在调用controller方法之前调用
	 */
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String servletPath = request.getServletPath();
		countLogin(request);
		setPvUv(request);
		String redirect = request.getHeader("Referer");
		if (!HString.isEmpty(redirect)) {
			redirect = servletPath + "?";// + request.getQueryString();
			Enumeration<String> enumeration = request.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String name = enumeration.nextElement();
				redirect += name + "=" + request.getParameter(name) + "&";
			}
			redirect += "st=" + (new Date()).getTime();
			redirect = URLEncoder.encode(redirect, "utf-8");
			System.out.println("---en:" + redirect + " =====> de:" + URLDecoder.decode(redirect, "UTF-8"));
		}

		/**
		 * 检查是否存在配置允许的路径
		 */
		if (allowUrls != null && allowUrls.size() > 0) {
			for (String url : allowUrls) {
				if (servletPath.contains(url))
					return true;
			}
		}
		Object sessionSet = request.getSession().getAttribute(XConst.SESSION_SYSSET);
		SystemSet set = null;
		/**
		 * 检查表示请求地址中允许通过的路径
		 */
		if (servletPath.contains("/allowAccess") || servletPath.contains("api") || servletPath.contains("/weixin")) {
			if (servletPath.contains("/allowAccess")) {
				if (servletPath.contains("/orders") && !servletPath.contains("callback")) {
					set = (SystemSet) sessionSet;
					if (set != null && set.getWebUser() != null) {
						WebUser webUser = set.getWebUser();
						if (HString.isEmpty(webUser.getId())) {
							if (servletPath.contains("/login") || servletPath.contains("/home")) {
								return true;
							}
							response.sendRedirect(request.getContextPath() + "/pc/login?op=biuld&callback=" + (HString.isEmpty(redirect) ? "" : redirect));
							request.getSession().setAttribute("redirect", (HString.isEmpty(redirect) ? "" : redirect));
							return false;
						} else {
							if (servletPath.contains("/login") && !servletPath.contains("/outLogin")) {
								response.sendRedirect(request.getContextPath());
								return false;
							}
						}
					} else {
						response.sendRedirect(request.getContextPath() + "/pc/login?op=toLogin&callback=" + (HString.isEmpty(redirect) ? "" : redirect));
						request.getSession().setAttribute("redirect", (HString.isEmpty(redirect) ? "" : redirect));
						return false;
					}
				}
			}

			if (servletPath.contains("/weixin")) {
				if (servletPath.contains("/user") || servletPath.contains("/leave")) {
					if (sessionSet != null && sessionSet instanceof SystemSet) {
						set = (SystemSet) sessionSet;
						if (set.getUser() == null) {
							response.sendRedirect(request.getContextPath() + "/weixin/login/enLogin?redirect=" + (HString.isEmpty(redirect) ? "" : redirect));
							return false;
						}
					} else {
						response.sendRedirect(request.getContextPath() + "/weixin/login/enLogin?redirect=" + (HString.isEmpty(redirect) ? "" : redirect));
						return false;
					}
				}
			}
			return true;
		}

		/**
		 * 检查前端用户
		 */
		if (servletPath.contains("pc")) {
			if (sessionSet != null && sessionSet instanceof SystemSet) {
				set = (SystemSet) sessionSet;
				if (set.getWebUser() != null) {
					WebUser webUser = set.getWebUser();
					if (HString.isEmpty(webUser.getId())) {
						if (servletPath.contains("/login") || servletPath.contains("/home")) {
							return true;
						}
						response.sendRedirect(request.getContextPath() + "/pc/login?op=biuld&callback=" + (HString.isEmpty(redirect) ? "" : redirect));
						request.getSession().setAttribute("redirect", (HString.isEmpty(redirect) ? "" : redirect));
						return false;
					} else {
						if (servletPath.contains("/login") && !servletPath.contains("/outLogin")) {
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
					return true;
				}
			}

			if (servletPath.toLowerCase().contains("/login") || (!servletPath.toLowerCase().contains("order") && !servletPath.toLowerCase().contains("/user"))) {
				return true;
			}

			response.sendRedirect(request.getContextPath() + "/pc/login?op=toLogin&callback=" + (HString.isEmpty(redirect) ? "" : redirect));
			request.getSession().setAttribute("redirect", (HString.isEmpty(redirect) ? "" : redirect));
			return false;
		}

		/**
		 * 检查后台用户
		 */
		if (servletPath.contains("admin")) {
			if (servletPath.toLowerCase().contains("/login")) {
				return true;
			}
			if (sessionSet != null && sessionSet instanceof SystemSet) {
				set = (SystemSet) sessionSet;
				if (set.getUser() != null) {
					return true;
				}
			}
			response.sendRedirect(request.getContextPath() + "/admin/login?op=toLogin");
			return false;
		}

		return true;
	}

	/**
	 * 每次进入到拦截器统计登录状态
	 * @param request
	 */
	private void countLogin( HttpServletRequest request) {
		HttpSession session=request.getSession();
		SystemSet sysset=null;
		if(session.getAttribute(XConst.SESSION_SYSSET) instanceof SystemSet){
			sysset=(SystemSet) session.getAttribute(XConst.SESSION_SYSSET);
		}
		if(sysset!=null&&sysset.getWebUser()!=null){
			sessionMap.put(session.getId(),"1");
		}else{
			String id=sessionMap.get(session.getId());
			if(!"1".equals(id)){
				sessionMap.put(session.getId(),"0");
			}
		}
	}
	private PvUvCountHandler pvuvCountHandler =  new PvUvCountHandler();
	
	private void setPvUv(HttpServletRequest request){
		String url;
		try {
			String accessIp = IpUtil.getIpAddr(request);
//			String accessUrl = request.getRequestURI();
			String servletPath = request.getServletPath();
			if(!(servletPath.contains("/static/") 
					|| servletPath.contains("/uploadFiles/") 
					|| servletPath.contains("/plugins/") 
					|| servletPath.contains("/css/") 
					|| servletPath.contains("/js/") 
					|| servletPath.contains("/img/") 
					|| servletPath.contains("/api") 
					|| servletPath.contains("/admin"))){
				Map<String,Object> params = new HashMap<String,Object>();
				params.put("accessIp", accessIp);
				params.put("accessUrl", servletPath);
				NetTaskThread.addTask(new SyncTask("add",params,pvuvCountHandler));
			}
			url = "=>"+accessIp+"=>uri:"+servletPath;
			System.out.println("========="+url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 在调用controller之后调用 <br>
	 * 可以修改modelandview中的内容，返回到视图中
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		/**
		 * 获取友情链接
		 */
		Object obj = request.getSession().getAttribute("friendsLinkList");
		if (null == obj)
			request.getSession().setAttribute("friendsLinkList", SpringContextListener.getFriendsLink());

		Object tel400 = request.getSession().getAttribute("tel400");
		if (null == tel400)
			request.getSession().setAttribute("tel400", ConfigLoad.getValue("webapp.tel400"));

	}

	/**
	 * 在视图被渲染以后调用 <br>
	 * 展示后的处理
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO
	}

}
