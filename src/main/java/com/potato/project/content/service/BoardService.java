package com.potato.project.content.service;

import java.util.List;

import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaAnswerVO;
import com.potato.project.content.vo.QnaVO;

public interface BoardService {

	//공지사항 리스트
	List<NoticeVO> selectNoticeList(NoticeVO noticeVO);
	
	//메인에 띄울 공지사항 리스트
	List<NoticeVO> mainNoticeList();
	
	//메인 팝업 공지사항
	NoticeVO mainPopupNotice();
	
	//공지사항 총 개수
	int cntNotice(NoticeVO noticeVO);
	
	//공지사항 등록
	int insertNotice(NoticeVO noticeVO);
	
	//공지사항 파일 첨부
	int insertNoticeFile(NoticeVO noticeVO);
	
	//파일 첨부를 위한 공지사항 코드 생성
	String selectNoticeCode();
	
	//파일 첨부를 위한 파일 코드의 숫자 조회
	int nextFileCodeNum();
	
	//공지사항 상세보기
	NoticeVO selectNotice(NoticeVO noticeVO);
	
	//공지사항 삭제
	int deleteNotice(NoticeVO noticeVO);
	
	//조회수 증가
	int updateReadCnt(NoticeVO noticeVO);
	
	//공지사항 수정
	int updateNotice(NoticeVO noticeVO);
	
	//---------------------------------- 상담 문의 부분 -------------------------------------\\
	
	//상담문의 리스트
	List<QnaVO> selectQnaList(QnaVO qnaVO);
	
	int cntQna();
	
	//답변 등록 개수 + 업데이트
	int updateAcnt(QnaVO qnaVO);
	
	//답변 삭제 개수 - 업데이트
	int updateDeleteAcnt(QnaVO qnaVO);
	
	//상담문의 입력
	void insertQna(QnaVO qnaVO);
	
	//상담문의 상세보기
	QnaVO selectQna(QnaVO qnaVO);
	
	//상담문의 답변추가
	int insertAnswer(QnaAnswerVO qnaAnswerVO);
	
	//상담문의 답변 조회
	List<QnaAnswerVO> selectAnsewerList(QnaAnswerVO qnaAnswerVO);
	
	//문의글, 답변 동시 삭제
	int deleteQna(QnaVO qnaVO);
	
	//답변 하나 삭제
	int deleteAnswer(QnaVO qnaVO);
	
}
