package com.potato.project.admin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.potato.project.common.util.FileUploadUtil;
import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.MessageVO;
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
		
		// 예약자 있을 경우 도서상태 대출대기중으로 변경, 도서 대출가능 기간 업데이트, 알람 전송
		if (bookVO.getStatus() == 5) {
			sqlSession.update("searchMapper.updateReserveDate",bookVO);
			
			MessageVO messageVO = new MessageVO();
			messageVO.setToId(bookVO.getReserveId());
			messageVO.setContent("예약하신 도서의 반납이 완료되었습니다. 기간내에 대출해주세요. 자세한 사항은 '나의도서관' 페이지에서 확인 가능합니다.");
			
			sqlSession.insert("memberMapper.insertMessage",messageVO);
			
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
	
	// 회원정보 & 회원이 보유한 대여, 예약 권수 조회 + 페이징
	@Override
	public List<MemberVO> selectMemberListAndBookCnt(MemberVO memberVO) {
		
		return sqlSession.selectList("memberMapper.selectMemberListAndBookCnt",memberVO);
		
	}
	
	// 회원이 보유한 대여 도서 정보 조회
	@Override
	public List<RentalVO> selectMemberRentalList(String id) {
		
		return sqlSession.selectList("searchMapper.selectMemberRentalList",id);
				
	}

	// 회원이 보유한 예약 도서 정보 조회
	@Override
	public List<ReserveVO> selectMemberReserveList(String id) {
		
		return sqlSession.selectList("searchMapper.selectMemberReserveList",id);
		
	}
	
	// 회원이 대출 중인 도서 목록 조회 + 반납 기간 지난 도서 연체중으로 상태 변경 + 알림 전송
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int selectRentalListAndOverRentalUpdate(MemberVO memberVO) {
		
		// 회원이 대출 중인 도서 목록 조회
		List<RentalVO> rentalList = sqlSession.selectList("searchMapper.selectMemberRentalList",memberVO);
		
		// 현재 날짜 구하기
		String now = FileUploadUtil.getNowDate();
		// 날짜 비교를 위한 포맷 지정
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// alert 띄우기 위한 연체도서 cnt
		int overCnt = 0;
		
		for (RentalVO vo : rentalList) {
			
			// 조회된 도서들의 반납기한과 현재 날짜 비교
			try {
				
				// 같은 포맷으로 만들기
				Date date1 = dateFormat.parse(now);
				Date date2 = dateFormat.parse(vo.getLimitDate());
				
				// result가 true면 현재날짜 > 반납기한
				boolean result = date1.after(date2);
				
				if (result) {
					// 반납기한 지난 도서들 각각 상태 연체중으로 변경
					BookVO bookVO = new BookVO();
					bookVO.setBookCode(vo.getBookCode());
					bookVO.setStatus(3);
					sqlSession.update("searchMapper.updateBookStatus",bookVO);
					// 알림 전송
					MessageVO messageVO = new MessageVO();
					messageVO.setToId(memberVO.getId());
					messageVO.setContent("대출 중이신 도서가 연체중입니다. 도서를 반납해주세요. 자세한 사항은 '나의도서관' 페이지에서 확인 가능합니다.");
					sqlSession.insert("memberMapper.insertMessage",messageVO);
					overCnt++;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		return overCnt;
	}

	
	// 회원의 예약 정보 중 대출가능인 도서 조회 + 기간이 지난 도서 정보 삭제 + 알림 전송
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int selectReserveStatusIsWaitAndDeleteReserveDateIsOver(MemberVO memberVO) {
		
		List<ReserveVO> reserveList = sqlSession.selectList("searchMapper.selectMemberReserveStatusIsWait",memberVO);

		// 현재 날짜 구하기
		String now = FileUploadUtil.getNowDate();
		// 날짜 비교를 위한 포맷 지정
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// alert 띄우기 위한 기한 지난 도서 cnt
		int overCnt = 0;
		
		// 대출가능 기한이 지난 도서가 있다면
		for (ReserveVO vo : reserveList) {
			
			// 조회된 도서들의 반납기한과 현재 날짜 비교
			try {
				
				// 같은 포맷으로 만들기
				Date date1 = dateFormat.parse(now);
				Date date2 = dateFormat.parse(vo.getRentableEndDate());
				
				// result가 true면 현재날짜 > 대출기한
				boolean result = date1.after(date2);
				
				if (result) {
					// 대출기한 지난 도서들 예약 정보 삭제
					sqlSession.delete("searchMapper.deleteReserveDateIsOver",vo.getReserveCode());
					// 알림 전송
					MessageVO messageVO = new MessageVO();
					messageVO.setToId(memberVO.getId());
					messageVO.setContent("예약하신 도서의 대출가능 기간이 초과되어 예약이 취소되었습니다. 자세한 사항은 '나의도서관' 페이지에서 확인 가능합니다.");
					sqlSession.insert("memberMapper.insertMessage",messageVO);
					// 도서 상태 변경
					BookVO bookVO = new BookVO();
					bookVO.setBookCode(vo.getBookCode());
					bookVO.setStatus(1);
					sqlSession.update("searchMapper.updateBookStatus",bookVO);
					overCnt++;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		return overCnt;
		
	}
	
	// 회원이 대출 중인 도서 중 예약하려는 도서 조회
	@Override
	public int isMemeberRental(RentalVO rentalVO) {
		
		return sqlSession.selectOne("searchMapper.selectIsMemeberRental",rentalVO);
		
	}
	
	// 검색어 결과에 따른 회원수 조회
	@Override
	public int countMemberAndSearchId(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.countMember",memberVO);
		
	}
	
	// 도서 정보 수정
	@Override
	public int updateBookInfo(BookVO bookVO) {
		
		return sqlSession.update("searchMapper.updateBookInfo",bookVO);
		
	}
	
	// 회원에게 알람 전송
	@Override
	public int sendMessage(MessageVO messageVO) {
		
		return sqlSession.insert("memberMapper.insertMessage",messageVO);
		
	}
	
	// 도서 정보 조회 후 삭제 여부 문자 리턴
	@Override
	public String selectBookInfoAndDeleteBookisDeleteYorN(String bookCode) {
		
		String isDelete;
		
		int result = sqlSession.selectOne("searchMapper.selectBookInfoCnt",bookCode);
		
		// 도서의 대여 혹은 예약 정보가 있다면 N
		if (result != 0) {
			isDelete = "N";
		}
		// 정보가 없다면 (삭제 가능한 상태라면) 삭제 후 Y
		else {
			sqlSession.update("searchMapper.deleteBookInfo",bookCode);
			isDelete = "Y";
		}
		
		return isDelete;
		
	}

	
	
	
	
}