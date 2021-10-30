package com.potato.project.content.vo;

import com.potato.project.common.vo.AttachFileVO;
import com.potato.project.common.vo.PageVO;

public class NoticeVO extends PageVO {

	
	// 공지사항 테이블 NOTICE
		
	private String noticeCode	;		// NOTICE_CODE 			-- 게시글번호 (기본키 NOTICE_001)
	private String title		;		// TITLE 				-- 글제목
	private String id		    ;		// ID    				-- 작성자 (외래키)
	private String name			;		// NAME					-- 작성자 이름	
	private String content		;		// CONTENT 				-- 내용
	private String createDate	;		// CREATE_DATE 			-- 작성일
	private int readCnt			;		// READ_CNT 			-- 조회수
	
	private AttachFileVO attachFileVO; 	//첨부파일 VO
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public AttachFileVO getAttachFileVO() {
		return attachFileVO;
	}
	public void setAttachFileVO(AttachFileVO attachFileVO) {
		this.attachFileVO = attachFileVO;
	}
	
	
	
}
