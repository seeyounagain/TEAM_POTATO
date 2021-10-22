package com.potato.project.common.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.potato.project.common.service.CommonService;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.common.vo.MenuVO;


// 상단메뉴, 사이드메뉴를 조회하는 인터셉터
// 로그인 시 회원 또는 관리자 구별하여 메뉴 호출
public class MenuInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginInfo = (MemberVO)(session.getAttribute("loginInfo"));
		
		// 로그인 하지 않은 경우
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();

		}
		// menuVO 받아오기
		MenuVO menuVO = (MenuVO)(modelAndView.getModel().get("menuVO"));
		
		if (menuVO != null) {
			
			// 사이드 메뉴 전달
			modelAndView.addObject("sideMenuList",commonService.selectSideMenuList(menuVO));
			
		}
		
		// 메뉴 전달
		modelAndView.addObject("menuList",commonService.selectMenuList(loginInfo));
		
		
	}
	
}
