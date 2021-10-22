package com.potato.project.content.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.util.UploadUtil;
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
	
	// 자료검색 페이지로 이동
	@GetMapping("/bookSearch")
	public String bookSearch(Model model,MenuVO menuVO,HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("bookList",searchService.selectBookList());
		
		model.addAttribute("cateList",searchService.selectCateList());
		
		model.addAttribute("nowDate",UploadUtil.getNowDateTime("time"));
		
		return "search/search_form";
		
	}
	
	// 신착도서 페이지로 이동
	@GetMapping("/newBookList")
	public String newBookList(Model model,MenuVO menuVO,HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("bookList",searchService.selectBookList());
		
		return "search/new_book_list";
		
	}
	
}
