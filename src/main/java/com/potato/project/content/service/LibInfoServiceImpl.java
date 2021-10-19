package com.potato.project.content.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//봉 생성
@Service("libInfoService")
public class LibInfoServiceImpl implements LibInfoService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
