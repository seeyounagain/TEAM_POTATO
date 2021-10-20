package com.potato.project.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.admin.service.AdminService;

@Controller
@RequestMapping("/libManage")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	
	@GetMapping("/bookManage")
	public String bookManage() {
		
		return  "admin/bookManage";
		
	}
	
	@GetMapping("/memberManage")
	public String memberManage() {
		
		return  "admin/memberManage";
		
	}
}