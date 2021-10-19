package com.potato.project.common.vo;

public class AttachFileVO {
	
	// 공지사항 게시판 첨부파일 테이블 ATTACH_FILE
	
	private String fileCode		 	;		//  FILE_CODE           -- 파일코드 (기본키 FILE_001)
	private String originImgName 	; 		//  ORIGIN_IMG_NAME     -- 실제 업로드 된 첨부파일명
	private String attachedImgName  ;		//  ATTACHED_IMG_NAME   -- 첨부된 첨부파일명
	private String noticeCode		;		//  NOTICE_CODE         -- 공지사항코드 (외래키)
	
	public String getFileCode() {
		return fileCode;
	}
	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
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
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	
	
}
