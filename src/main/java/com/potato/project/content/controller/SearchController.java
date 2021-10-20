package com.potato.project.content.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/bookSearch")
	// 자료검색 페이지로 이동
	public String bookSearch(Model model,String menuCode,HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		
		return "search/search_form";
		
	}
	
}
