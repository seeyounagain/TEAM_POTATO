package com.potato.project.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	
	@GetMapping("/test")
	public String test() {
		return  "admin/test";
	}
}
