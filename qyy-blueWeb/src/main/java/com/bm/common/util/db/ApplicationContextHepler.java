package com.bm.common.util.db;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * applicationContext 帮助类
 * 
 * @author mike
 *
 */
public class ApplicationContextHepler implements ApplicationContextAware {

	/**
	 * 不允许初始化
	 */
	private ApplicationContextHepler(){}
	
	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		applicationContext = context;
	}

	public static ApplicationContext getApplicationContext() {
//		String path = "org/ld/config/application.xml";
		String path = "/spring-app.xml";
		// 三种方式获取
		// 1. ApplicationContext ctx =new FileSystemXmlApplicationContext(path)；
		// 2.ApplicationContext ctx = new ClassPathXmlApplicationContext(path);
		// 3.0ServletContext servletContext =
		// request.getSession().getServletContext();
		// 3.1ApplicationContext ctx =
		// WebApplicationContextUtils.getWebApplicationContext(servletContext);
		try {
			//如果不能加载，则手利用第二种方式获取 
			if (applicationContext == null) {
				applicationContext = new ClassPathXmlApplicationContext(path);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applicationContext;
	}
	
}
