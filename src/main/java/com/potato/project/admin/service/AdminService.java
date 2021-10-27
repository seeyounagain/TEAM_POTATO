package com.potato.project.admin.service;

import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;

public interface AdminService {
	
	// 도서 등록
	int insertBook(BookVO bookVO);
	
	// 도서 이미지 등록
	int insertBookImg(BookVO bookVO);
	
	// 도서 대여 정보 등록 + 도서 상태 변경
	int insertRental(RentalVO rentalVO,BookVO bookVO);
	
	// 도서 예약 정보 등록 + 도서 상태 변경
	int insertReserve(ReserveVO reserveVO,BookVO bookVO);
	
	// ID로 대여&예약 도서 객수 조회
	int selectIdAllCount(String id);
	
	// ID로 회원여부 조회
	int selectIsMember(String id);
	
	// 기간에 따른 신착도서 갯수 조회
	int countBookInputDate(BookVO bookVO);
	
}
