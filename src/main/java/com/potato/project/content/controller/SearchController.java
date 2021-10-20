package com.potato.project.content.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/bookSearch")
	// 자료검색 페이지로 이동
	public String bookSearch(Model model,String menuCode) {
		
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		
		return "search/search_form";
		
	}
	
}
