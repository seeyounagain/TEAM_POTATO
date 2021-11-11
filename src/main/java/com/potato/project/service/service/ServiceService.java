package com.potato.project.service.service;

import java.util.HashMap;
import java.util.List;

import com.potato.project.content.vo.NoticeVO;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.vo.ReadingRecordVO;
import com.potato.project.service.vo.ReadingSeatVO;
import com.potato.project.service.vo.RecommendVO;
import com.potato.project.service.vo.RequestBoardVO;

 
public interface ServiceService {
	
	//시트 리스트
	List<ReadingSeatVO> selectReadingSeat();
	
	//시트
	ReadingSeatVO chooseSeat(String seatCode);
	
	void seatUpdate(ReadingSeatVO seatVO);
	
	String seatIdCheck(String id);

	String seatMemberIdCheck(String id);
	
	void seatInRecord(ReadingSeatVO seatVO); 
	
	void seatOutRecord(ReadingSeatVO seatVO);
	
	List<ReadingRecordVO> seatRecordList();
	
	List<ReadingRecordVO> searchRecord(ReadingRecordVO recordVO);
	
	List<RequestBoardVO> requestBoardList(MemberVO loginInfo);
	
	MemberVO requestIdAndIsAdminCheck(MemberVO loginInfo);
	
	void regBookRequest(RequestBoardVO rbVO);
	
	int checkRequestCnt(MemberVO loginInfo);
	
	String checkISBN(String isbn);

	String checkISBNboolean(String isbn);
	
	void deleteBookRequest(RequestBoardVO rbVO);
	
	List<RequestBoardVO> requestBoardListAdmin();
	
	List<RequestBoardVO> requestBoardListAdminChooseYearMonth(String selectYearMonth);
	
	int ajaxRegRequest(RequestBoardVO rbVO);
	
	int ajaxRequestStatusChange(RequestBoardVO rbVO);

	String endDateForSearchRecord(ReadingRecordVO recordVO);
	
	//테스트용
	void recommendReg(RecommendVO rcVO);
	
	RecommendVO recommendBoard(String a);

	//추천 입력
	void insertRecommend(RecommendVO rcVO);
	
	String lastRcCode();
	
	//타이틀과 rc코드
	List<RecommendVO> rcList();
	
	void recommendUpdate(RecommendVO rcVO);
	
	int recommendDelete(RecommendVO rcVO);
}
