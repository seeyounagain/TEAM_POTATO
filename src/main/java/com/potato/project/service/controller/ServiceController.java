package com.potato.project.service.controller;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.ContentService;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.api.apiSearchPlay;
import com.potato.project.service.service.ServiceService;
import com.potato.project.service.vo.ApiDataVO;
import com.potato.project.service.vo.ApiSearchVO;
import com.potato.project.service.vo.ReadingRecordVO;
import com.potato.project.service.vo.ReadingSeatVO;
import com.potato.project.service.vo.RequestBoardVO;

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
	
	@RequestMapping("/recommend")
	public String recommendBook(Model model,MenuVO menuVO,HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		return "service/recommend";
	}
	
	//도서비치 안내페이지
	@RequestMapping("/bookRequest") // (value = "/bookRequest", produces="application/String;xml=UTF-8")
	public String bookRequest(Model model,MenuVO menuVO,HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("requestBoardList", serviceService.requestBoardList(serviceService.requestIdAndIsAdminCheck(loginInfo)));
		
		return  "service/bookRequest";
	}
	
	//도서비치 신청서 MVC처리
	@PostMapping("/regBookRequest")
	public String regRequest(Model model,MenuVO menuVO,HttpSession session,RequestBoardVO rbVO) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		serviceService.regBookRequest(rbVO);
		return "redirect:/service/bookRequest";
	}
	
	
	//도서비치 검색 및 선택, 신청
	@RequestMapping("/bookRequestRegForm")
	public String goRegRequest(Model model,MenuVO menuVO,HttpSession session, ApiSearchVO asVO, apiSearchPlay asPlay) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		
		//도서비치신청 개수
		model.addAttribute("requestCnt",serviceService.checkRequestCnt(loginInfo));
		
		//검색 키워드가 공백이고 Isbn만 검색한다면 isbn코드 검색값을 출력한다.
		if(asVO.getKeyword()=="" && asVO.getIsbnCode() != "") {
			model.addAttribute("apiSearchList",asPlay.apiSearch(asVO));
			model.addAttribute("keyword", asVO.getIsbnCode());						
		//검색 키워드와 isbn 둘 다 공백이라면 프로그램은 실행되지 않는다.	
		}else if(asVO.getKeyword() == "" && asVO.getIsbnCode() == ""){
			
		}else {			
			model.addAttribute("apiSearchList",asPlay.apiSearch(asVO));
			model.addAttribute("keyword", asVO.getKeyword());		
		}
		return  "service/bookRequestRegForm";
	}
	
	//도서비치 신청 삭제
	@RequestMapping("/deleteBookRequest")
	public String deleteBookRequest(Model model,MenuVO menuVO,RequestBoardVO rbVO) {
		serviceService.deleteBookRequest(rbVO);
		model.addAttribute("menuCode", menuVO.getMenuCode());
		return "redirect:/service/bookRequest";
	}
	
	
	
	
	
	//열람실 좌석현황 관련 
	@RequestMapping("/readingSeat")
	public String goReadingSeat(Model model,MenuVO menuVO,HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			
			loginInfo = new MemberVO();
			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("seatRecordList",serviceService.seatRecordList());
		
		//Ajax
		model.addAttribute("menuCode", menuVO.getMenuCode());
		model.addAttribute("seatList",serviceService.selectReadingSeat());
		
		return  "service/readingSeat";
	}

	
	@PostMapping("/seatUpdate")
	public String seatUpdate(Model model,MenuVO menuVO,HttpSession session,ReadingSeatVO seatVO) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {		
			loginInfo = new MemberVO();		
		}
		
		//시트정보 변경
		serviceService.seatUpdate(seatVO);
		//시트 배정(IN),퇴실(OUT) 기록
		if(seatVO.getSeatStatus() == 1) {
			serviceService.seatInRecord(seatVO);			
		}else{
			serviceService.seatOutRecord(seatVO);			
		}
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("seatList",serviceService.selectReadingSeat());
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		model.addAttribute("seatRecordList",serviceService.seatRecordList());
		
		return  "service/readingSeat";
	}
	
	
	
	//AJAX 구간
	@ResponseBody
	@PostMapping("/chooseSeat")
	public ReadingSeatVO chooseSeat(Model model, String seatCode) {
	return serviceService.chooseSeat(seatCode);
	}
	
	@ResponseBody
	@PostMapping("/seatIdCheck")
	public String seatIdCheck(Model model, String id) {
	return serviceService.seatIdCheck(id);
	}
	
	@ResponseBody
	@PostMapping("/seatMemberIdCheck")
	public String seatMemberIdCheck(Model model, String id) {
	return serviceService.seatMemberIdCheck(id);
	}
	
	@ResponseBody
	@PostMapping("/searchRecord")
	public List<ReadingRecordVO> searchRecord(Model model,ReadingRecordVO recordVO) {
	return serviceService.searchRecord(recordVO);
	}
	
	@ResponseBody
	@PostMapping("/checkISBN")
	public String checkISBN(Model model, String isbn) {
	return serviceService.checkISBN(isbn);
	}
	
	@ResponseBody
	@PostMapping("/ajaxRegRequest")
	public int ajaxRegRequest(Model model, RequestBoardVO rbVO) {
	return serviceService.ajaxRegRequest(rbVO);
	}
	
	

}
