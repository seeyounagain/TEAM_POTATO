package com.potato.project.common.vo;

public class BookVO {
	
	// 책 정보 테이블 BOOK
	
	private String 	isbn		  ; // ISBN 		    -- 책 고유 코드 (UNIQUE)
	private String 	bookCode	  ; // BOOK_CODE  	    -- 책코드 (기본키 BOOK_0001)
	private String 	kdc			  ; // KDC	  		    -- 청구기호
	// 000 총류 100 철학 200 종교 300 사회과학 400 자연과학 500 기술과학 600 예술 700 언어 800 문학 900 역사
	private String  kdcName	  ; // KDC_NAME			-- 분류명  총류 철학 종교 사회과학 자연과학 기술과학 예술 언어 문학 역사
	private int		kdcNum		  ; // KDC_NUM 			-- 분류코드  0 1 2 3 4 5 6 7 8 9
	private String 	writer		  ; // WRITER 		    -- 저자
	private String 	title		  ; // TITLE 		    -- 표제
	private String 	page		  ; // PAGE 		    -- 쪽수 (숫자만 입력)
	private String  bookSize	  ; // BOOK_SIZE	    -- 크기 (150*150)
	private String 	keyword		  ; // KEYWORD    		-- 주제
	private String 	publisher	  ; // PUBLISHER   		-- 출판사
	private String 	pubDate		  ; // PUB_DATE    		-- 발행년 (연도 네자리만 입력)
	private String 	summary		  ; // SUMMARY 		    -- 책 요약
	private String 	intro		  ; // INTRO 		    -- 책 소개
	private String 	inputDate	  ; // INPUT_DATE	    -- 책 등록일
	private String 	area		  ; // AREA 		    -- 자료위치 (종합자료실1 종합자료실2 열람실 어린이실)
	private int 	status		  ; // STATUS 		    -- 책 상태 (기본값 0 대출가능 / 1 대출중 / 2 연체중 / 3 예약중)
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getKdc() {
		return kdc;
	}
	public void setKdc(String kdc) {
		this.kdc = kdc;
	}
	public String getKdcName() {
		return kdcName;
	}
	public void setKdcName(String kdcName) {
		this.kdcName = kdcName;
	}
	public int getKdcNum() {
		return kdcNum;
	}
	public void setKdcNum(int kdcNum) {
		this.kdcNum = kdcNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getBookSize() {
		return bookSize;
	}
	public void setBookSize(String bookSize) {
		this.bookSize = bookSize;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
