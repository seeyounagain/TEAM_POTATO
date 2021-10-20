package com.potato.project.content.service;

import java.util.List;

import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaVO;

public interface BoardService {

	//공지사항 리스트
	List<NoticeVO> selectNoticeList();
	
	//상담문의 리스트
	List<QnaVO> selectQnaList();
	
	//상담문의 입력
	void insertQna(QnaVO qnaVO);
	
}
