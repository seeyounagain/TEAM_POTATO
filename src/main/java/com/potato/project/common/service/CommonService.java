package com.potato.project.common.service;

import java.util.List;

import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;
import com.potato.project.member.vo.MemberVO;

public interface CommonService {
	
	// 메뉴 목록 조회
	List<MenuVO> selectMenuList(MemberVO memberVO);
	
	// 사이드 메뉴 목록 조회
	List<SideMenuVO> selectSideMenuList(MenuVO menuVO);
	
}
