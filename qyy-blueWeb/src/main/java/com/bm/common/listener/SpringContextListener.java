package com.bm.common.listener;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bm.common.util.sync.SyncTask;
import com.bm.common.util.sync.OrderHandler;
import com.bm.common.util.sync.thread.LocalTaskThread;
import com.bm.common.util.sync.thread.NetTaskThread;
import com.bm.webs.bean.PageData;
import com.bm.webs.service.web.WebFriendsService;

/**
 * 在controller之外获取applicationContext
 * 
 * @author mike
 * 
 */
public class SpringContextListener implements ServletContextListener {

	private static WebApplicationContext applicationContext;

	public SpringContextListener() {
		super();
	}

	public void contextInitialized(ServletContextEvent event) {
		try {
			applicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());

			NetTaskThread.newInstance();
			LocalTaskThread.newInstance();
			LocalTaskThread.addTask(new SyncTask("test1", new HashMap<String, Object>(), new OrderHandler()));
			LocalTaskThread.addTask(new SyncTask("test2", new HashMap<String, Object>(), new OrderHandler()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("SpringContextListener已经注销");
	}

	public static WebApplicationContext getSpringContext() {
		return applicationContext;
	}

	/**
	 * 返回友情连接
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<PageData> getFriendsLink() {
		try {
			WebFriendsService webFriendsService = applicationContext.getBean(WebFriendsService.class);
			PageData res = webFriendsService.friendList();
			return (List<PageData>) res.get("friendList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
