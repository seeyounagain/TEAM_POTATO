package com.potato.project.common.vo;

public class BookImgVO {

	// 이미지 테이블 BOOK_IMG
	
	private String imgCode		 	;		//  IMG_CODE            -- 이미지 코드 (기본키 IMG_0001)
	private String originImgName 	; 		//  ORIGIN_IMG_NAME     -- 실제 업로드 된 첨부파일명
	private String attachedImgName  ;		//  ATTACHED_IMG_NAME   -- 첨부된 첨부파일명
	private String bookCode			;		//  BOOK_CODE           -- 책코드 (외래키)
	
	
	public BookImgVO() {
		
	};
	
	public BookImgVO(String imgCode, String originImgName, String attachedImgName, String bookCode) {
		super();
		this.imgCode = imgCode;
		this.originImgName = originImgName;
		this.attachedImgName = attachedImgName;
		this.bookCode = bookCode;
	}
	
	public String getImgCode() {
		return imgCode;
	}
	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}
	public String getOriginImgName() {
		return originImgName;
	}
	public void setOriginImgName(String originImgName) {
		this.originImgName = originImgName;
	}
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	
	
}
