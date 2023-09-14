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

		Reservation newRs = new Reservation();
		
		List<Reservation> rsList = sqlSession.selectList("myPageMapper_k.selectRsList", memberNo);

		for (Reservation rs : rsList) {
			
			List<Pet> petList = new ArrayList<Pet>();
			int rsNo = rs.getRsNo();
			List<Integer> petNoList = sqlSession.selectList("myPageMapper_k.selectPetNo", rsNo); // petNoList : [1, 3]

			for(int petNo : petNoList) { 
				Pet pet = sqlSession.selectOne("myPageMapper_k.selectPetList", petNo); // pet : Pet(petNo=1, ...)
				System.out.println("pet : " + pet);
				petList.add(pet);
			}
			
			rs.setPetList(petList);
			System.out.println("petList : " + petList);
			newRs = rs;
		}
		
		rsList.add(newRs);
		System.out.println("rsList : " + rsList);

		return rsList;
	}
}
