package com.potato.project.content.service;

import java.util.List;

import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaVO;

public interface BoardService {

	//공지사항 리스트
	List<NoticeVO> selectNoticeList();
	
	//공지사항 입력
	int insertNotice(NoticeVO noticeVO);
	
	//공지사항 파일 첨부
	int insertNoticeFile(NoticeVO noticeVO);
	
	//파일 첨부를 위한 공지사항 코드 생성
	String selectNoticeCode();
	
	//파일 첨부를 위한 파일 코드의 숫자 조회
	int nextFileCodeNum();
	
	//상담문의 리스트
	List<QnaVO> selectQnaList();
	
	//상담문의 입력
	void insertQna(QnaVO qnaVO);
	
	//상담문의 상세보기
	QnaVO selectQna(QnaVO qnaVO);
}
