package com.potato.project.common.vo;

public class RentalVO {
	
	// 대여 정보 테이블 RENTAL
		
	private String  rentalCode   ;    // RENTAL_CODE  -- 대여 코드 (기본키 RENTAL_0001)
	private String  id        	 ;    // ID           -- 대출자 (외래키)
	private String  bookCode     ;    // BOOK_CODE    -- 대출한책 코드 (외래키)
	private String  rentalDate   ;    // RENTAL_DATE  -- 대출일
	private String  returnDate   ;    // RETURN_DATE  -- 반납일 (대출일 + 7일)
	
	
	public String getRentalCode() {
		return rentalCode;
	}
	public void setRentalCode(String rentalCode) {
		this.rentalCode = rentalCode;
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
	 

}
