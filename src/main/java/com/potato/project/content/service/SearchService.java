package com.potato.project.content.service;

import java.util.List;

import com.potato.project.common.vo.BookCateVO;
import com.potato.project.common.vo.BookVO;

public interface SearchService {
	
	// 책 등록
	int insertBook(BookVO bookVO);
	
	// 모든 도서(+ 이미지) 조회
	List<BookVO> selectBookList();

	// 모든 도서(+ 이미지) 조회 + 페이징
	List<BookVO> selectBookListPaging(BookVO bookVO);
	
	// 도서 상세정보 (+ 이미지) 조회
	BookVO selectBookDetail(BookVO bookVO);
	
	// 책 카테고리 조회
	List<BookCateVO> selectCateList();
	
	// 상태별 도서 조회
	List<BookVO> selectStatusBookList(BookVO bookVO);
	
	// 책 이미지 코드 숫자 생성
	int selectImgCodeNum();
	
	// 책 코드 생성
	String selectBookCode();
	
	// 통합검색어에 따른 도서 목록 조회 + 페이징
	List<BookVO> selectSearchBookAndPaging(BookVO bookVO);
	
	// 통합검색 페이징 처리를 위한 도서 갯수 조회
	int countBookSearch(BookVO bookVO);
	
	// 상세검색 조건에 따른 도서 목록 조회 + 페이징
	List<BookVO> selectDetailSearchBookAndPaging(BookVO bookVO);
	
	// 상세검색 페이징 처리를 위한 도서 갯수 조회
	int countBookDetailSearch(BookVO bookVO);
	
	
}
