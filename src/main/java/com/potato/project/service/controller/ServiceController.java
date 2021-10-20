package com.potato.project.service.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.common.service.CommonService;
import com.potato.project.content.service.ContentService;
import com.potato.project.service.service.ServiceService;
// 천화 
@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@Resource(name = "contentService")
	private ContentService contentSerivce;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "serviceService")
	private ServiceService serviceService;
	
	@GetMapping("/libManage")
	public String goReadingSeat(Model model) {
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("seatList",serviceService.selectReadingSeat());
		
		return  "service/readingSeat";
	}
	
	

}
