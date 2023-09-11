package edu.kh.mung.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.myPage.model.dao.ApplicationDAO_o;
import edu.kh.mung.myPage.model.dto.Application;

@Service
public class ApplicationServiceImpl_o implements ApplicationService_o {

	@Autowired
	private ApplicationDAO_o dao;

	/**
	 * 펫시터에서 일반회원 전환
	 */
	@Override
	public int goToGeneral(Application app) {
		
		return dao.goToGeneral(app);
	}
	
}
