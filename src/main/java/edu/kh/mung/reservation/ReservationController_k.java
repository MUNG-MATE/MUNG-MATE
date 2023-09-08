package edu.kh.mung.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/reservation")
@SessionAttributes("{loginMember}")
public class ReservationController_k {

	@GetMapping("/1")
	public String reservation1() {
		return "/reservation/reservation_1";
	}
	
	@GetMapping("/2")
	public String reservation2() {
		return "/reservation/reservation_2";
	}
	
	@GetMapping("/3")
	public String reservation3() {
		return "/reservation/reservation_3";
	}
	
	@GetMapping("/4")
	public String reservation4() {
		return "/reservation/reservation_4";
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
