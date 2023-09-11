package edu.kh.mung.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		return dao.insertApp(app);
	}

}
