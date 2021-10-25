package com.potato.project.content.vo;

public class QnaVO extends QnaAnswerVO{

	// 문의/상담 테이블 QNA

	private String qnaCode;		//  QNA_CODE	-- 게시글번호 (기본키 QNA_001)
	private String title;		//  TITLE		-- 글제목
	private String writer;		//  WRITER		-- 작성자 (외래키 ID)
	private String content;		//  CONTENT		-- 내용
	private String createDate;	//  CREATE_DATE	-- 작성일
	private String qnaPw;		//  QNA_PW		-- 비밀번호 (NULL이 아닐경우 비밀글)
	
	public String getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
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
	public String getQnaPw() {
		return qnaPw;
	}
	public void setQnaPw(String qnaPw) {
		this.qnaPw = qnaPw;
	}
	
	
}
