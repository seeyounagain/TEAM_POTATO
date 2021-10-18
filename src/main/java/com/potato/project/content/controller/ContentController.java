package com.potato.project.content.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.content.service.ContentService;

@Controller
@RequestMapping("/content")
public class ContentController {
	@Resource(name = "contentService")
	private ContentService contentSerivce;
	
	@GetMapping("/test")
	public String test() {
		return  "noside/content/test";
	}
}

