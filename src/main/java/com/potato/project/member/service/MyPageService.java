package com.potato.project.member.service;

import java.util.List;

import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;
import com.potato.project.content.vo.QnaVO;
import com.potato.project.member.vo.MemberVO;

public interface MyPageService {
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	MemberVO memberBookSituation(MemberVO memberVO);
	
	//----------------------내정보 시작----------------
	//내정보 조회
	MemberVO selectMemberInfo(MemberVO memberVO);
	
	//내정보에서  주소 분리해서 빼오기
	MemberVO selectMemberInfo2(MemberVO memberVO);
	
	//회원정보수정
	void updateMyInfo(MemberVO memberVO);
	
	//회원 비밀번호 수정
	boolean updatePw(MemberVO memberVO);
	
	//회원 탈퇴시 빌린책 있는지 여부
	boolean checkRENTALBook(MemberVO memberVO);
	
	//회원 탈퇴
	boolean checkMemberquit(MemberVO memberVO);
	//---------------------내정보 끝---------------
	
	
	//-----------------내문의 내역 시작-----------------
	//내상담문의 조회
	List<QnaVO> myQnaList(MemberVO memberVO);
	
	//내상담문의 총 갯수
	int myQnaCnt(MemberVO memberVO);
	
	//내상담문의 삭제
	boolean deleteMyQna(QnaVO qnaVO);
	
	//-----------------내문의 내역 끝-----------------
	
	
	//-------------------내 대출/예약현황 시작--------------------
	//내대출 현황 조회
	List<RentalVO> selectRentalList(MemberVO memberVO);
	
	//내대출 총 갯수
	int myRentalCnt(MemberVO memberVO);
	
	//내예약 현황 조회
	List<ReserveVO> selectReserveList(MemberVO memberVO);
	
}
