package com.potato.project.service.service;

import java.util.List;

import com.potato.project.service.vo.ReadingSeatVO;

//천화 
public interface ServiceService {
	
	//시트 리스트
	List<ReadingSeatVO> selectReadingSeat();

}
