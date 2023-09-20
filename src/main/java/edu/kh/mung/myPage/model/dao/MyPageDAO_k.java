package edu.kh.mung.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.reservation.model.dto.Pet2;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@Repository
public class MyPageDAO_k {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인 회원의 예약 목록 조회
	public List<Reservation> selectRsList(Member loginMember) {
		
		List<Reservation> rsList = new ArrayList<Reservation>();
		Reservation newRs = new Reservation();
		
		if(loginMember.getPetsitterFlag().equals("Y")) {
			int psNo = sqlSession.selectOne("myPageMapper_k.selectPetSitterNo", loginMember);
			rsList = sqlSession.selectList("myPageMapper_k.selectRsList_ps", psNo);
			
		} else {
			rsList = sqlSession.selectList("myPageMapper_k.selectRsList", loginMember);
		}

		for (Reservation rs : rsList) {

			// 펫시터 번호로 찜 목록 수를 조회
			int petSitterNo = rs.getPetSitterNo();
			int wishListCount = sqlSession.selectOne("myPageMapper_k.selectWishListCount", petSitterNo);
			rs.getPetSitterList().get(0).setWishListCount(wishListCount); // 찜 목록 수를 펫시터 리스트에 삽입
			
			List<Pet2> petList = new ArrayList<Pet2>(); // 펫 목록을 담을 리스트 생성

			// 예약 번호로 펫 번호를 조회
			int rsNo = rs.getRsNo();
			List<Integer> petNoList = sqlSession.selectList("myPageMapper_k.selectPetNo", rsNo); // petNoList : [1, 3]

			// 예약 번호로 얻어온 펫 번호로 펫 목록 조회
			for (int petNo : petNoList) {
				Pet2 pet = sqlSession.selectOne("myPageMapper_k.selectPetList", petNo); // pet : Pet(petNo=1, ...)
				petList.add(pet);
			}

			rs.setPetList(petList);
			newRs = rs;
		}
		rsList.add(newRs);
		System.out.println("rsList : " + rsList);

		return rsList;
	}
}
