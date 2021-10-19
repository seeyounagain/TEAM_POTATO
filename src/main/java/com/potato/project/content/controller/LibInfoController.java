package com.potato.project.content.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.content.service.LibInfoService;
//봉 생성
@Controller
@RequestMapping("/libInfo")
public class LibInfoController {
	@Resource(name = "libInfoService")
	private LibInfoService libInfoService;
	
	@GetMapping("/libDirections")
	public String libDirections() {
		return "libInfo/lib_directions";
		
	}
	@GetMapping("/libStatusGuide")
	public String libStatusGuide(){
		return "libInfo/lib_status_guide";
		
	}
		
}
