package com.potato.project.content.controller;




import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.potato.project.common.service.CommonService;
import com.potato.project.common.util.FileUploadUtil;
import com.potato.project.common.util.UploadUtil;
import com.potato.project.common.vo.AttachFileVO;
import com.potato.project.common.vo.MenuVO;
import com.potato.project.content.service.BoardService;
import com.potato.project.content.vo.NoticeVO;
import com.potato.project.content.vo.QnaAnswerVO;
import com.potato.project.content.vo.QnaVO;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//공지사항 페이지로 이동
	@RequestMapping("/notice")
	public String goNotice(Model model, MenuVO menuVO, NoticeVO noticeVO, HttpSession session) {
		
		int totalCnt = boardService.cntNotice(noticeVO);
		
		noticeVO.setTotalCnt(totalCnt);
		noticeVO.setPageInfo();
		
		model.addAttribute("list", boardService.selectNoticeList(noticeVO));

		return  "board/notice_list";
	}
	
	//공지사항 작성 페이지로 이동
	@GetMapping("/noticeForm")
	public String goNoticeForm(Model model, MenuVO menuVO, HttpSession session) {
		
		//오늘 날짜 입력
		model.addAttribute("nowDate",UploadUtil.getNowDateTime("day"));
	
		return "board/notice_form";
	}
	
	//공지사항 등록
	@PostMapping("/insertNotice")
	public String insertNotice(MenuVO menuVO,NoticeVO noticeVO, MultipartHttpServletRequest multi) {
		
		//파일명 가져오기
		MultipartFile inputName = multi.getFile("file");
		
		//공지사항 등록
		boardService.insertNotice(noticeVO);
		
		if(!inputName.getOriginalFilename().equals("")) {
			//파일이 있으면...
			
			
			//파일이 첨부될 경로
			//학원
			String uploadPath = "D:\\git\\ShinMinHwi\\TEAM_POTATO\\src\\main\\webapp\\resources\\noticeFileUpload\\";
			//집
			//String uploadPath = "C:\\git\\ShinMinHwi\\TEAM_POTATO\\src\\main\\webapp\\resources\\noticeFileUpload\\";
			//시윤
			//String uploadPath = "D:\\myGit\\TEAM_POTATO\\src\\main\\webapp\\resources\\noticeFileUpload\\";
			
			//파일 첨부에 필요한 공지사항 코드 생성
			String noticeCode = boardService.selectNoticeCode();
			//파일 첨부에 필요한 파일 코드의 숫자를 조회
			int nextFileCodeNum = boardService.nextFileCodeNum();
			
			
			try {
				//업로드될 파일명 설정
				String uploadFileName = FileUploadUtil.getNowDateTime() + "_" + inputName.getOriginalFilename();
				inputName.transferTo(new File(uploadPath + uploadFileName));
				
				String fileCode = "FILE_" + String.format("%03d", nextFileCodeNum++);
				
				noticeVO.setAttachFileVO(new AttachFileVO(fileCode, inputName.getOriginalFilename(), uploadFileName, noticeCode));
				noticeVO.setNoticeCode(noticeCode);
				
			}catch(IllegalStateException e) {
				//업로드 예외 발생 시
				e.printStackTrace();
	
			}catch(IOException e) {
				//파일 입출력 예외 발생 시
				e.printStackTrace();
			}
			
			//첨부파일 등록
			boardService.insertNoticeFile(noticeVO);
			
		}
		
		return "redirect:/board/notice?menuCode=" + menuVO.getMenuCode();
	}
	
	//공지사항 상세보기
	@GetMapping("/noticeDetail")
	public String noticeDetail(MenuVO menuVO, Model model, NoticeVO noticeVO) {
		
		boardService.updateReadCnt(noticeVO);
		model.addAttribute("notice", boardService.selectNotice(noticeVO));
		
		return "board/notice_detail";
	}
	
	//공지사항 삭제하기
	@GetMapping("/deleteNotice")
	public String deleteNotice(MenuVO menuVO, NoticeVO noticeVO) {
		
		boardService.deleteNotice(noticeVO);
		
		return "redirect:/board/notice?menuCode=" + menuVO.getMenuCode();
	}
	
	//공지사항 수정으로 이동
	@GetMapping("/updateNotice")
	public String goUpdateNotice(MenuVO menuVO, NoticeVO noticeVO, Model model) {
		
		model.addAttribute("notice", boardService.selectNotice(noticeVO));
		
		return "board/notice_update";
	}
	
	//공지사항 수정
	@PostMapping("/noticeUpdate")
	public String updateNotice(MenuVO menuVO, NoticeVO noticeVO) {
	
		boardService.updateNotice(noticeVO);
		
		return "redirect:/board/noticeDetail?menuCode=" + menuVO.getMenuCode()+ "&noticeCode=" + noticeVO.getNoticeCode();
	}
	
	//---------------------------------- 상담 문의 부분 -------------------------------------\\
	
	//상담 문의 페이지로 이동
	@RequestMapping("/qna")
	public String goQna(Model model, QnaVO qnaVO, MenuVO menuVO) {

		int totalCnt = boardService.cntQna();
		
		qnaVO.setTotalCnt(totalCnt);
		qnaVO.setPageInfo();

		model.addAttribute("list", boardService.selectQnaList(qnaVO));

		return  "board/qna_list";
	}
	
	//상담 문의 등록으로 이동
	@GetMapping("/qnaForm")
	public String goQnaForm(Model model,MenuVO menuVO, HttpSession session) {
		
		//오늘 날짜 입력
		model.addAttribute("nowDate", UploadUtil.getNowDateTime("day"));
		
		return "board/qna_form";
	}
	
	//상담 문의 등록
	@PostMapping("/insertQna")
	public String insertQna(QnaVO qnaVO, MenuVO menuVO) {
		
		boardService.insertQna(qnaVO);
		
		
		return "redirect:/board/qna?menuCode=" + menuVO.getMenuCode();
	}
	
	//상담문의 비밀번호 확인
	@PostMapping("/qnaPassword")
	public String qnaPassword(QnaVO qnaVO, MenuVO menuVO, HttpSession session) {

		return "board/qna_password";
	}
	
	//상담문의 상세보기
	@GetMapping("/qnaDetail")
	public String goQnaDetail(Model model, MenuVO menuVO, QnaVO qnaVO, QnaAnswerVO qnaAnswerVO) {
		//오늘 날짜 입력
		model.addAttribute("nowDate", UploadUtil.getNowDateTime("day"));
		
		model.addAttribute("qna",boardService.selectQna(qnaVO));
		model.addAttribute("answer", boardService.selectAnsewerList(qnaAnswerVO));
		
		return "board/qna_detail";
	}
	
	//상담문의 답변 추가하기
	@PostMapping("/insertAnswer")
	public String insertAnswer(Model model, MenuVO menuVO, QnaVO qnaVO, QnaAnswerVO qnaAnswerVO) {

		boardService.insertAnswer(qnaAnswerVO);
		boardService.updateAcnt(qnaVO);
		
		//redirect 방식은 데이터값을 가져가지 않기 때문에 다시 호출해주어야 함
		return "redirect:/board/qnaDetail?qnaCode=" + qnaVO.getQnaCode() + "&menuCode=" + menuVO.getMenuCode();
	}
	
	//문의, 답변 동시에 삭제
	@GetMapping("/deleteQna")
	public String deleteQna(Model model, MenuVO menuVO, QnaVO qnaVO) {
		
		boardService.deleteQna(qnaVO);
		
		return "redirect:/board/qna?menuCode=" + menuVO.getMenuCode();
	}
	//답변만 삭제
	@GetMapping("/deleteAnswer")
	public String deleteAnswer(Model model, MenuVO menuVO, QnaVO qnaVO) {
		
		boardService.deleteAnswer(qnaVO);
		boardService.updateDeleteAcnt(qnaVO);
		
		return "redirect:/board/qnaDetail?qnaCode=" + qnaVO.getQnaCode() + "&menuCode=" + menuVO.getMenuCode();
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

