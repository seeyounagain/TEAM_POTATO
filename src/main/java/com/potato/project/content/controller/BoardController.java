package com.potato.project.content.controller;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.util.UploadUtil;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.BoardService;
import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaVO;
import com.potato.project.member.vo.MemberVO;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//공지사항 페이지로 이동
	@GetMapping("/notice")
	public String goNotice(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("list", boardService.selectNoticeList());
		
		return  "board/notice_list";
	}
	
	//공지사항 작성 페이지로 이동
	@GetMapping("/noticeForm")
	public String goNoticeForm(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		//오늘 날짜 입력
		model.addAttribute("nowDate",UploadUtil.getNowDateTime("day"));
	
		return "admin/notice_form";
	}
	
	//공지사항 등록
	@PostMapping("/insertNotice")
	public String insertNotice(NoticeVO noticeVO) {
		
		//글 업로드
		boardService.insertNotice(noticeVO);
		
		//첨부파일 업로드
		
		//파일이 첨부될 경로 : 민휘 학원컴
		String uploadPath = "D:\\git\\ShinMinHwi\\TEAM_POTATO\\src\\main\\webapp\\resources\\noticeImgUpload\\";
		
		//파일 코드 생성
		
		
		//공지사항 목록으로 이동
		return "redirect:/board/notice";
	}
	
	
	//상담 문의 페이지로 이동
	@GetMapping("/qna")
	public String goQna(Model model, MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		model.addAttribute("list", boardService.selectQnaList());
		
		
		return  "board/qna_list";
	}
	
	//상담 문의 등록으로 이동
	@GetMapping("/qnaForm")
	public String goQnaForm(Model model,MenuVO menuVO, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		//오늘 날짜 입력
		model.addAttribute("nowDate", UploadUtil.getNowDateTime("day"));
		
		return "board/qna_form";
	}
	
	//상담 문의 등록
	@PostMapping("/insertQna")
	public String insertQna(QnaVO qnaVO) {
		
		boardService.insertQna(qnaVO);
		
		return "redirect:/board/qna";
	}
	
	//상담문의글 비밀번호 확인
	@PostMapping("/checkQnaPw")
	public String checkQnaPw() {
		
		
		return "";
	}
	
	//상담문의 글 보기
	@GetMapping("/qnaDetail")
	public String goQnaDetail(QnaVO qnaVO) {
		
		boardService.selectQna(qnaVO);
		
		return "board/qna_password";
	}
	
	//시스템 날짜 구하는 메소드
	/*
	 * public String getDate() { //현재 날짜 구하기 LocalDate now = LocalDate.now();
	 * 
	 * //포맷 지정 DateTimeFormatter formatter =
	 * DateTimeFormatter.ofPattern("yyyy/MM/dd");
	 * 
	 * //포맷 적용 String date = now.format(formatter);
	 * 
	 * return date; }
	 */
}

