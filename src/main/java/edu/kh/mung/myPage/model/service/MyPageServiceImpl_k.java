package edu.kh.mung.myPage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dao.MyPageDAO_k;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.reservation.model.dto.Reservation;

@Service
public class MyPageServiceImpl_k implements MyPageService_k {
	
	@Autowired
	private MyPageDAO_k dao;
	
	// 로그인 회원의 예약 목록 조회
	@Override
	public List<Reservation> selectRsList(Member loginMember) {
		return dao.selectRsList(loginMember);
	}
	
	// 예약한 회원의 정보 조회
	@Override
	public Member selectMember(int memberNo) {
		return dao.selectMember(memberNo);
	}
}
