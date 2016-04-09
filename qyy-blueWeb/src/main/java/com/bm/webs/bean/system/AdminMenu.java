package com.bm.webs.bean.system;

import java.io.Serializable;
import java.util.List;

public class AdminMenu implements Serializable {

	private static final long serialVersionUID = -3414576325050885179L;

	protected Integer id;
	protected String stutas;

	private String menuKey;
	private String menuName;
	private Integer isRoot;
	private Integer isParent;
	private String parentKey;
	private String menuIcon;
	private String menuPath;
	private Integer menuType;
	private Integer menuOrder;

	private Integer isShow = 1;//默认不显示

	private List<AdminMenu> subMenu;
	private List<AdminRight> rights;

	public AdminMenu() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStutas() {
		return stutas;
	}

	public void setStutas(String stutas) {
		this.stutas = stutas;
	}

	public String getMenuKey() {
		return menuKey;
	}

	public void setMenuKey(String menuKey) {
		this.menuKey = menuKey;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getIsRoot() {
		return isRoot;
	}

	public void setIsRoot(Integer isRoot) {
		this.isRoot = isRoot;
	}

	public Integer getIsParent() {
		return isParent;
	}

	public void setIsParent(Integer isParent) {
		this.isParent = isParent;
	}

	public String getParentKey() {
		return parentKey;
	}

	public void setParentKey(String parentKey) {
		this.parentKey = parentKey;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	public Integer getMenuType() {
		return menuType;
	}

	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	public Integer getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(Integer menuOrder) {
		this.menuOrder = menuOrder;
	}

	public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

	public List<AdminMenu> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<AdminMenu> subMenu) {
		this.subMenu = subMenu;
	}

	public List<AdminRight> getRights() {
		return rights;
	}

	public void setRights(List<AdminRight> rights) {
		this.rights = rights;
	}

}
