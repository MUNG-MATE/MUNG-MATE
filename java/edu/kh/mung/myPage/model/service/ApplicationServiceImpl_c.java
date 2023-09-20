package edu.kh.mung.myPage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mung.common.utility.Util;
import edu.kh.mung.myPage.model.dao.ApplicationDAO_c;
import edu.kh.mung.myPage.model.dto.Application;


@Service
public class ApplicationServiceImpl_c implements ApplicationService_c {
	
	@Autowired
	private ApplicationDAO_c dao;
	
	// 일반회원 -> 펫시터 신청하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertApp(Application app) {
		app.setAppContent(Util.XSSHandling(app.getAppContent()));
		
		return dao.insertApp(app);
	}
	
	// 일반회원 -> 펫시터 신청한 내역 조회
	@Override
	public List<Application> selectAppList() {
		
		return dao.selectAppList();
	}
	
	// 관리자가 일반회원 -> 펫시터 신청 수락하기
	@Override
	public int insertPetsitter(Map<String, Object> map) {
		return dao.insertPetsitter(map);
	}
	
	// 신청 수락이 되었을 때 펫시터 상태가 Y로 전환
	@Override
	public int updateMember(Map<String, Object> map) {
		
		return dao.updateMember(map);
	}
	
	// 펫시터 상태까지 Y로 바꾼 후엔 신청 테이블에서 신청 내역 지우기
	@Override
	public int deleteApp(Map<String, Object> map) {
		
		return dao.deleteApp(map);
	}

}
