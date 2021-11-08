package com.potato.project.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.common.vo.MessageVO;
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
	
	// 읽지 않은 알림 갯수 조회
	@Override
	public int countUnreadMessage(String id) {

		return sqlSession.selectOne("memberMapper.countUnreadMessage",id);
		
	}
	
	// 알림 목록 조회
	@Override
	public List<MessageVO> selectMessageList(MessageVO messageVO) {
		
		return sqlSession.selectList("memberMapper.selectMemberMessage",messageVO);
		
	}
	
	// 알림 읽음으로 변경
	@Override
	public int updateMessageIsRead(String messageCode) {
		
		return sqlSession.update("memberMapper.updateMessageRead",messageCode);
		
	}
	
	// 알림 삭제
	@Override
	public int deleteMessage(String messageCode) {
		
		return sqlSession.delete("memberMapper.deleteMessage",messageCode);
		
	}
	
	// 아이디 찾기
	@Override
	public String findIdAjax(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.findIdFromNameAndBirth",memberVO);
		
	}
	
	// 비밀번호 찾기
	@Override
	public String findPwAjax(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.findPwFromIdAndTellAndBirth",memberVO);
		
	}

	
}
