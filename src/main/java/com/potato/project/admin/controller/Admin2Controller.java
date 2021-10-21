package com.potato.project.admin.controller;

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
import com.potato.project.content.service.BoardService;
import com.potato.project.content.service.SearchService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/libManage2")
public class Admin2Controller {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	// 도서관리 페이지 이동
	@GetMapping("/bookManage")
	public String bookManage(Model model,MenuVO menuVO,HttpSession session,BookVO bookVO) {
		
		// 메뉴 호출할 정보 가져오기
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}

		// 메뉴 전달
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		// 사이드 메뉴 전달
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		// 도서 목록 전달
		model.addAttribute("bookList",searchService.selectStatusBookList(bookVO));
		
		return  "admin/book_manage";
		
	}
	
	// 회원 관리 페이지 이동
	@GetMapping("/memberManage")
	public String memberManage(Model model,MenuVO menuVO,HttpSession session) {
		
		// 메뉴 호출할 정보 가져오기
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		// 메뉴 전달
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		// 사이드 메뉴 전달
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		return  "admin/member_manage";
		
	}
	
	// Ajax 사용, 상태별 도서 조회
	@ResponseBody
	@PostMapping("/selectStatusBookListAjax")
	public List<BookVO> selectStatusBookListAjax(BookVO bookVO) {
		
		return searchService.selectStatusBookList(bookVO);
		
	}
	
	// 도서 등록 페이지
	@GetMapping("/regBookForm")
	public String regBookForm(Model model,MenuVO menuVO,HttpSession session) {

		// 메뉴 호출할 정보 가져오기
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
				
			if (loginInfo == null) {
					
				loginInfo = new MemberVO();
					
			}
			
		// 메뉴 전달
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		// 사이드 메뉴 전달
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));	
		
		return "admin/reg_book_form";
		
	}
	
	
}