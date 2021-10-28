package com.potato.project.member.service;

import com.potato.project.member.vo.MemberVO;

public interface MyPageService {
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	MemberVO memberBookSituation(MemberVO memberVO);
	
	//회원정보 조회
	MemberVO selectMemberInfo(MemberVO memberVO);
	
	//전화번호 길이 조회
	MemberVO selectTellCnt(MemberVO memberVO);
	
	//전화번호 다시 하나씩 뺴오기
	MemberVO selectTell(MemberVO memberVO);
	
	//회원정보수정
	void updateMyInfo(MemberVO memberVO);
	
	//회원 비밀번호 수정
	void updatePw(MemberVO memberVO);
	
	//회원 탈퇴
	boolean checkMemberquit(MemberVO memberVO);

}
