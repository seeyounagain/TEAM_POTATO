package com.potato.project.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 도서 등록
	@Override
	public int insertBook(BookVO bookVO) {
		
		return sqlSession.insert("searchMapper.insertBook",bookVO);
				
	}
	
	// 도서 이미지 등록
	@Override
	public int insertBookImg(BookVO bookVO) {
		
		return sqlSession.insert("searchMapper.insertBookImg",bookVO);
		
	}
	
	// 도서 대여 정보 등록 + 상태 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertRental(RentalVO rentalVO,BookVO bookVO) {
		
		sqlSession.insert("searchMapper.insertRental",rentalVO);
		
		return sqlSession.update("searchMapper.updateBookStatus",bookVO);
		
	}
	
	// ID로 대여&예약 도서 객수 조회
	@Override
	public int selectIdAllCount(String id) {
		
		return sqlSession.selectOne("searchMapper.selectIdAllCount",id);
		
	}
	
	// ID로 회원여부 조회
	@Override
	public int selectIsMember(String id) {
		
		return sqlSession.selectOne("searchMapper.selectIsMember",id);
	}
	
	// 기간에 따른 신착도서 갯수 조회()
	@Override
	public int countBookInputDate(BookVO bookVO) {
		
		return sqlSession.selectOne("searchMapper.countBook",bookVO);
		
	}
	
	// 도서 예약 정보 등록 + 상태 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReserve(ReserveVO reserveVO, BookVO bookVO) {
		
		sqlSession.insert("searchMapper.insertReserve",reserveVO);
		
		return sqlSession.update("searchMapper.updateBookStatus",bookVO);
		
	}
	
}