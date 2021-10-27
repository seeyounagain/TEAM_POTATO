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
	public String myLib(Model model, MenuVO menuVO, HttpSession session, SideMenuVO sideMenuVO,MemberVO memberVO) {
		// 로그인정보 MemberVO에 담아서 맵퍼로 보내고 결과값 다시 받아와서 화면에 뿌림
		model.addAttribute("memberBookSituationCnt",myPageService.memberBookSituation((MemberVO)session.getAttribute("loginInfo")));

		return "member/my_page";

	}

	// 나의 정보 클릭시 오는 페이지--추가--봉
	@GetMapping("/myInfo")
	public String myInfo(Model model, MenuVO menuVO, HttpSession session, SideMenuVO sideMenuVO) {
		// 로그인정보 MemberVO(id만있으면됨)에 담아서 맵퍼로 보내고 결과값 다시 받아와서 화면에 뿌림
		model.addAttribute("memberInfo", myPageService.selectMemberInfo((MemberVO)session.getAttribute("loginInfo")));
		model.addAttribute("myTells", myPageService.selectTell(myPageService.selectTellCnt((MemberVO)session.getAttribute("loginInfo"))));
		return "member/my_info";

	}

	// 나의 정보 수정하기 ajax
	@ResponseBody
	@RequestMapping("/myInfoAjax")
	public MemberVO myInfoAjax(MemberVO memberVO) {
		//전화번호 주소 따로따로 뽑아서 보냄
		return myPageService.selectTell(myPageService.selectTellCnt(memberVO));
	}
	
	//나의 정보수정
	@PostMapping("/updateMyInfo")
	public String updateMyInfo(MenuVO menuVO, MemberVO memberVO) {
		myPageService.updateMyInfo(memberVO);
		return "redirect:/myPage/myInfo?menuCode="+menuVO.getMenuCode();
	}
	
	@PostMapping("/updatePw")
	public String updatePw(HttpSession session,MemberVO memberVO) {
		
		System.out.println(((MemberVO)session.getAttribute("loginInfo")).getId()+"아이디 가져오나확인");
		System.out.println(((MemberVO)session.getAttribute("loginInfo")).getId()+"아이디 가져오나확인");
		System.out.println(((MemberVO)session.getAttribute("loginInfo")).getId()+"아이디 가져오나확인");
		System.out.println(((MemberVO)session.getAttribute("loginInfo")).getId()+"아이디 가져오나확인");
		return "redirect:/myPage/myInfoAjax?id="+((MemberVO)session.getAttribute("loginInfo")).getId();
	}

}
