package com.bm.webs.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.UserToken;
import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.base.SystemSet;
import com.bm.webs.service.app.user.TokenService;

/**
 * base controller
 * 
 * @author <br>
 *         2015年5月21日
 */
public abstract class BaseController {

	protected Logger logger = Logger.getLogger(this.getClass());

	/**
	 * 图片文件格式限制
	 */
	public static final String[] IMAGE_FORMAT_ARRAY = new String[] { ".gif", ".png", ".jpg", ".jpeg", ".bmp" };// 全站中引用的图片格式

	/**
	 * 获取项目在磁盘上面的物理路径
	 */
	public static final String WEB_SITE_ROOT_PATH = BaseController.class.getResource("/").getPath().replaceAll("%20", " ")
			.substring(0, BaseController.class.getResource("/").getPath().replaceAll("%20", " ").indexOf("WEB-INF"));

	/**
	 * 项目网络根目录
	 */
	public static String WEB_ROOT_URL = null;

	/**
	 * 得到ModelAndView
	 * 
	 * @return
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到PageData
	 * 
	 * @return
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 在api中获取pageData
	 * 
	 * bs 只需要一个参数 <br>
	 * 当bs为空或者bs[0]为true的时候表示获取request值
	 * 
	 * @param bs
	 * @return
	 */
	public PageData getApiPageData(boolean... bs) {
		PageData pageData = null;
		if (bs.length == 0 || bs[0]) {
			pageData = new PageData(this.getRequest());
			Long pageNo = pageData.getLong("pageNo");
			Long showLine = pageData.getLong("showLine");
			Long startLine = 0l;

			if (HString.isEmpty(showLine))
				showLine = 10l;
			if (!HString.isEmpty(pageNo)) {
				if (pageNo < 1)
					pageNo = 1l;
				startLine = (pageNo - 1) * showLine;
			}
			pageData.put("startLine", startLine);
			pageData.put("showLine", showLine);
		} else {
			pageData = new PageData();
			pageData.put("Token", get32UUID());
		}
		return pageData;
	}

	/**
	 * 在sys中获取pageData
	 * 
	 * bs 只需要一个参数 <br>
	 * 当bs为空或者bs[0]为true的时候表示获取request值
	 * 
	 * @param bs
	 * @return
	 */
	public PageData getSysPageData() {
		PageData pageData = new PageData(this.getRequest());
		String pageNo = pageData.getString("start");
		String showLine = pageData.getString("length");

		int sl = 10;
		if (!HString.isEmpty(showLine))
			sl = Integer.parseInt(showLine);
		if (!HString.isEmpty(pageNo)) {
			pageData.put("startLine", Integer.parseInt(pageNo));
			pageData.put("showLine", sl);
		}

		return pageData;
	}

	/**
	 * 得到request对象
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return request;
	}

	/**
	 * 得到response对象
	 * 
	 * @return
	 */
	public HttpServletResponse getResponse() {
		HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		return response;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public static String get32UUID() {
		return UUID.randomUUID().toString().trim().replaceAll("-", "");
	}

	public static void logBefore(Logger logger, String interfaceName, String methodName) {
		logger.info("");
		logger.info(interfaceName + " - " + methodName + ":start");
	}

	public static void logAfter(Logger logger) {
		logger.info("end");
		logger.info("");
	}

	/**
	 * 获取登录用户的IP
	 * 
	 * @throws Exception
	 */
	public String getRemortIP() throws Exception {
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}
		return ip;
	}

	/**
	 * 检查参数是否完整
	 * 
	 * @param method
	 * @param data
	 * @param params
	 * @param values
	 * @return
	 */
	public static boolean checkParam(String method, PageData data, String[] params, String[] pvals) {
		boolean result = false;
		int falseCount = 0;
		String[] tempArray = new String[20]; // 临时数组
		int size = params.length;
		for (int i = 0; i < size; i++) {
			String param = params[i];
			if (!data.containsKey(param)) {
				tempArray[falseCount] = pvals[i] + "--" + param;
				falseCount += 1;
			}
		}
		if (falseCount > 0) {
			String error = method + "接口，请求协议中缺少 " + falseCount + "个 参数：";
			for (int j = 1; j <= falseCount; j++) {
				String e2 = "   第" + (j) + "个：" + tempArray[j - 1];
				error += e2 + "  ";
			}
			data.clear();
			System.err.println(error);
			data.put(XConst.API_RETURN_MSG_KEY, error);
			data.put(XConst.API_RETURN_STATUS_KEY, XConst.API_STATUS_FIALED);
		} else {
			result = true;
		}
		return result;
	}

	/**
	 * 后台参数处理（空字符串参数删除）
	 * 
	 * @param method
	 * @param data
	 * @param params
	 * @param values
	 * @return
	 */
	public static void checkSysParam(PageData data, String[] params) {

		for (int i = 0; i < params.length; i++) {
			String param = params[i];
			if (HString.isEmpty(data.getString(param))) {
				data.remove(param);
			}
		}
	}

	@Resource(name = "tokenService")
	private TokenService tokenService;

	/**
	 * 更新数据库和用户的token
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	protected void updateNewToken(PageData pageData) throws Exception {
		if (pageData.containsKey("oldToken")) {
			pageData.put("Token", get32UUID());
			tokenService.update(pageData);
			pageData.remove("oldToken");
		} else {
			tokenService.delete(pageData);
			tokenService.insert(pageData);
		}
	}

	/**
	 * 检查token是否匹配
	 * 
	 * @param pageData
	 * @return
	 * @throws Exception
	 */
	protected boolean isTokenSuccess(PageData pageData) throws Exception {
		UserToken token = tokenService.getToken(pageData);
		boolean isSuccess = (token != null) ? true : false;
		if (!isSuccess) {
			pageData.clear();
			/*
			 * pageData.put(XConst.API_RETURN_STATUS_KEY, XConst.API_STATUS_TOKEN); pageData.remove(XConst.API_TOKEN_KEY); pageData.remove(XConst.API_TOKEN_OLD_KEY); pageData.put(XConst.API_RETURN_MSG_KEY, XConst.API_MSG_TOKEN_ERR);
			 */
			pageData.putFlag(false);
			pageData.putMessage(XConst.API_STATUS_TOKEN);
		}
		return isSuccess;
	}

	/**
	 * 获取当前用户token
	 * 
	 * @return
	 * @throws Exception
	 */
	protected String getUserToken() throws Exception {
		String redirect = getRequest().getHeader("Referer");
		if (HString.isEmpty(redirect))
			redirect = getRequest().getServletPath() + "?" + getRequest().getQueryString();

		Object sessionSet = getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
		if (sessionSet != null && sessionSet instanceof SystemSet) {
			// SystemSet set = (SystemSet) sessionSet;
			// TUserInfo user = set.getUserinfo();
			// if (user != null) {
			// PageData pd = new PageData();
			// //pd.put("userId", user.getId());
			// TUserToken token = tokenService.getTokenByUid(pd);
			// return token.getToken();
			// }else{
			// getResponse().sendRedirect(getRequest().getContextPath() +
			// "/weixin/login/enLogin?redirect="+redirect);
			// }
		} else {
			getResponse().sendRedirect(getRequest().getContextPath() + "/weixin/login/enLogin?redirect=" + redirect);
		}
		return null;
	}

	/**
	 * 更新session中的用户
	 * 
	 * @return
	 * @throws Exception
	 */
	protected void updateSessionUser(WebUser user) throws Exception {
		((SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET)).setWebUser(user);
	}

	/**
	 * 创建新的map来存储数据
	 * 
	 * @param key
	 * @param val
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected HashMap getData(String key, Object val) {
		HashMap map = new HashMap();
		map.put(key, val);
		return map;
	}

	/**
	 * 设置不再使用的对象为null
	 * 
	 * @param objs
	 */
	public void setNullVal(Object... objs) {
		for (Object object : objs) {
			if (object != null)
				object = null;
		}
	}

	/**
	 * 保存当前页面的menuKey,<br>
	 * 在页面做权限控制
	 * 
	 * @return
	 */
	protected abstract String getMenuKey();

	/**
	 * 
	 * 根据所给类型转换成指定值 暂时只想到字符串，其他类型转数字值？。。。。。不知道还有什么其他类型 (O.O)
	 * 
	 * @param obj
	 *            需要转换的对象
	 * @param clas
	 *            需要转换成的目标类型
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static <T> T objectOfValue(Object obj, Class<T> clas) throws Exception {
		if (obj != null) {
			// Method
			// valueOf=clas.getDeclaredMethod("valueOf",String.class);//调用非静态方法
			Method valueOfS = clas.getMethod("valueOf", String.class);// 调用静态方法
			return (T) valueOfS.invoke(clas, obj.toString());
		} else {
			return null;
		}
	}

	public WebUser getLoginUser() throws Exception {
		WebUser user = null;
		try {
			user = ((SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET)).getWebUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 验证文件类型是否为图片
	 * 
	 * @param type
	 * @return
	 */
	public static boolean checkImage(String type) {
		if (type == null) {
			return false;
		}
		type = type.toLowerCase();
		for (String s : IMAGE_FORMAT_ARRAY) {
			if (s.equals(type)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 返回项目网络根目录路径
	 * 
	 * @return
	 */
	public String getWebRootUrl() {
		if (WEB_ROOT_URL == null) {
			HttpServletRequest request = getRequest();
			StringBuffer strBuffer = new StringBuffer();
			strBuffer.append(request.getScheme());
			strBuffer.append("://");
			strBuffer.append(request.getServerName());
			strBuffer.append(":");
			strBuffer.append(request.getServerPort());
			strBuffer.append(request.getContextPath());
			strBuffer.append("/");
			WEB_ROOT_URL = strBuffer.toString();
		}
		return WEB_ROOT_URL;
	}

	/**
	 * 返回Web端登录用户ID
	 * 
	 * @return
	 */
	public Long getWebLoginUser() {
		SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
		if (sysset == null) {
			return null;
		} else {
			if (sysset.getWebUser() == null) {
				return null;
			} else {
				return sysset.getWebUser().getId();
			}
		}
	}
	
	/**
	 * 返回Web端登录用户对象
	 * 
	 * @return
	 */
	public WebUser getWebLoginUserObj() {
		SystemSet sysset = (SystemSet) getRequest().getSession().getAttribute(XConst.SESSION_SYSSET);
		if (sysset == null) {
			return null;
		} else {
			if (sysset.getWebUser() == null) {
				return null;
			} else {
				return sysset.getWebUser();
			}
		}
	}

	/**
	 * 未登录跳转登录页面，登陆完跳回当前页面
	 * 
	 * @param mav
	 */
	public void goLogin(ModelAndView mav) {
		String redirect = getRequest().getServletPath();
		getRequest().getSession().setAttribute("redirect", redirect);
		String red = "/pc/login?op=toLogin";
		mav.setViewName("redirect:" + red);
	}
}
