package com.potato.project.content.service;

import java.util.List;

import com.potato.project.common.vo.BookCateVO;

public interface LibInfoService {
//봉 생성
	
	//책종류, 책의 개수 구하기
	List<BookCateVO> bookCnt();
	
	//책의 총 개수 구하기
	int totalBookCnt();
	
	//모든책 개수 구하기  최종 갱신일
	
	String bookLastUpdate();
}
