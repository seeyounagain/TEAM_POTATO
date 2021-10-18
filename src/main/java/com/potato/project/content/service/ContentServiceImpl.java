package com.potato.project.content.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
