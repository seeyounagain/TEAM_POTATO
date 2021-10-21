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
	
}
