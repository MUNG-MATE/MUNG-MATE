package edu.kh.mung.reservation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
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

	/** 선택 된 펫시터 정보 조회
	 * @param petSitterNo
	 * @return
	 */
	public PetSitter choicePetSitter(int petSitterNo) {
		return sqlSession.selectOne("reservationMapper.choicePetSitter", petSitterNo);
	}


}
