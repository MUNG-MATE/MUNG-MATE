package edu.kh.mung.myPage.model.service;

import java.util.List;

import edu.kh.mung.myPage.model.dto.Application;

public interface ApplicationService_o {

	/** 펫시터에서 일반회원 페이지로 이동
	 * @param app
	 * @return
	 */
	int goToGeneral(Application app);

	/** 펫시터에서 일반회원 신청 리스트 조회
	 * @return
	 */
	List<Application> selectAppList();

	/** 펫시터에서 일반회원으로 전환
	 * @param appNo
	 * @return
	 */
	int petsitterDelete(int appNo);

	/** 펫시터 N으로 바꾸기
	 * @param memberNo
	 * @return 
	 */
	int petSitterDeleteN(int memberNo);

	/** 신청테이블에서 삭제
	 * @param memberNo
	 * @return
	 */
	int appDelete(int memberNo);

}
