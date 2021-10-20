package com.potato.project.member.service;

import com.potato.project.member.vo.MemberVO;

public interface MemberService {
	
	// 회원 등록
	void insertMember(MemberVO memberVO);
	
	// 아이디 중복체크
	boolean selectMemberId(String id);
	
	// 로그인
	MemberVO selectMember(MemberVO memberVO);
	
}
