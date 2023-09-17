package edu.kh.mung.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;
import edu.kh.mung.reservation.model.dto.ServiceType;
import edu.kh.mung.reservation.model.service.ReservationService_h;

@Controller
@RequestMapping("/reservation")
@SessionAttributes("{loginMember, loginMemberPet}")
public class ReservationController_h {
	
	@Autowired
	private ReservationService_h service;

	@GetMapping("/1")
	public String reservation1(ServiceType st, Model model) {
		
//		List<ServiceType> stNo = service.serviceType(st);
		
		model.addAttribute("st", st);
		System.out.println("st 확인 : " + st);
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
								, @SessionAttribute(value="loginMember", required = false) Member loginMember
								, @SessionAttribute(value="loginMemberPet", required=false) Pet pet
								, @RequestHeader("referer") String referer
								, String[] rsAddress) {
		
		
		rs.setMemberNo(loginMember.getMemberNo());
		
		//펫시터 정보 얻어오기
		List<PetSitter> petSitterList = service.selectPetSitter(rs);
		rs.setPetSitterList(petSitterList);
		
		
		model.addAttribute("rs", rs);
		model.addAttribute("pet", pet);
		
		
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
	public String reservationPetSitter(Model model,Reservation rs, HttpSession session,
									@SessionAttribute("loginMember") Member loginMember,
									@SessionAttribute("loginMemberPet") List<Pet> pet,
									@RequestHeader("referer") String referer,
									String[] rsAddress) {
		
		List<PetSitter> petSitterList = service.selectPetSitter(rs);
		rs.setPetSitterList(petSitterList);
		
		// 로그인 한 회원의 회원 번호 세팅
		rs.setMemberNo(loginMember.getMemberNo());
		int petSitterNo = rs.getPetSitterNo();
		
		
		// 받아온 petSitterNo로 선택한 펫시터 조회
		PetSitter petSitter = service.choicePetSitter(petSitterNo);
		
		model.addAttribute("pet", pet);
		model.addAttribute(loginMember);
		model.addAttribute("rs" , rs);
		model.addAttribute("petSitter" , petSitter);
		System.out.println("rs4 : " + rs);
		return "/reservation/reservation_5";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/5")
	public String reservation5(Model model, Reservation rs, HttpSession session,
								@SessionAttribute("loginMember") Member loginMember,
								@SessionAttribute("loginMemberPet") List<Pet> pet) {
		System.out.println("rs5 : " + rs);
		return "/reservation/reservation_5";
	}
	
	@PostMapping("/5")
	public String reservationPayment(Model model, Reservation rs, HttpSession session) {
//		rs.setPetSitterNo(petSitterNo);

		
		return "/reservation/reservation_6";
	}
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/6")
	public String reservation6() {
		return "/reservation/reservation_6";
	}
	
}
