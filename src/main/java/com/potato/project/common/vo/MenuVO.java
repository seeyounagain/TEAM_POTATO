package com.potato.project.common.vo;

import java.util.List;

public class MenuVO {
	
	// 메뉴 테이블 MENU
	
	private String menuCode	;	  // MENU_CODE -- 메뉴 코드 (기본키 MENU_001)
	private String menuName	;	  // MENU_NAME -- 메뉴명
	private String menuUri	;	  // MENU_URI  -- 메뉴 경로
	private int    menuAuto	;	  // MENU_AUTO -- 메뉴번호 (권한) 0 공통, 1 이용자, 2 관리자
	
	private List<SideMenuVO> sideMenuList	;
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUri() {
		return menuUri;
	}
	public void setMenuUri(String menuUri) {
		this.menuUri = menuUri;
	}
	public int getMenuAuto() {
		return menuAuto;
	}
	public void setMenuAuto(int menuAuto) {
		this.menuAuto = menuAuto;
	}
	
	public List<SideMenuVO> getSideMenuList() {
		return sideMenuList;
	}
	public void setSideMenuList(List<SideMenuVO> sideMenuList) {
		this.sideMenuList = sideMenuList;
	}
	
	
}
