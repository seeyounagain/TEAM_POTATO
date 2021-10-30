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

	// 상태별 도서 조회
	@Override
	public List<BookVO> selectStatusBookList(BookVO bookVO) {
		
		return sqlSession.selectList("searchMapper.selectStatusBookList",bookVO);
		
	}
	
	// 책 이미지 코드 숫자 생성
	@Override
	public int selectImgCodeNum() {
		
		return sqlSession.selectOne("searchMapper.selectImgCodeNum");
		
	}

	// 책 코드 생성
	@Override
	public String selectBookCode() {
		
		return sqlSession.selectOne("searchMapper.selectBookCode");
		
	}
	
	// 도서 상세정보 조회 (+ 이미지)
	@Override
	public BookVO selectBookDetail(BookVO bookVO) {

		return sqlSession.selectOne("searchMapper.selectBookDetail",bookVO);
		
	}
	
	// 모든 도서(+ 이미지) 조회 + 페이징
	@Override
	public List<BookVO> selectBookListPaging(BookVO bookVO) {
		
		return sqlSession.selectList("searchMapper.selectBookListPaging",bookVO);
		
	}
	
	// 통합검색어에 따른 도서 목록 조회 + 페이징
	@Override
	public List<BookVO> selectSearchBookAndPaging(BookVO bookVO) {
		
		return sqlSession.selectList("searchMapper.selectSearchBookAndPaging",bookVO);
		
	}

	// 통합검색 페이징 처리를 위한 도서 갯수 조회
	@Override
	public int countBookSearch(BookVO bookVO) {
		
		return sqlSession.selectOne("searchMapper.countBookSearch",bookVO);
		
	}
	
	// 상세검색 조건에 따른 도서 목록 조회 + 페이징
	@Override
	public List<BookVO> selectDetailSearchBookAndPaging(BookVO bookVO) {
		
		return sqlSession.selectList("searchMapper.selectDetailSearchBookAndPaging",bookVO);
		
	}
	
	// 상세검색 페이징 처리를 위한 도서 갯수 조회
	@Override
	public int countBookDetailSearch(BookVO bookVO) {
		
		return sqlSession.selectOne("searchMapper.countBookDetailSearch",bookVO);
		
	}
	
	
}
