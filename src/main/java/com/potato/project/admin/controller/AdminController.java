package com.potato.project.admin.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.admin.service.AdminService;
import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.BoardService;
import com.potato.project.content.vo.NoticeVO;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/libManage")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	@Resource(name = "boardService")
	private BoardService boardService;
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/bookManage")
	public String bookManage() {
		
		return  "admin/bookManage";
		
	}
	
	@GetMapping("/memberManage")
	public String memberManage() {
		
		return  "admin/memberManage";
		
	}
	
	//공지사항 작성 페이지로 이동
	@GetMapping("/noticeForm")
	public String goNoticeForm(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		//오늘 날짜 입력
		model.addAttribute("nowDate",getDate());
	
		return "admin/notice_form";
	}
	//공지사항 등록
	public String insertNotice(NoticeVO noticeVO) {
		
		boardService.insertNotice(noticeVO);
		
		//공지사항 목록으로 이동
		return "redirect:/board/notice";
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