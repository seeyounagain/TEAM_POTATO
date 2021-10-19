package com.potato.project.service.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.content.service.ContentService;
// 천화 
@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@Resource(name = "contentService")
	private ContentService contentSerivce;
	
	@GetMapping("/readingSeat")
	public String goReadingSeat() {
		return  "service/readingSeat";
	}

}
