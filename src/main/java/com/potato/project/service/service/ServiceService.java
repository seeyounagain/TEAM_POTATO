package com.potato.project.service.service;

import java.util.List;

import com.potato.project.service.vo.ReadingSeatVO;

 
public interface ServiceService {
	
	//시트 리스트
	List<ReadingSeatVO> selectReadingSeat();
	
	//시트
	ReadingSeatVO chooseSeat(String seatCode);
	
	void seatUpdate(ReadingSeatVO seatVO);
	
	String seatIdCheck(String id);
}
