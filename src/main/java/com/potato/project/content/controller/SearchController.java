package com.potato.project.content.controller;

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
import com.potato.project.common.util.UploadUtil;
import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.SearchService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	// 통합검색 페이지로 이동
	@GetMapping("/bookSearch")
	public String bookSearch(Model model,MenuVO menuVO,HttpSession session) {
		
		return "search/search_form";
		
	}
	
	// 통합검색
	@PostMapping("/bookSearch")
	public String goSearch(Model model,MenuVO menuVO,BookVO bookVO,HttpSession session) {
		
		int totalCnt = searchService.countBookSearch(bookVO);
		
		bookVO.setTotalCnt(totalCnt);
		bookVO.setPageInfo();
		
		model.addAttribute("searchList",searchService.selectSearchBookAndPaging(bookVO));
		
		return "search/search_form";
		
	}
	
	// 상세검색 페이지로 이동
	@RequestMapping("/bookDetailSearch")
	public String bookDetailSearch(Model model,MenuVO menuVO,HttpSession session) {
		
		model.addAttribute("bookList",searchService.selectBookList());
		
		model.addAttribute("cateList",searchService.selectCateList());
		
		return "search/detail_search_form";
		
	}
	
	// 신착도서 페이지로 이동 + 페이징
	@GetMapping("/newBookList")
	public String newBookList(Model model,MenuVO menuVO,BookVO bookVO,HttpSession session) {
		
		int totalCnt = adminService.countBookInputDate(bookVO);
		
		bookVO.setTotalCnt(totalCnt);
		bookVO.setPageInfo();
	
		model.addAttribute("bookList",searchService.selectBookListPaging(bookVO));
		
		return "search/new_book_list";
		
	}
	
	// 도서 상세페이지로 이동
	@GetMapping("/bookDetail")
	public String bookDetail(Model model,MenuVO menuVO,HttpSession session,BookVO bookVO) {
		
		model.addAttribute("bookVO",searchService.selectBookDetail(bookVO));
		
		return "search/book_detail";
		
	}
	
	// 도서 상세페이지에서 예약 버튼 클릭 시 로그인 조회 Ajax
	@ResponseBody
	@PostMapping("/isLoginAjax")
	public boolean isLoginAjax(HttpSession session) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		
		if (memberVO == null) {
			return false;
		}
		
		else {
			return true;
		}
		
	}
	
	
}
