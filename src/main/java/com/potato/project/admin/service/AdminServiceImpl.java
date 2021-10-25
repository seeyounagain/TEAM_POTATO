package com.potato.project.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.RentalVO;

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
	
	// 도서 대여 정보 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertRental(RentalVO rentalVO) {
		
		sqlSession.insert("searchMapper.insertRental",rentalVO);
		
		return sqlSession.update("searchMapper.updateRentalStatus",rentalVO);
		
	}
	
}