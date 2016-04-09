package com.bm.webs.bean.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.bm.webs.bean.WebUser;
import com.bm.webs.bean.system.AdminLogin;
import com.bm.webs.bean.system.AdminMenu;
import com.bm.webs.bean.system.AdminRight;
import com.bm.webs.bean.system.AdminRole;
import com.bm.webs.bean.system.AdminUser;

public class SystemSet implements Serializable {

	private static final long serialVersionUID = -4480610232912822611L;

	private String webappName;
	private String basePath;

	private AdminLogin user;
	private AdminRole role;
	private AdminUser u;
	private List<AdminMenu> meMenus;
	private Map<String, List<AdminRight>> meRightMap;
	private WebUser webUser;
	private String oldToken;
	
	
	
	
	

	public AdminUser getU() {
		return u;
	}

	public void setU(AdminUser u) {
		this.u = u;
	}

	public SystemSet() {
		super();
	}

	public String getWebappName() {
		return webappName;
	}

	public void setWebappName(String webappName) {
		this.webappName = webappName;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}



	public AdminLogin getUser() {
		return user;
	}

	public void setUser(AdminLogin user) {
		this.user = user;
	}

	public AdminRole getRole() {
		return role;
	}

	public void setRole(AdminRole role) {
		this.role = role;
	}

	public List<AdminMenu> getMeMenus() {
		return meMenus;
	}

	public void setMeMenus(List<AdminMenu> meMenus) {
		this.meMenus = meMenus;
	}

	public Map<String, List<AdminRight>> getMeRightMap() {
		return meRightMap;
	}

	public void setMeRightMap(Map<String, List<AdminRight>> meRightMap) {
		this.meRightMap = meRightMap;
	}

	

	public String getOldToken() {
		return oldToken;
	}

	public void setOldToken(String oldToken) {
		this.oldToken = oldToken;
	}

	public WebUser getWebUser() {
		return webUser;
	}

	public void setWebUser(WebUser webUser) {
		this.webUser = webUser;
	}

	
	

}
