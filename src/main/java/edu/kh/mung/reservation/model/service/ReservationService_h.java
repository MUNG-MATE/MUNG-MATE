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

	/** 예약 테이블에 insert하기
	 * @param map
	 * @return result
	 */
	int payResult(Map<String, Object> map);

	/** 예약 번호 미리 얻어오기
	 * @param map 
	 * @return rsNo
	 */
	int selectreservationNo(Map<String, Object> map);

	/** 결제 테이블 insert 하기
	 * @param map
	 * @return result
	 */
	int insertReservation(Map<String, Object> map);

	/** 반려견 예약 테이블에 insert 하기
	 * @param map
	 * @return result
	 */
	int insertRevPet(Map<String, Object> map);


}
