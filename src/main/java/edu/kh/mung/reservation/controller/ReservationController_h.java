package edu.kh.mung.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.Reservation_h;

@Controller
@RequestMapping("/reservation")
@SessionAttributes("{loginMember}")
public class ReservationController_h {

	@GetMapping("/1")
	public String reservation1() {
		return "/reservation/reservation_1";
	}
	
	
	@PostMapping("/1")
	public String reservationType(Model model,Reservation_h rs) {
		
		 model.addAttribute("rs", rs);
		System.out.println("rs1 : "+ rs);
		
		return "/reservation/reservation_2";
	}
	
	@GetMapping("/2")
	public String reservation2() {
		return "/reservation/reservation_2";
	}
	
	@PostMapping("/2")
	public String reservationDate(Model model,Reservation_h rs, HttpSession session) {
		model.addAttribute("rs", rs);
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
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
	public String reservationPetSitter(Model model,Reservation_h rs) {
		
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
