package com.potato.project.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;
import com.potato.project.member.vo.MemberVO;

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
		
		// 대출대기중 -> 예약자가 대출할 경우 예약 데이터 삭제
		System.out.println("!!!!!!!!!!예약자 아이디 : " + bookVO.getReserveId());
		if (bookVO.getReserveId() != null) {
			sqlSession.delete("searchMapper.deleteReserve",bookVO);
		}
		
		sqlSession.insert("searchMapper.insertRental",rentalVO);
		
		
		return sqlSession.update("searchMapper.updateBookStatus",bookVO);
		
	}
	
	// 도서 예약 정보 등록 + 상태 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReserve(ReserveVO reserveVO, BookVO bookVO) {
		
		sqlSession.insert("searchMapper.insertReserve",reserveVO);
		
		return sqlSession.update("searchMapper.updateBookStatus",bookVO);
		
	}
	
	// 도서 반납일 업데이트 + 도서 상태 변경 + 예약자 유무에 따라 데이터 업데이트
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReturn(ReserveVO reserveVO, BookVO bookVO) {
		
		// 예약자 있을 경우 도서상태 대출대기중으로 변경, 도서 대출가능 기간 업데이트
		if (bookVO.getStatus() == 5) {
			sqlSession.update("searchMapper.updateReserveDate",bookVO);
		}
		sqlSession.update("searchMapper.updateBookStatus",bookVO);
		
		return sqlSession.update("searchMapper.updateReturnDate",reserveVO);
		
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
	
	// 회원정보 & 회원이 보유한 대여, 예약 권수 조회
	@Override
	public List<MemberVO> selectMemberListAndBookCnt() {
		
		return sqlSession.selectList("memberMapper.selectMemberListAndBookCnt");
		
	}
	
	
}