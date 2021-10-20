package com.potato.project.common.vo;

public class SideMenuVO {
	
	// 사이드 메뉴 테이블 SIDE_MENU
	
	private String sideMenuCode     ;		// SIDE_MENU_CODE   -- 사이드 메뉴 코드 (기본키 SIDE_MENU_001)
	private String sideMenuName     ;		// SIDE_MENU_NAME   -- 메뉴명 
	private String sideMenuUri      ;		// SIDE_MENU_URI    -- 메뉴 경로 
	private String menuCode			;       // MENU_CODE        -- 상위 메뉴 코드 (외래키)
	private String menuUri			;       // MENU_URI  		-- 메뉴 경로
	
	public String getSideMenuCode() {
		return sideMenuCode;
	}
	public void setSideMenuCode(String sideMenuCode) {
		this.sideMenuCode = sideMenuCode;
	}
	public String getSideMenuName() {
		return sideMenuName;
	}
	public void setSideMenuName(String sideMenuName) {
		this.sideMenuName = sideMenuName;
	}
	public String getSideMenuUri() {
		return sideMenuUri;
	}
	public void setSideMenuUri(String sideMenuUri) {
		this.sideMenuUri = sideMenuUri;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuUri() {
		return menuUri;
	}
	public void setMenuUri(String menuUri) {
		this.menuUri = menuUri;
	}
	
	
}
