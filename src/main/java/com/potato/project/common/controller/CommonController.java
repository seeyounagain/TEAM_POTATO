package com.potato.project.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/main")
	public String test(Model model, HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		return "noside/content/main";
		
	}
	
}