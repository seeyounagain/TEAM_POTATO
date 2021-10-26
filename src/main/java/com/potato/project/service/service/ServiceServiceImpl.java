package com.potato.project.service.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.project.service.vo.ReadingRecordVO;
import com.potato.project.service.vo.ReadingSeatVO;
//천화 
@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//시트 리스트
	@Override
	public List<ReadingSeatVO> selectReadingSeat() {
		return sqlSession.selectList("serviceMapper.selectReadingSeat");
	}

	@Override
	public ReadingSeatVO chooseSeat(String seatCode) {
		return sqlSession.selectOne("serviceMapper.chooseSeat", seatCode);
	}

	@Override
	public void seatUpdate(ReadingSeatVO seatVO) {
		sqlSession.update("serviceMapper.seatUpdate", seatVO);
		
	}

	@Override
	public String seatIdCheck(String id) {
		return sqlSession.selectOne("serviceMapper.seatIdCheck", id);
	}

	@Override
	public String seatMemberIdCheck(String id) {
		return sqlSession.selectOne("serviceMapper.seatMemberIdCheck", id);
	}

	@Override
	public void seatInRecord(ReadingSeatVO seatVO) {
		sqlSession.insert("serviceMapper.seatInRecord", seatVO);
		
	}

	@Override
	public void seatOutRecord(ReadingSeatVO seatVO) {
		sqlSession.update("serviceMapper.seatOutRecord", seatVO);
	}

	@Override
	public List<ReadingRecordVO> seatRecordList() {
		return sqlSession.selectList("serviceMapper.seatRecordList");
		
	}
	
	
	
}
