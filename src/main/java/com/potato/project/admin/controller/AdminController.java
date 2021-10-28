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
import com.potato.project.common.util.FileUploadUtil;
import com.potato.project.common.util.UploadUtil;
import com.potato.project.common.vo.BookImgVO;
import com.potato.project.common.vo.BookVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.RentalVO;
import com.potato.project.common.vo.ReserveVO;
import com.potato.project.content.service.SearchService;
import com.potato.project.member.vo.MemberVO;

@Controller
@RequestMapping("/libManage")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminSerivce;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	// 도서관리 페이지 이동
	@GetMapping("/bookManage")
	public String bookManage(Model model,MenuVO menuVO,HttpSession session,BookVO bookVO) {
		
		// 도서 목록 전달
		model.addAttribute("bookList",searchService.selectStatusBookList(bookVO));
		
		return  "admin/book_manage";
		
	}
	
	// 회원 관리 페이지 이동
	@GetMapping("/memberManage")
	public String memberManage(Model model,MenuVO menuVO,HttpSession session) {
		
		// 회원 정보 전달
		model.addAttribute("memberList",adminSerivce.selectMemberListAndBookCnt());
		
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
	public String regBookForm(Model model,MenuVO menuVO,HttpSession session) {

		return "admin/reg_book_form";
		
	}
	
	// 도서 등록
	@PostMapping("/regBook")
	public String regBook(BookVO bookVO,MenuVO menuVO,MultipartHttpServletRequest multi) {
		
		// 첨부파일 UPLOAD
		
		// 첨부된 파일명 가져오기
		MultipartFile file = multi.getFile("file"); 
				
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
		
		int result1 = adminSerivce.insertBook(bookVO);
		int result2 = adminSerivce.insertBookImg(bookVO);
		
		if (result1 == 1 && result2 == 1) {
			System.out.println("도서 등록 성공");
		}
		
		return "redirect:/libManage/regBookForm?menuCode=" + menuVO.getMenuCode();
		
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
	
	
}