package com.potato.project.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.potato.project.member.vo.MemberVO;


// 상단메뉴, 사이드메뉴를 조회하는 인터셉터
// 로그인 시 회원 또는 관리자 구별하여 메뉴 호출
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginInfo = (MemberVO)(session.getAttribute("loginInfo"));
		
		// 로그인 되어있지 않다면 로그인 페이지로 이동
		if (loginInfo == null) {
			response.sendRedirect("/member/memberLoginForm");
			return false;
			// false -> 그만둠
		}
		
		// 로그인 되어있다면 게시글 상세 페이지(원래대로) 이동
		// true -> 모든 기능 실행 후 원래 요청으로 이동
		return true;
		
	}    
	
}
