package edu.kh.mung.myPage.model.service;

import java.util.List;
import java.util.Map;

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

	/** 관리자가 일반회원 -> 펫시터 신청 수락하기
	 * @param map
	 * @return
	 */
	int insertPetsitter(Map<String, Object> map);

	/** 신청 수락이 되었을 때 펫시터 상태가 Y로 전환
	 * @param map
	 * @return result
	 */
	int updateMember(Map<String, Object> map);

	/** 신청도 받아주고 펫시터 상태도 변경 했을 때 신청 내역 없애버리기
	 * @param map
	 * @return result
	 */
	int deleteApp(Map<String, Object> map);

}
