package com.potato.project.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.SearchService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@GetMapping("/main")
	public String test(Model model, HttpSession session, MenuVO menuVO) {
		
		// 신착도서목록
		model.addAttribute("bookList",searchService.selectBookList());
		
		return "noside/content/main";
		
	}
	
}