package com.potato.project.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;
import com.potato.project.member.service.MemberService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberSerivce;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	// 회원가입 안내 페이지로 이동
	@GetMapping("/memberJoinInfo")
	public String memberJoinInfo(Model model,HttpSession session) {
		
		return "noside/member/member_join_info_form";
		
	}
	
	// 회원가입 페이지로 이동
	@GetMapping("/memberJoinForm")
	public String memberJoinForm(Model model,HttpSession session) {
		
		return "noside/member/member_join_form";
		
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/memberLoginForm")
	public String memberLoginForm(Model model,HttpSession session) {
		
		return "noside/member/member_login_form";
		
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		
		memberSerivce.insertMember(memberVO);
		
		return "redirect:/member/memberLoginForm";
		
	}
	
	// 아이디 중복체크
	@ResponseBody
	@PostMapping("/checkId")
	public boolean checkIdAjax(String id) {
		
		return memberSerivce.selectMemberId(id);
		
	}
	
	// 로그인
	@PostMapping("/login")
	public String join(MemberVO memberVO, HttpSession session) {
		
		MemberVO loginInfo = memberSerivce.selectMember(memberVO);

		if (loginInfo != null) {

			session.setAttribute("loginInfo", loginInfo);

		}

		return "/noside/member/login_result";
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		
		return "redirect:/common/main";
		
	}
	
	//나의 도서관 클릭시 오는 페이지--추가--봉
	@GetMapping("/myPage")
	public String myLib(Model model,MenuVO menuVO,HttpSession session,SideMenuVO sideMenuVO) {
		//로그인정보 MemberVO에 담아서 맵퍼로 보내고 결과값 다시 받아와서 화면에 뿌림
		model.addAttribute("memberBookSituationCnt", memberSerivce.memberBookSituation((MemberVO)session.getAttribute("loginInfo")));
		
		return "member/my_page";
		
		
	}
	//나의 정보 클릭시 오는 페이지--추가--봉
	@GetMapping("/myInfo")
	public String myInfo(Model model,MenuVO menuVO,HttpSession session,SideMenuVO sideMenuVO) {
		
		return "member/my_info";
		
	}
	
	
}
