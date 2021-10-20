package com.potato.project.content.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.content.service.LibInfoService;
import com.potato.project.member.vo.MemberVO;
//봉 생성
@Controller
@RequestMapping("/libInfo")
public class LibInfoController {
	@Resource(name = "libInfoService")
	private LibInfoService libInfoService;
	@Resource(name="commonService")
	private CommonService commonService;
	
	@GetMapping("/locaInfo")
	public String libDirections(Model model,String menuCode,HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		
		return "libInfo/lib_directions";
		
	}
	@GetMapping("/dataInfo")
	public String libStatusGuide(Model model,String menuCode,HttpSession session){
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		
		return "libInfo/lib_status_guide";
		
	}
	@GetMapping("/serviceInfo")
	public String serviceInfo(Model model,String menuCode,HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		
		return "libInfo/lib_service_info";
	}
		
}
