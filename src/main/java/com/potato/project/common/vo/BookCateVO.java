package com.potato.project.common.vo;

import java.util.List;

public class BookCateVO {
	
	// 책 카테고리 테이블 BOOK_CATE
	
	private int kdcNum				;	// KDC_NUM	-- 분류코드 0 1 2 3 4 5 6 7 8 9
	private String kdcName			;	// KDC_NAME	-- 분류명 총류 철학 종교 사회과학 자연과학 기술과학 예술 언어 문학 역사
	
	// 카테고리 내 책 리스트
	private List<BookVO> bookList	;
	//카테고리명의 책의 개수
	private int kdcCnt             ;   // BOOK_CNT -- 숫자로 나옴 0부터 뭐...많으면 거기까지
	

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

	public List<BookVO> getBookList() {
		return bookList;
	}

	public void setBookList(List<BookVO> bookList) {
		this.bookList = bookList;
	}

	public int getKdcCnt() {
		return kdcCnt;
	}

	public void setKdcCnt(int kdcCnt) {
		this.kdcCnt = kdcCnt;
	}
	
	
	
}
