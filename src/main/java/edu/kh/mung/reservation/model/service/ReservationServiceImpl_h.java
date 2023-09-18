package edu.kh.mung.reservation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.reservation.model.dao.ReservationDao_h;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@Service
public class ReservationServiceImpl_h implements ReservationService_h{

	
	@Autowired
    private ReservationDao_h dao;

	// 펫시터 정보 조회
	@Override
	public List<PetSitter> selectPetSitter(Reservation rs) {
		return dao.selectPetSitter(rs);
	}

	// 선택된 펫시터 정보 조회
	@Override
	public PetSitter choicePetSitter(int petSitterNo) {
		return dao.choicePetSitter(petSitterNo);
	}

	@Override
	public int payResult(Map<String, Object> map) {
		return dao.payResult(map);
	}

}
