package com.potato.project.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.member.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	@Resource(name = "userService")
	private MemberService userSerivce;
	
	@GetMapping("/test")
	public String test() {
		return  "user/test";
	}
	
	@GetMapping("/userJoinForm")
	public String userJoinForm() {
		return  "noside/user/user_join_form";
	}
}
