package com.potato.project.content.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.content.service.LibInfoService;
//봉 생성
@Controller
@RequestMapping("/libInfo")
public class LibInfoController {
	@Resource(name = "libInfoService")
	private LibInfoService libInfoService;
	@Resource(name="commonService")
	private CommonService commonService;
	
	@GetMapping("/libDirections")
	public String libDirections(Model model,String menuCode) {
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		return "libInfo/lib_directions";
		
	}
	@GetMapping("/libStatusGuide")
	public String libStatusGuide(Model model,String menuCode){
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuCode));
		return "libInfo/lib_status_guide";
		
	}
		
}
