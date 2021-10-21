package com.potato.project.content.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.common.vo.BookCateVO;
import com.potato.project.common.vo.BookVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 책 등록
	@Override
	public int insertBook(BookVO bookVO) {

		return sqlSession.insert("searchMapper.insertBook");
		
	}
	
	// 모든 도서(+ 이미지) 조회
	@Override
	public List<BookVO> selectBookList() {
		
		return sqlSession.selectList("searchMapper.selectBookList");
		
	}
	
	// 책 카테고리 조회
	@Override
	public List<BookCateVO> selectCateList() {
		
		return sqlSession.selectList("searchMapper.selectCateList");
		
	}
	
}