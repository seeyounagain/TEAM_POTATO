package com.potato.project.content.service;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaAnswerVO;
import com.potato.project.content.vo.QnaVO;

@Service("boardService")
public class BoardServiceImpl  implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//공지사항 목록 조회
	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO noticeVO) {
		
		return sqlSession.selectList("boardMapper.selectNoticeList", noticeVO);
	}
	
	//공지사항 등록
	@Override
	public int insertNotice(NoticeVO noticeVO) {
		
		return sqlSession.insert("boardMapper.insertNotice", noticeVO);
	}

	//파일 첨부를 위한 공지사항 코드	
	@Override
	public String selectNoticeCode() {
		
		return sqlSession.selectOne("boardMapper.selectNoticeCode");
	}
	
	//파일 첨부를 위한 파일 코드 넘버 조회
	@Override
	public int nextFileCodeNum() {
		
		return sqlSession.selectOne("boardMapper.nextFileCodeNum");
	}
	
	//공지사항 파일 첨부
	@Override
	public int insertNoticeFile(NoticeVO noticeVO) {

		return sqlSession.insert("boardMapper.insertNoticeFile", noticeVO);
	}
	
	//공지사항 상세보기
	@Override
	public NoticeVO selectNotice(NoticeVO noticeVO) {

		return sqlSession.selectOne("boardMapper.selectNotice", noticeVO);
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		
		return sqlSession.delete("boardMapper.deleteNotice", noticeVO);
	}
	
	//공지사항 조회수 증가
	@Override
	public int updateReadCnt(NoticeVO noticeVO) {
	
		return sqlSession.update("boardMapper.updateReadCnt", noticeVO);
	}

	//공지사항 총 개수
	@Override
	public int cntNotice(NoticeVO noticeVO) {

		return sqlSession.selectOne("boardMapper.cntNotice", noticeVO);
	}
	
	//메인에 띄울 공지사항 리스트
	@Override
	public List<NoticeVO> mainNoticeList() {
		
		return sqlSession.selectList("boardMapper.mainNoticeList");
	}

	//메인 팝업 공지사항
	@Override 
	public NoticeVO mainPopupNotice() {
	 
		return sqlSession.selectOne("boardMapper.mainPopupNotice"); 
	}
	
	//공지사항 수정
	@Override
	public int updateNotice(NoticeVO noticeVO) {

		return sqlSession.update("boardMapper.updateNotice", noticeVO);
	}

	
	//----------------------------------상담문의 부분 ------------------------\\
	
	
	
	//문의상담 목록 조회
	 @Override
	 public List<QnaVO> selectQnaList(QnaVO qnaVO) {
		
		 return  sqlSession.selectList("boardMapper.selectQnaList", qnaVO);
	}
	
	 //상담문의 입력
	@Override
	public void insertQna(QnaVO qnaVO) {
		sqlSession.insert("boardMapper.insertQna", qnaVO);
	}

	//상담문의 상세보기
	@Override
	public QnaVO selectQna(QnaVO qnaVO) {
		
		return sqlSession.selectOne("boardMapper.selectQna", qnaVO);
	}

	//상담문의 답변 추가
	@Override
	public int insertAnswer(QnaAnswerVO qnaAnswerVO) {

		return sqlSession.insert("boardMapper.insertAnswer", qnaAnswerVO);
	}

	//상담문의 답변 조회
	@Override
	public List<QnaAnswerVO> selectAnsewerList(QnaAnswerVO qnaAnswerVO) {

		return sqlSession.selectList("boardMapper.selectAnsewerList", qnaAnswerVO);
	}
	
	//문의, 답변 동시 삭제
	@Override
	public int deleteQna(QnaVO qnaVO) {

		return sqlSession.delete("boardMapper.deleteQna", qnaVO);
	}
	
	//답변 등록 개수 + 업데이트
	@Override
	public int updateAcnt(QnaVO qnaVO) {

		return sqlSession.update("boardMapper.updateAcnt", qnaVO);
	}
	
	//답변 삭제 개수 - 업데이트
	@Override
	public int updateDeleteAcnt(QnaVO qnaVO) {
		
		return sqlSession.update("boardMapper.updateDeleteAcnt", qnaVO);
		
	}
	
	//문의상담 총 개수
	@Override
	public int cntQna() {
		
		return sqlSession.selectOne("boardMapper.cntQna");
	}

	//답변 하나만 삭제
	@Override
	public int deleteAnswer(QnaVO qnaVO) {

		return sqlSession.delete("boardMapper.deleteAnswer", qnaVO);
	}

	

	
	
	
	
}
