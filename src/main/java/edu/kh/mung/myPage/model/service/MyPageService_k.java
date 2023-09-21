package edu.kh.mung.myPage.model.service;

import java.util.List;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.Reservation;

public interface MyPageService_k {

	/** 로그인 회원의 예약 목록 조회
	 * @param loginMember
	 * @return rsList
	 */
	List<Reservation> selectRsList(Member loginMember);

	/** 예약한 회원의 정보 조회
	 * @param memberNo
	 * @return member
	 */
	Member selectMember(int memberNo);
}
