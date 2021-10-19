package com.potato.project.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.common.vo.MenuVO;
import com.potato.project.common.vo.SideMenuVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메뉴 목록 조회
	@Override
	public List<MenuVO> selectMenuList() {
		
		return sqlSession.selectList("commonMapper.selectMenuList");
		
	}
	
	// 사이드 메뉴 목록 조회
	@Override
	public List<SideMenuVO> selectSideMenuList(String menuCode) {

		return sqlSession.selectList("commonMapper.selectSideMenuList",menuCode);
		
	}
	
}
