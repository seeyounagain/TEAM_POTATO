package com.potato.project.member.service;

import com.potato.project.member.vo.MemberVO;

public interface MyPageService {
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	MemberVO memberBookSituation(MemberVO myPageVO);
	
	//회원정보 조회
	MemberVO selectMemberInfo(MemberVO myPageVO);

}
