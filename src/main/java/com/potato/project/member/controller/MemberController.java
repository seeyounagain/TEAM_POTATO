package com.potato.project.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberSerivce;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		
		model.addAttribute("menuList",commonService.selectMenuList());
		
		return "noside/member/member_join_form";
		
	}
}
