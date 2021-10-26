package com.potato.project.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;
import com.potato.project.member.service.MyPageService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Resource(name = "myPageService")
	private MyPageService myPageService;

	// 나의 도서관 클릭시 오는 페이지--추가--봉
	@GetMapping("/myPage")
	public String myLib(Model model, MenuVO menuVO, HttpSession session, SideMenuVO sideMenuVO) {
		// 로그인정보 MemberVO에 담아서 맵퍼로 보내고 결과값 다시 받아와서 화면에 뿌림
		model.addAttribute("memberBookSituationCnt",
		myPageService.memberBookSituation((MemberVO)session.getAttribute("loginInfo")));

		return "member/my_page";

	}

	// 나의 정보 클릭시 오는 페이지--추가--봉
	@GetMapping("/myInfo")
	public String myInfo(Model model, MenuVO menuVO, HttpSession session, SideMenuVO sideMenuVO) {
		// 로그인정보 MemberVO(id만있으면됨)에 담아서 맵퍼로 보내고 결과값 다시 받아와서 화면에 뿌림
		model.addAttribute("memberInfo", myPageService.selectMemberInfo((MemberVO) session.getAttribute("loginInfo")));
		return "member/my_info";

	}

	// 나의 정보 수정하기 ajax
	@ResponseBody
	@PostMapping("/myInfoAjax")
	public MemberVO myInfoAjax(MemberVO MemberVO) {
		return myPageService.selectMemberInfo(MemberVO);
	}

}
