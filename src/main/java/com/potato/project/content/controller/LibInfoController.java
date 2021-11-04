package com.potato.project.content.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;
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
	
	//도서관정보 오시는길
	@GetMapping("/locaInfo")
	public String libDirections(Model model,MenuVO menuVO,HttpSession session,SideMenuVO sideMenuVO) {
		
		return "libInfo/lib_directions";
		
	}
	//도서관정보 자료현황
	@GetMapping("/dataInfo")
	public String libStatusGuide(Model model,MenuVO menuVO,HttpSession session,SideMenuVO sideMenuVO){
		
		//모든책 개수 구하기 최종 갱신일 던지기
		model.addAttribute("bookLastUpdate", libInfoService.bookLastUpdate());
		
		//책의 종류와 책의 개수던져줌
		model.addAttribute("bookCateList", libInfoService.bookCnt());
		//책의 총 개수 던져줌
		model.addAttribute("totalBookCnt", libInfoService.totalBookCnt());
		
		
		return "libInfo/lib_status_guide";
		
	}
	//도서관정보 이용안내
	@GetMapping("/serviceInfo")
	public String serviceInfo(Model model,MenuVO menuVO,HttpSession session,SideMenuVO sideMenuVO) {
		//모든책 개수 구하기 최종 갱신일 던지기
		model.addAttribute("bookLastUpdate", libInfoService.bookLastUpdate());
		
		//책의 종류와 책의 개수던져줌
		model.addAttribute("bookCateList", libInfoService.bookCnt());
		//책의 총 개수 던져줌
		model.addAttribute("totalBookCnt", libInfoService.totalBookCnt());
		
		
		return "libInfo/lib_service_info";
	}
		
}
