package com.potato.project.member.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.admin.service.AdminService;
import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.MessageVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;
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
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
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
	@ResponseBody
	@PostMapping("/login")
	public MemberVO loginAjax(MemberVO memberVO, HttpSession session, Model model) {
		
		MemberVO loginInfo = memberSerivce.selectMember(memberVO);
		
		// 연체도서 갯수 조회를 위한 int
		int overCnt = 0;
		
		// 회원일 경우
		if (loginInfo != null) {
			
			// 탈퇴한 회원이 아닐 경우
			if (loginInfo.getIsDelete().equals("N")) {
				
				session.setAttribute("loginInfo", loginInfo);
				// 연체도서 업데이트 및 갯수 조회, 알림 전송
				overCnt = adminService.selectRentalListAndOverRentalUpdate(memberVO);
				// 예약도서 중 대출가능 기간 초과 도서 예약 정보 삭제, 알림 전송
				adminService.selectReserveStatusIsWaitAndDeleteReserveDateIsOver(memberVO);
				
			}
			
		loginInfo.setOverCnt(overCnt);

		}

		return loginInfo;
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		
		return "redirect:/common/main";
		
	}
	
	// 도서 예약
	@ResponseBody
	@PostMapping("/reserveBookAjax")
	public int reserveBookAjax(ReserveVO reserveVO,BookVO bookVO) {
		
		return adminService.insertReserve(reserveVO, bookVO);
		
	}
	
	// 회원 대출 목록 중 일치하는 도서 조회 (대출중인 도서 예약 클릭 시)
	@ResponseBody
	@PostMapping("/isMemeberRentalAjax")
	public int isMemeberRentalAjax(RentalVO rentalVO) {
		
		return adminService.isMemeberRental(rentalVO);
		
	}
	
	// 알림 목록 조회
	@ResponseBody
	@PostMapping("/selectMessageListAjax")
	public List<MessageVO> selectMessageListAjax(MessageVO messageVO) {
		
		return memberSerivce.selectMessageList(messageVO);
		
	}
	
	// 알림 상태 읽음 으로 변경
	@ResponseBody
	@PostMapping("/updateMessageIsReadAjax")
	public int updateMessageIsReadAjax(String messageCode) {
		
		return memberSerivce.updateMessageIsRead(messageCode);
		
	}
	
	// 알림 삭제
	@ResponseBody
	@PostMapping("/deleteMessageAjax")
	public int deleteMessageAjax(String messageCode) {
		
		return memberSerivce.deleteMessage(messageCode);
		
	}	
	
	// 아이디 찾기
	@ResponseBody
	@PostMapping("/findIdAjax")
	public String findIdAjax(MemberVO memberVO) {
		
		return memberSerivce.findIdAjax(memberVO);
		
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@PostMapping("/findPwAjax")
	public String findPwAjax(MemberVO memberVO) {
		
		return memberSerivce.findPwAjax(memberVO);
		
	}
	
	
	
}
