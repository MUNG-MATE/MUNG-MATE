package edu.kh.mung.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("{loginMember}")
@RequestMapping("/petsitter")
public class PetSitterController_p {
	
//	//화면 전환
//	@GetMapping("/reservationList_p")
//	public String reservationList() {
//		
//		return "petsitter/reservationList_p";
//	}
//	
	//펫시터 예약목록 조회
	@GetMapping("/reservationList_p")
	public String selectRvList() {
		
		return "petsitter/reservationList_p";
	}

}
