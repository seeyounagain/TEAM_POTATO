package com.potato.project.common.vo;

public class NoticeVO {

	
	// 공지사항 테이블 NOTICE
		
	private String noticeCode	;	// NOTICE_CODE 			-- 게시글번호 (기본키 NOTICE_001) 
	private String title		;	// TITLE 				-- 글제목
	private String writer		;	// WRITER  				-- 작성자 (외래키)
	private String content		;	// CONTENT 				-- 내용
	private String createDate	;	// CREATE_DATE 			-- 작성일
	private int readCnt			;	// READ_CNT 			-- 조회수
	
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	
}
