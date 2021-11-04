package com.potato.project.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.BoardService;
import com.potato.project.content.service.SearchService;
import com.potato.project.content.vo.NoticeVO;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@GetMapping("/main")
	public String test(Model model, HttpSession session, MenuVO menuVO, NoticeVO noticeVO) {
	
		
		
		// 신착도서목록
		model.addAttribute("bookList",searchService.selectBookList());
		
		//공지사항 목록
		model.addAttribute("noticeList", boardService.mainNoticeList());
		
		
		return "noside/content/main";
		
	}
	
	@ResponseBody
	@PostMapping("/popupAjax")
	public NoticeVO selectPopupNotice(NoticeVO noticeVO) {
		// 메인 팝업 공지사항
	
		return boardService.mainPopupNotice();
	}
	
	
}