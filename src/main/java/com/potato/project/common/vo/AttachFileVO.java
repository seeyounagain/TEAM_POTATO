package com.potato.project.common.vo;

public class AttachFileVO {
	
	// 공지사항 게시판 첨부파일 테이블 ATTACH_FILE
	
	private String fileCode		 	;		//  FILE_CODE           -- 파일코드 (기본키 FILE_001)
	private String originFileName 	; 		//  ORIGIN_IMG_NAME     -- 실제 업로드 된 첨부파일명
	private String attachedFileName  ;		//  ATTACHED_IMG_NAME   -- 첨부된 첨부파일명
	private String noticeCode		;		//  NOTICE_CODE         -- 공지사항코드 (외래키)
	public AttachFileVO() {
			
	};
		
	public AttachFileVO(String fileCode, String originFileName, String attachedFileName, String noticeCode) {
		super();
		this.fileCode = fileCode;
		this.originFileName = originFileName;
		this.attachedFileName = attachedFileName;
		this.noticeCode = noticeCode;
	}
	
	public String getFileCode() {
		return fileCode;
	}
	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getAttachedFileName() {
		return attachedFileName;
	}
	public void setAttachedFileName(String attachedFileName) {
		this.attachedFileName = attachedFileName;
	}
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	
	
}
