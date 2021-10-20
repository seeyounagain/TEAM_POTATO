package com.potato.project.content.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.content.vo.NoticeVO;
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

	//문의상담 목록 조회
	 @Override
	 public List<QnaVO> selectQnaList() {
		
		 return  sqlSession.selectList("boardMapper.selectQnaList");
	}

	@Override
	public void insertQna(QnaVO qnaVO) {
		
	}
	 

	

	
}
