package edu.kh.mung.reservation.model.service;

import java.util.List;

import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

public interface ReservationService_h {

	/** 펫시터 정보 조회
	 * @param rs
	 * @return
	 */
	List<PetSitter> selectPetSitter(Reservation rs);

}
