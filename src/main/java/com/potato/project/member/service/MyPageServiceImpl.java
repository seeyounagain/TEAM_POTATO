package com.potato.project.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.member.vo.MemberVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	@Override
	public MemberVO memberBookSituation(MemberVO memberVO) {
		return sqlSession.selectOne("myPageMapper.memberBookSituation",memberVO);
	}
	
	//회원 정보 조회
	@Override
	public MemberVO selectMemberInfo(MemberVO memberVO) {
		return sqlSession.selectOne("myPageMapper.selectMemberInfo", memberVO);
	}
	
	//전화번호 길이 구하기
	@Override
	public MemberVO selectTellCnt(MemberVO myPageVO) {
		return sqlSession.selectOne("myPageMapper.selectTellCnt", myPageVO);
	}
	
	//전화번호 다시 하나씩 뺴오기
	@Override
	public MemberVO selectTell(MemberVO memberVO) {
		return sqlSession.selectOne("myPageMapper.selectTell", memberVO);
	}
	
	//회원정보 수정
	@Override
	public void updateMyInfo(MemberVO memberVO) {
		sqlSession.update("myPageMapper.updateMyInfo", memberVO);
		
	}

	@Override
	public void updatePw(MemberVO memberVO) {
		sqlSession.update("myPageMapper.updatePw",memberVO);
		
	}

	@Override
	public boolean checkMemberquit(MemberVO memberVO) {
		int result = sqlSession.update("myPageMapper.checkMemberquit", memberVO);
		return result == 0 ? false : true ;
	}

}
