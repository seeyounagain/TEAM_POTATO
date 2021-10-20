package com.potato.project.content.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	//공지사항 페이지로 이동
	@GetMapping("/notice")
	public String goNotice() {
		
		
		return  "content/board/notice_list";
	}

	//문의상담 페이지로 이동
	@GetMapping("/qna")
	public String goQna() {
		
		return  "content/board/qna_list";
	}
}

