package com.potato.project.content.service;

import java.util.List;

import com.potato.project.common.vo.BookVO;

public interface SearchService {
	
	// 책 등록
	int insertBook(BookVO bookVO);
	
	// 모든 도서(+ 이미지) 조회 + 주제 들어올 시 주제로 조회 가능
	List<BookVO> selectBookList();
	
}
