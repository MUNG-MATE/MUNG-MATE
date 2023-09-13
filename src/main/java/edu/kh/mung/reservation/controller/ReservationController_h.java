package edu.kh.mung.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;
import edu.kh.mung.reservation.model.service.ReservationService_h;

@Controller
@RequestMapping("/reservation")
@SessionAttributes("{loginMember}")
public class ReservationController_h {
	
	@Autowired
	private ReservationService_h service;

	@GetMapping("/1")
	public String reservation1() {
		return "/reservation/reservation_1";
	}
	
	
	@PostMapping("/1")
	public String reservationType(Model model,Reservation rs) {
		
		 model.addAttribute("rs", rs);
		System.out.println("rs1 : "+ rs);
		
		return "/reservation/reservation_2";
	}
	
	@GetMapping("/2")
	public String reservation2() {
		return "/reservation/reservation_2";
	}
	
	@PostMapping("/2")
	public String reservationDate(Model model,Reservation rs, HttpSession session
								, @SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
//		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("rs", rs);
		
		rs.setMemberNo(loginMember.getMemberNo());
		
		//펫시터 정보 얻어오기
		Map<String, Object> map = new HashMap<>();
		
		List<PetSitter> petSitter = service.selectPetSitter(rs);
		
		
		
		
		
		
		
		System.out.println("loginMember : " + loginMember.getMemberNo());
		System.out.println("rs2 : " + rs);
		return "/reservation/reservation_4";
	}
	
	@GetMapping("/3")
	public String reservation3() {
		return "/reservation/reservation_3";
	}
	
	@GetMapping("/4")
	public String reservation4() {
		return "/reservation/reservation_4";
	}
	
	@PostMapping("/4")
	public String reservationPetSitter(Model model,Reservation rs, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute(loginMember);
		System.out.println("rs4 : " + rs);
		return "/reservation/reservation_5";
	}
	
	
	@GetMapping("/5")
	public String reservation5() {
		return "/reservation/reservation_5";
	}
	
	@GetMapping("/6")
	public String reservation6() {
		return "/reservation/reservation_6";
	}
	
}
