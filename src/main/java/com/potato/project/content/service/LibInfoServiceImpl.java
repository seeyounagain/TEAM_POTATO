package com.potato.project.content.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.common.vo.BookCateVO;
//봉 생성
@Service("libInfoService")
public class LibInfoServiceImpl implements LibInfoService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//책종류, 책의 개수 구하기
	@Override
	public List<BookCateVO> bookCnt() {
		return sqlSession.selectList("libInfoMapper.bookCnt");
	}
	//책의 총 개수 구하기
	@Override
	public int totalBookCnt() {
		return sqlSession.selectOne("libInfoMapper.totalBookCnt");
	}
	//모든책 개수 구하기  최종 갱신일
	@Override
	public String bookLastUpdate() {
		return sqlSession.selectOne("libInfoMapper.bookLastUpdate");
	}
	
	
}
