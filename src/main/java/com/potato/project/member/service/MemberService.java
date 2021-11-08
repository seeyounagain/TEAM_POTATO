package com.potato.project.member.service;

import java.util.List;

import com.potato.project.common.vo.MessageVO;
import com.potato.project.member.vo.MemberVO;

public interface MemberService {
	
	// 회원 등록
	void insertMember(MemberVO memberVO);
	
	// 아이디 중복체크
	boolean selectMemberId(String id);
	
	// 로그인
	MemberVO selectMember(MemberVO memberVO);
	
	// 읽지 않은 알림 갯수 조회
	int countUnreadMessage(String id);
	
	// 알림 목록 조회
	List<MessageVO> selectMessageList(MessageVO messageVO);
	
	// 알림 읽음으로 변경
	int updateMessageIsRead(String messageCode);
	
	// 알림 삭제
	int deleteMessage(String messageCode);
	
	// 아이디 찾기
	String findIdAjax(MemberVO memberVO);
	
	// 비밀번호 찾기
	String findPwAjax(MemberVO memberVO);

}
