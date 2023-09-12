package edu.kh.mung.myPage.model.service;

import java.util.List;

import edu.kh.mung.myPage.model.dto.Application;

public interface ApplicationService_c {

	/** 일반회원 -> 펫시터 신청하기
	 * @param app
	 * @return result
	 */
	int insertApp(Application app);

	/** 일반회원 -> 펫시터 신청한 내역 조회하기
	 * @return appList
	 */
	List<Application> selectAppList();

}
