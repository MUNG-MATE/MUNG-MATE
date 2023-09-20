package edu.kh.mung.myPage.model.service;

import java.util.List;

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

	/**
	 * 펫시터에서 일반회원 리스트 조회
	 */
	@Override
	public List<Application> selectAppList() {
		return dao.selectAppList();
	}

	/**
	 *펫시터에서 일반회원으로 조회
	 */
	@Override
	public int petsitterDelete(int memberNo) {
		return dao.petsitterDelete(memberNo);
	}

	/**
	 * 펫시터 N으로 바꾸기
	 */
	@Override
	public int petSitterDeleteN(int memberNo) {
		return dao.petSitterDeleteN(memberNo);
	}

	/**
	 * 신청 테이블에서 삭제
	 */
	@Override
	public int appDelete(int memberNo) {
		return dao.appDelete(memberNo);
	}
	
}
