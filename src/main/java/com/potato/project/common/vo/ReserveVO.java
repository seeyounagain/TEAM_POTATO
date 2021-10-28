package com.potato.project.common.vo;

public class ReserveVO {
	
	// 예약 정보 테이블 RESERVE
	
	private String reserveCode			;	// RESERVE_CODE 		-- 예약 코드 (기본키 RESERVE_0001)
	private String id					;	// ID           		-- 예약자 (외래키)
	private String bookCode				;	// BOOK_CODE    		-- 예약한책 (외래키)
	private String rentableStartDate	;	// RENTABLE_START_DATE  -- 대출 가능 시작일
	private String rentableEndDate		;	// RENTABLE_END_DATE	-- 대출 가능 마감일 (기존 책 반납일 다음날로부터 2일간)
	
	private BookVO bookVO		;
	
	public String getReserveCode() {
		return reserveCode;
	}
	public void setReserveCode(String reserveCode) {
		this.reserveCode = reserveCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
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
	public BookVO getBookVO() {
		return bookVO;
	}
	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}
   
	
}
