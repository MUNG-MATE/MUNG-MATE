package edu.kh.mung.myPage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dao.MyPageDAO_k;
import edu.kh.mung.reservation.model.dto.Reservation;

@Service
public class MyPageServiceImpl_k implements MyPageService_k {
	
	@Autowired
	private MyPageDAO_k dao;
	
	@Override
	public List<Reservation> selectRsList(Member loginMember) {
		return dao.selectRsList(loginMember);
	}

}
