package com.potato.project.service.service;

import java.util.List;

import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.vo.ReadingRecordVO;
import com.potato.project.service.vo.ReadingSeatVO;
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
	
	int ajaxRegRequest(RequestBoardVO rbVO);
	
	int ajaxRequestStatusChange(RequestBoardVO rbVO);

	String endDateForSearchRecord(ReadingRecordVO recordVO);
}
