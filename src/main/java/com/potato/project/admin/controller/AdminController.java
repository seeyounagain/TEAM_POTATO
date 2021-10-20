package com.potato.project.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.admin.service.AdminService;
import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.member.vo.MemberVO;

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
	
	//공지사항 작성 페이지로 이동
	@GetMapping("/noticeForm")
	public String goNoticeForm(Model model,MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));

		return "admin/notice_form";
	}
}