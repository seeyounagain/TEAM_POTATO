package com.potato.project.common.vo;

public class BookVO extends PageVO{
	
	// 책 정보 테이블 BOOK
	
	private String 	bookCode	  ; // BOOK_CODE  	    -- 책코드 (기본키 BOOK_0001)
	private String 	isbn		  ; // ISBN 		    -- 책 고유 코드 (UNIQUE)
	private String 	kdc			  ; // KDC	  		    -- 청구기호
	// 000 총류 100 철학 200 종교 300 사회과학 400 자연과학 500 기술과학 600 예술 700 언어 800 문학 900 역사
	private int		kdcNum		  ; // KDC_NUM 			-- 분류코드  0 1 2 3 4 5 6 7 8 9
	private String	kdcName		  ; // KDC_NAME 		-- 분류명
	private String 	writer		  ; // WRITER 		    -- 저자
	private String 	translator	  ; // TRANSLATOR 		-- 역자
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
	private String 	isDelete	  ; // IS_DELETE 		-- 책 정보 삭제 여부 (기본값 N )
	
	
	private BookImgVO bookImgVO	; // 이미지VO
	
	private String rentalId	; 		// 대여자 ID
	private String reserveId	; 	// 예약자 ID

	private String  rentalDate	;
	private String  returnDate	;
	private String  limitDate	;
	
	private String rentableStartDate	;
	private String rentableEndDate		;
	
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
	public int getKdcNum() {
		return kdcNum;
	}
	public void setKdcNum(int kdcNum) {
		this.kdcNum = kdcNum;
	}
	public String getKdcName() {
		return kdcName;
	}
	public void setKdcName(String kdcName) {
		this.kdcName = kdcName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
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
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public BookImgVO getBookImgVO() {
		return bookImgVO;
	}
	public void setBookImgVO(BookImgVO bookImgVO) {
		this.bookImgVO = bookImgVO;
	}
	public String getRentalId() {
		return rentalId;
	}
	public void setRentalId(String rentalId) {
		this.rentalId = rentalId;
	}
	public String getReserveId() {
		return reserveId;
	}
	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getLimitDate() {
		return limitDate;
	}
	public void setLimitDate(String limitDate) {
		this.limitDate = limitDate;
	}
	public String getRentableStartDate() {
		return rentableStartDate;
	}
	public void setRentableStartDate(String rentableStartDate) {
		this.rentableStartDate = rentableStartDate;
	}
	public String getRentableEndDate() {
		return rentableEndDate;
	}
	public void setRentableEndDate(String rentableEndDate) {
		this.rentableEndDate = rentableEndDate;
	}
	
	
	
}
