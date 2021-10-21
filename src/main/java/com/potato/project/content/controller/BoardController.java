package com.potato.project.content.controller;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.BoardService;
import com.potato.project.member.vo.MemberVO;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//공지사항 페이지로 이동
	@GetMapping("/notice")
	public String goNotice(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("noticeList", boardService.selectNoticeList());
		return  "board/notice_list";
	}

	//상담 문의 페이지로 이동
	@GetMapping("/qna")
	public String goQna(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("qnaList", boardService.selectQnaList());
		
		
		return  "board/qna_list";
	}
	
	//상담 문의 등록으로 이동
	@GetMapping("/qnaForm")
	public String goQnaForm(Model model,MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		//오늘 날짜 입력
		model.addAttribute("nowDate", getDate());
		
		return "board/qna_form";
	}
	
	//시스템 날짜 구하는 메소드
	public String getDate() {
		//현재 날짜 구하기
		LocalDate now = LocalDate.now();
		
		//포맷 지정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		
		//포맷 적용
		String date = now.format(formatter);
		
		return date;
	}
}

