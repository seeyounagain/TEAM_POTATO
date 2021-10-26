package com.potato.project.content.service;

import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

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
	public List<NoticeVO> selectNoticeList() {
		
		return sqlSession.selectList("boardMapper.selectNoticeList");
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
	
	//문의상담 목록 조회
	 @Override
	 public List<QnaVO> selectQnaList() {
		
		 return  sqlSession.selectList("boardMapper.selectQnaList");
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
	
	
}
