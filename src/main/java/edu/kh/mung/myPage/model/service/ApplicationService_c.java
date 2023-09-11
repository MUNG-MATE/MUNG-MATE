package edu.kh.mung.myPage.model.service;

import edu.kh.mung.myPage.model.dto.Application;

public interface ApplicationService_c {

	/** 일반회원 -> 펫시터 신청하기
	 * @param app
	 * @return result
	 */
	int insertApp(Application app);

}
