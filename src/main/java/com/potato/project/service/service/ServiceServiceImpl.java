package com.potato.project.service.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.service.vo.ReadingSeatVO;
//천화 
@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReadingSeatVO> selectReadingSeat() {
		
		return sqlSession.selectList("serviceMapper.selectListReadingSeat");
	}
	
	
	
}
