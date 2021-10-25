package com.potato.project.member.service;

import com.potato.project.member.vo.MemberVO;

public interface MemberService {
	
	// 회원 등록
	void insertMember(MemberVO memberVO);
	
	// 아이디 중복체크
	boolean selectMemberId(String id);
	
	// 로그인
	MemberVO selectMember(MemberVO memberVO);
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	MemberVO memberBookSituation(MemberVO memberVO);
}
