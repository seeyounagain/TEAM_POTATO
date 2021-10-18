package com.potato.project.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	private UserService userSerivce;
	
	@GetMapping("/test")
	public String test() {
		return  "user/test";
	}
	
	@GetMapping("/userJoinForm")
	public String userJoinForm() {
		return  "noside/user/user_join_form";
	}
}
