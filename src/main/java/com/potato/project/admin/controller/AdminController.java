package com.potato.project.admin.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.admin.service.AdminService;
import com.potato.project.common.service.CommonService;
import com.potato.project.content.service.BoardService;

@Controller
@RequestMapping("/libManage")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@GetMapping("/bookManage")
	public String bookManage() {
		
		return  "admin/bookManage";
		
	}
	
	@GetMapping("/memberManage")
	public String memberManage() {
		
		return  "admin/memberManage";
		
	}
	
	
}