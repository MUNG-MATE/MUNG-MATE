package edu.kh.mung.reservation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@Repository
public class ReservationDao_h {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 펫시터 조회
	public List<PetSitter> selectPetSitter(Reservation rs) {
		return sqlSession.selectList("reservationMapper.selectPetSitter", rs);
	}

}
