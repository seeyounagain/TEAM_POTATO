package com.potato.project.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원 등록
	@Override
	public void insertMember(MemberVO memberVO) {
		
		sqlSession.insert("memberMapper.insertMember", memberVO);
		
	}
	
	// 아이디 중복체크
	@Override
	public boolean selectMemberId(String id) {
		
		String result = sqlSession.selectOne("memberMapper.selectMemberId", id);
		// true = 중복아이디존재 false = 아이디생성가능
		return result == null ? false : true;
			
	}
	
	// 로그인
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.selectMember",memberVO);
		
	}
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	@Override
	public MemberVO memberBookSituation(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.memberBookSituation",memberVO);
	}
	
}
