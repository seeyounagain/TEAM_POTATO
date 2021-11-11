package com.potato.project.admin.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.potato.project.admin.service.AdminService;
import com.potato.project.common.service.CommonService;
import com.potato.project.common.util.CalenderUtil;
import com.potato.project.common.util.FileUploadUtil;
import com.potato.project.common.util.MessageApi;
import com.potato.project.common.util.UploadUtil;
import com.potato.project.common.vo.BookImgVO;
import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.MessageVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;
import com.potato.project.content.service.SearchService;
import com.potato.project.member.vo.MemberVO;
import com.potato.project.service.service.ServiceService;
import com.potato.project.service.vo.RequestBoardVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import edu.emory.mathcs.backport.java.util.Collections;

@Controller
@RequestMapping("/libManage")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "serviceService")
	private ServiceService serviceService;
	// 도서비치 관리 페이지 이동
	
	
	@GetMapping("/bookRequestManage")
	public String bookRequestManage(Model model,MenuVO menuVO,HttpSession session,RequestBoardVO rbVO,String year, String month) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		// 모든리스트를 뿌리는 리스트
		model.addAttribute("requestList", serviceService.requestBoardListAdmin());
		model.addAttribute("menuCode", menuVO.getMenuCode());
		model.addAttribute("years",  CalenderUtil.Map().get("year"));
		model.addAttribute("months", CalenderUtil.Map().get("month"));	
		model.addAttribute("inYear", year);
		model.addAttribute("inMonth", month);
		return  "service/bookRequestManage";
	}
		
	
	@RequestMapping("/bookRequestManage2")
	public String bookRequestManageYearMonth(Model model,MenuVO menuVO,HttpSession session,String selectYearMonth,String year, String month) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if (loginInfo == null) {
			loginInfo = new MemberVO();	
		}
		model.addAttribute("menuList",commonService.selectMenuList(loginInfo));
		model.addAttribute("sideMenuList",commonService.selectSideMenuList(menuVO));
		// 월간 리스트를 뿌리는 리스트
		model.addAttribute("requestList", serviceService.requestBoardListAdminChooseYearMonth(selectYearMonth));
		model.addAttribute("menuCode", menuVO.getMenuCode());
		model.addAttribute("years",  CalenderUtil.Map().get("year"));
		model.addAttribute("months", CalenderUtil.Map().get("month"));
		model.addAttribute("inYear", year);
		model.addAttribute("inMonth", month);
		
		return  "service/bookRequestManage";
	}
			
	
	
	
	// 도서관리 페이지 이동
	@GetMapping("/bookManage")
	public String bookManage(Model model,MenuVO menuVO,BookVO bookVO) {
		
		// 도서 목록 전달
		model.addAttribute("bookList",searchService.selectStatusBookList(bookVO));
		
		return  "admin/book_manage";
		
	}
	
	// 회원 관리 페이지 이동 + 페이징
	@GetMapping("/memberManage")
	public String memberManage(Model model,MenuVO menuVO,MemberVO memberVO) {
		
		int totalCnt = adminSerivce.countMemberAndSearchId(memberVO);
		
		memberVO.setTotalCnt(totalCnt);
		memberVO.setPageInfo();
		
		// 회원 정보 전달
		model.addAttribute("memberList",adminSerivce.selectMemberListAndBookCnt(memberVO));
		
		return  "admin/member_manage";
		
	}
	
	// Ajax 사용, 상태별 도서 조회
	@ResponseBody
	@PostMapping("/selectStatusBookListAjax")
	public List<BookVO> selectStatusBookListAjax(BookVO bookVO) {
		
		return searchService.selectStatusBookList(bookVO);
		
	}
	
	// 도서 등록 페이지
	@GetMapping("/regBookForm")
	public String regBookForm(Model model,MenuVO menuVO) {

		return "admin/reg_book_form";
		
	}
	
	// 도서 등록
	@PostMapping("/regBook")
	public String regBook(BookVO bookVO,MenuVO menuVO,MultipartHttpServletRequest multi) {
		
		// 첨부파일 UPLOAD
		
		// 첨부된 파일명 가져오기
		MultipartFile file = multi.getFile("file"); 
		
		// 이미지가 첨부 되었다면
		if (!file.getOriginalFilename().equals("")) {

			// 파일이 첨부될 경로 (끝에 \\ 있는지 체크!)
			//String uploadPath = "C:\\Users\\siyoon\\git\\TEAM_POTATO\\src\\main\\webapp\\resources\\bookImgUpload\\";
			String uploadPath = "D:\\myGit\\TEAM_POTATO\\src\\main\\webapp\\resources\\bookImgUpload\\";
			
			// 상품 코드 생성
			String bookCode = searchService.selectBookCode();
			
			// 다음에 올 이미지 코드 숫자 생성
			int nextNum = searchService.selectImgCodeNum();
			
			try {
				
				// 업로드 할 파일명 설정
				String uploadFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
				// 지정한 경로에 파일 첨부
				file.transferTo(new File(uploadPath + uploadFileName));
				
				String imgCode = "IMG_" + String.format("%03d", nextNum++);
				
				bookVO.setBookImgVO(new BookImgVO(imgCode, file.getOriginalFilename(), uploadFileName, bookCode));
				bookVO.setBookCode(bookCode);
				
			} catch (IllegalStateException e) {
				// 업로드 예외 발생 시
				e.printStackTrace();
			} catch (IOException e) {
				// 파일 입출력 예외 발생 시
				e.printStackTrace();
			}
		
		}
		
		// 첨부되지 않았다면
		else {
			
			// 상품 코드 생성
			String bookCode = searchService.selectBookCode();
			
			// 다음에 올 이미지 코드 숫자 + 코드 생성
			int nextNum = searchService.selectImgCodeNum();	
			String imgCode = "IMG_" + String.format("%03d", nextNum++);
			
			bookVO.setBookImgVO(new BookImgVO(imgCode, "noneImage.jpg", "noneImage.jpg", bookCode));
			bookVO.setBookCode(bookCode);
		}
		
		int result1 = adminSerivce.insertBook(bookVO);
		int result2 = adminSerivce.insertBookImg(bookVO);
		
		if (result1 == 1 && result2 == 1) {
			System.out.println("도서 등록 성공");
		}
		
		return "redirect:/libManage/regBookForm?menuCode=" + menuVO.getMenuCode();
		
	}
	
	// 도서 정보 수정페이지
	@GetMapping("/updateBookInfo")
	public String goUpdateBookInfo(Model model,MenuVO menuVO,BookVO bookVO) {
		
		model.addAttribute("bookVO",searchService.selectBookDetail(bookVO));
		
		return "admin/book_info_update_form";
		
	}	
	
	// 도서 정보 수정
	@PostMapping("/updateBookInfo")
	public String updateBookInfo(Model model,MenuVO menuVO,BookVO bookVO) {
		
		int result = adminSerivce.updateBookInfo(bookVO);
		
		model.addAttribute("bookCode",bookVO.getBookCode());
		model.addAttribute("menuCode",menuVO.getMenuCode());
		
		if (result == 1) {
			
			return "admin/update_result";
			
		}
		else {
			
			return "redirect:/libManage/updateBookInfo?menuCode=" + menuVO.getMenuCode() + "&bookCode=" + bookVO.getBookCode();
			
		}
		
		
	}	
	
	// 도서 대출
	@ResponseBody
	@PostMapping("/rentalBookAjax")
	public int rentalBook(RentalVO rentalVO,BookVO bookVO) {
		
		return adminSerivce.insertRental(rentalVO,bookVO);
		
	}
	
	// 도서 반납
	@ResponseBody
	@PostMapping("/returnBookAjax")
	public int returnBook(ReserveVO reserveVO,BookVO bookVO) {
		
		return adminSerivce.updateReturn(reserveVO, bookVO);
		
	}
	
	// 대여&예약 횟수 조회 Ajax
	@ResponseBody
	@PostMapping("/selectUserBookCntAjax")
	public int selectUserBookCntAjax(String id) {
		
		return adminSerivce.selectIdAllCount(id);
		
	}
	
	// 아이디 회원유무 조회 Ajax
	@ResponseBody
	@PostMapping("/selectIsMemberAjax")
	public int selectIsMemberAjax(String id) {
		
		return adminSerivce.selectIsMember(id);
		
	}
	
	// 회원이 보유한 대여 도서 정보 조회 Ajax
	@ResponseBody
	@PostMapping("/selectMemberRentalListAjax")
	public List<RentalVO> selectMemberRentalListAjax(String id) {
		
		return adminSerivce.selectMemberRentalList(id);
		
	}
	
	// 회원이 보유한 예약 도서 정보 조회 Ajax
	@ResponseBody
	@PostMapping("/selectMemberReserveListAjax")
	public List<ReserveVO> selectMemberReserveList(String id) {
		
		return adminSerivce.selectMemberReserveList(id);
		
	}
	
	// 회원에게 알람 전송 Ajax
	@ResponseBody
	@PostMapping("/sendMessageAjax")
	public int sendMessageAjax(MessageVO messageVO) {
		
		return adminSerivce.sendMessage(messageVO);
		
	}
	
	// 인증번호 전송
	@ResponseBody
	@PostMapping("/sendSMSRandomNumberAjax")
	public int sendSMSRandomNumberAjax(String toNumber) {
		
		int randomNumber = MessageApi.randomNumber();
		
		MessageApi.sendMessage(toNumber, randomNumber);
		
		return randomNumber;
		
	}
	
	// 회원에게 비밀번호 전송
	@ResponseBody
	@PostMapping("/sendSMSMemberPwAjax")	
	public String sendSMSMemberPwAjax(String toNumber,String pw) {
		
		MessageApi.sendPwMessage(toNumber, pw);
		
		return pw;
		
	}
	
	// 도서정보 삭제
	@ResponseBody
	@PostMapping("/deleteBookInfoAjax")
	public String deleteBookInfoAjax(String bookCode) {
		
		// 도서 정보 조회 후 삭제 여부 문자 리턴
		// 도서의 대여 혹은 예약 정보가 있다면 N
		// 정보가 없다면 (삭제 가능한 상태라면) 삭제 후 Y
		
		return adminSerivce.selectBookInfoAndDeleteBookisDeleteYorN(bookCode);
		
	}
	
	
}