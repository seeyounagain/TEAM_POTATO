package com.potato.project.service.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.util.FileUploadUtil;
import com.potato.project.common.vo.AttachFileVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.ContentService;
import com.potato.project.content.vo.NoticeVO;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.api.apiSearchPlay;
import com.potato.project.service.service.ServiceService;

import com.potato.project.service.vo.ApiSearchVO;
import com.potato.project.service.vo.ReadingRecordVO;
import com.potato.project.service.vo.ReadingSeatVO;
import com.potato.project.service.vo.RecommendVO;
import com.potato.project.service.vo.RequestBoardVO;
import com.potato.project.service.vo.ImgVO;

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
	
	
	
	@PostMapping("/recommendUpdateGo")
	public String recommendUpdateGo(Model model,MenuVO menuVO,HttpSession session,RecommendVO rcVO, MultipartHttpServletRequest multi) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
			
		if(serviceService.recommendDelete(rcVO) != 0) {
		
		Iterator<String> inputNames = multi.getFileNames();
		String uploadPath = "C:C:\\Users\\USER\\Desktop\\git\\211112\\TEAM_POTATO\\src\\main\\webapp\\resources\\service\\img\\";
		int nextImg = 1;
		while (inputNames.hasNext()) {
			String inputName = inputNames.next();
			
			try {
				if(inputName.equals("file1")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));							
							rcVO.setImgOne(uploadFile);									
							nextImg++;
						}
					}						
				}
				if(inputName.equals("file2")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));													
								if(nextImg == 2) {
									rcVO.setImgTwo(uploadFile);									
								}
								nextImg++;	
						}
					}						
				}
				if(inputName.equals("file3")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));							
								if(nextImg == 3) {
									rcVO.setImgThree(uploadFile);
								}
								nextImg++;
						}
					}						
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		}
		serviceService.recommendReg(rcVO);
		//추천 입력
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		
		return "redirect:/service/recommendUpdateGo2";
	}
	
	
	
	
	@PostMapping("/registerRecommend")
	public String insertRecommend(Model model,MenuVO menuVO,HttpSession session,RecommendVO rcVO, MultipartHttpServletRequest multi) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		
		
		Iterator<String> inputNames = multi.getFileNames();
		String uploadPath = "C:\\Users\\USER\\Desktop\\git\\211112\\TEAM_POTATO\\src\\main\\webapp\\resources\\service\\img\\";
		int nextImg = 1;
		while (inputNames.hasNext()) {
			String inputName = inputNames.next();
			
			try {
				if(inputName.equals("file1")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));							
							rcVO.setImgOne(uploadFile);									
							nextImg++;
						}
					}						
				}
				if(inputName.equals("file2")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));													
								if(nextImg == 2) {
									rcVO.setImgTwo(uploadFile);									
								}
								nextImg++;	
						}
					}						
				}
				if(inputName.equals("file3")) { //다중 첨부
					List<MultipartFile> fileList =	multi.getFiles(inputName);	
					for(MultipartFile file : fileList) {
						if(!file.getOriginalFilename().equals("")){
							String uploadFile = FileUploadUtil.getNowDateTime() +"_"+ file.getOriginalFilename();
							file.transferTo(new File(uploadPath + uploadFile));							
								if(nextImg == 3) {
									rcVO.setImgThree(uploadFile);
								}
								nextImg++;
						}
					}						
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}		
		//추천 입력
		serviceService.insertRecommend(rcVO);
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		return "redirect:/service/recommend";
	}
	
	
	@GetMapping("/recommendRegForm")
	public String recommendRegForm(Model model,MenuVO menuVO,HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		return "service/recommendRegForm";
	}
	
	
	@GetMapping("/recommendUpdate")
	public String recommendUpdate(Model model,MenuVO menuVO,HttpSession session,RecommendVO rcVO) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		
		String RcCode = rcVO.getRcCode();
		RecommendVO rcVO2 = serviceService.recommendBoard(RcCode);
		byte[] bt1 = serviceService.recommendBoard(RcCode).getContentTitle();
		byte[] bt2 = serviceService.recommendBoard(RcCode).getContentOne();
		byte[] bt3 = serviceService.recommendBoard(RcCode).getContentTwo();
		byte[] bt4 = serviceService.recommendBoard(RcCode).getContentThree();
		String a1 = new String(bt1);
		String a2 = new String(bt2);
		String a3 = new String(bt3);
		String a4 = new String(bt4);
		rcVO2.setContent1(a1);
		rcVO2.setContent2(a2);
		rcVO2.setContent3(a3);
		rcVO2.setContent4(a4);
		
		model.addAttribute("recommend", rcVO2);
		
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		
		return "service/recommendUpdateForm";
	}
	
	
	@RequestMapping("/recommend")
	public String recommendBook(Model model,MenuVO menuVO,HttpSession session,RecommendVO rcVO) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		String RcCode = "";
		if(serviceService.lastRcCode()==null||serviceService.lastRcCode().equals("")) {
			
		}else {
			if(rcVO.getRcCode() == null || rcVO.getRcCode().equals("")) {
				RcCode = serviceService.lastRcCode();
			}else {
				RcCode = rcVO.getRcCode();
			}
			RecommendVO rcVO2 = serviceService.recommendBoard(RcCode);
			byte[] bt1 = serviceService.recommendBoard(RcCode).getContentTitle();
			byte[] bt2 = serviceService.recommendBoard(RcCode).getContentOne();
			byte[] bt3 = serviceService.recommendBoard(RcCode).getContentTwo();
			byte[] bt4 = serviceService.recommendBoard(RcCode).getContentThree();
			String a1 = new String(bt1);
			String a2 = new String(bt2);
			String a3 = new String(bt3);
			String a4 = new String(bt4);
			rcVO2.setContent1(a1);
			rcVO2.setContent2(a2);
			rcVO2.setContent3(a3);
			rcVO2.setContent4(a4);
			model.addAttribute("recommend", rcVO2);
		}
		model.addAttribute("rcList", serviceService.rcList());
		
		
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		model.addAttribute("menuCode", menuVO.getMenuCode());

		return "service/recommendDetail";
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
	
	//도서비치 신청서 완료처리
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
		return "redirect:/myPage/bookRequestStatus";
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
		
		return  "redirect:/service/readingSeat";
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
	recordVO.setRecordEndDate(serviceService.endDateForSearchRecord(recordVO));
	return serviceService.searchRecord(recordVO);
	}
	
	@ResponseBody
	@PostMapping("/resetSearchRecord")
	public List<ReadingRecordVO> resetSearchRecord(Model model,ReadingRecordVO recordVO) {
	return serviceService.seatRecordList();
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
	
	@ResponseBody
	@PostMapping("/ajaxRequestStatusChange")
	public List<RequestBoardVO> ajaxRequestStatusChange(Model model, RequestBoardVO rbVO) {
	serviceService.ajaxRequestStatusChange(rbVO);
	return serviceService.requestBoardListAdmin();
	}
		
	

}
