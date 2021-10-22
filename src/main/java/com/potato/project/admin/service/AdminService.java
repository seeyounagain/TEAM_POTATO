package com.potato.project.admin.service;

import com.potato.project.common.vo.BookVO;

public interface AdminService {
	
	// 도서 등록
	int insertBook(BookVO bookVO);
	
	// 도서 이미지 등록
	int insertBookImg(BookVO bookVO);
	
}
