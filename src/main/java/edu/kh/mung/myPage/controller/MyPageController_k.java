package edu.kh.mung.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.myPage.model.service.MyPageService_k;
import edu.kh.mung.reservation.model.dto.Reservation;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({"loginMember"})
public class MyPageController_k {

	@Autowired
	private MyPageService_k service;
	
	// 캘린더 조회
	@GetMapping("/rsList")
	public String rsList() {
		return "/myPage/reservationList";
	}
	
	// 로그인 회원의 예약 목록 조회
	@GetMapping("/selectRsList")
	@ResponseBody
	public List<Reservation> selectRsList(@SessionAttribute("loginMember") Member loginMember) {
		
		int memberNo = loginMember.getMemberNo();
		
		List<Reservation> rsList = service.selectRsList(memberNo);
		
		return rsList;
	}
	
	@GetMapping("/test")
	public String test() {
		return "/test";
	}
}
