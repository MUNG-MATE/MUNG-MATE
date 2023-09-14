package edu.kh.mung.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.reservation.model.dto.Pet;
import edu.kh.mung.reservation.model.dto.Reservation;

@Repository
public class MyPageDAO_k {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인 회원의 예약 목록 조회
	public List<Reservation> selectRsList(int memberNo) {
		
		List<Reservation> rsList = sqlSession.selectList("myPageMapper_k.selectRsList", memberNo);
		
		List<Pet> petList = new ArrayList<Pet>();
		
		for(Reservation rs : rsList) {
			int rsNo = rs.getRsNo();
			List<Integer> petNoList = sqlSession.selectList("myPageMapper_k.selectPetNo", rsNo);
			
			/*
			 * for(int petNo : petNoList) { Pet pet =
			 * sqlSession.selectOne("myPageMapper_k.selectPetList", petNo);
			 * System.out.println("pet : " + pet); petList.add(pet); }
			 * rs.setPetList(petList);
			 */
		}
		
		System.out.println("rsList : " + rsList);
		
		return rsList;
	}
}
