package com.potato.project.content.service;

import java.util.List;

import com.potato.project.common.vo.BookCateVO;
import com.potato.project.common.vo.BookVO;

public interface SearchService {
	
	// 책 등록
	int insertBook(BookVO bookVO);
	
	// 모든 도서(+ 이미지) 조회
	List<BookVO> selectBookList();
	
	// 책 카테고리 조회
	List<BookCateVO> selectCateList();
	
	// 상태별 도서 조회
	List<BookVO> selectStatusBookList(BookVO bookVO);
	
	// 책 이미지 코드 숫자 생성
	int selectImgCodeNum();
	
	// 책 코드 생성
	String selectBookCode();
	
}
