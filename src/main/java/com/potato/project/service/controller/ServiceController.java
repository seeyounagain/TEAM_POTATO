package com.potato.project.service.controller;

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
import com.potato.project.content.service.ContentService;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.service.ServiceService;
import com.potato.project.service.vo.ReadingSeatVO;

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
	
	@RequestMapping("/readingSeat")
	public String goReadingSeat(Model model,MenuVO menuVO,HttpSession session) {

		model.addAttribute("seatList",serviceService.selectReadingSeat());
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		
		return  "service/readingSeat";
	}
	
	@ResponseBody
	@PostMapping("/chooseSeat")
	public ReadingSeatVO chooseSeat(Model model, String seatCode) {
		
		return serviceService.chooseSeat(seatCode);
	
	}
	
	@PostMapping("/seatUpdate")
	public String seatUpdate(Model model,MenuVO menuVO,HttpSession session,ReadingSeatVO seatVO) {
		
		serviceService.seatUpdate(seatVO);

		model.addAttribute("seatList",serviceService.selectReadingSeat());
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		return  "service/readingSeat";
	}
	

}
