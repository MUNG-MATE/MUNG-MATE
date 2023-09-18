package edu.kh.mung.reservation.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

public interface ReservationService_h {

	/** 펫시터 정보 조회
	 * @param rs
	 * @return
	 */
	List<PetSitter> selectPetSitter(Reservation rs);

	PetSitter choicePetSitter(int petSitterNo);

	/** 결제
	 * @param map
	 * @return result
	 */
	int payResult(Map<String, Object> map);


}
