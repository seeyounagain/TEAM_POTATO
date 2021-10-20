package com.potato.project.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;
import com.potato.project.member.vo.MemberVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메뉴 목록 조회
	@Override
	public List<MenuVO> selectMenuList(MemberVO memberVO) {
		
		return sqlSession.selectList("commonMapper.selectMenuList",memberVO);
		
	}
	
	// 사이드 메뉴 목록 조회
	@Override
	public List<SideMenuVO> selectSideMenuList(MenuVO menuVO) {

		return sqlSession.selectList("commonMapper.selectSideMenuList",menuVO);
		
	}
	
}
