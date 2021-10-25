package com.potato.project.admin.service;

import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.RentalVO;

public interface AdminService {
	
	// 도서 등록
	int insertBook(BookVO bookVO);
	
	// 도서 이미지 등록
	int insertBookImg(BookVO bookVO);
	
	// 도서 대여 정보 등록 + 도서 상태 변경
	int insertRental(RentalVO rentalVO);
	
	// ID로 대여&예약 도서 객수 조회
	int selectIdAllCount(String id);
	
}
