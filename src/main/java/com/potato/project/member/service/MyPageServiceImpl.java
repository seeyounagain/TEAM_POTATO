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
	public MemberVO memberBookSituation(MemberVO myPageVO) {
		return sqlSession.selectOne("myPageMapper.memberBookSituation",myPageVO);
	}
	
	//회원 정보 조회
	@Override
	public MemberVO selectMemberInfo(MemberVO myPageVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPageMapper.selectMemberInfo", myPageVO);
	}

}
