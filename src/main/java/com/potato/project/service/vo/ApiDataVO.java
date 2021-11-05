package com.potato.project.service.vo;

public class ApiDataVO {
	
	private String titleInfo 		; //제목
	private String typeName 		; //카테고리
	private String authorInfo		; //저자
	private String menuName			; //메뉴명
	private String mediaName		; //매체구분
	private String pubYearInfo		; //발행년도
	private String isbn				; //ISBN
	private String kdcCode1s		; //동양서분류기호 대분류 코드
	private String kdcName1s		; //동양서분류기호 대분류 명칭

	public ApiDataVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApiDataVO(String titleInfo
					, String typeName
					, String authorInfo
					, String menuName
					, String mediaName
					, String pubYearInfo
					, String isbn
					, String kdcCode1s
					, String kdcName1s
						) {
		super();
		this.titleInfo = titleInfo;
		this.typeName = typeName;
		this.authorInfo = authorInfo;
		this.menuName = menuName;
		this.mediaName = mediaName;
		this.pubYearInfo = pubYearInfo;
		this.isbn = isbn;
		this.kdcCode1s = kdcCode1s;
		this.kdcName1s = kdcName1s;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getAuthorInfo() {
		return authorInfo;
	}
	public void setAuthorInfo(String authorInfo) {
		this.authorInfo = authorInfo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMediaName() {
		return mediaName;
	}
	public void setMediaName(String mediaName) {
		this.mediaName = mediaName;
	}
	public String getPubYearInfo() {
		return pubYearInfo;
	}
	public void setPubYearInfo(String pubYearInfo) {
		this.pubYearInfo = pubYearInfo;
	}
	public String getIsbn() {
		return isbn;
	}
	public String getTitleInfo() {
		return titleInfo;
	}
	public void setTitleInfo(String titleInfo) {
		this.titleInfo = titleInfo;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getKdcCode1s() {
		return kdcCode1s;
	}
	public void setKdcCode1s(String kdcCode1s) {
		this.kdcCode1s = kdcCode1s;
	}
	public String getKdcName1s() {
		return kdcName1s;
	}
	public void setKdcName1s(String kdcName1s) {
		this.kdcName1s = kdcName1s;
	}
	
	
	



	
	
	
	
	
	
	
	

	
	
	

}
