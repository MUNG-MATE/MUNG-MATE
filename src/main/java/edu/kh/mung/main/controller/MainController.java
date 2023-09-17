package edu.kh.mung.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.main.model.service.MainService_h;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@Controller
@SessionAttributes("{loginMember, loginMemberPet}")
public class MainController {
	
	@Autowired
	private MainService_h service;
	
	@RequestMapping("/")
	public String sample() {
		return "index";
		
	}
	
	@RequestMapping("/info")
	public String info(Reservation rs, Model model,PetSitter petSitter,
						@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		
		List<PetSitter> petSitterList = service.petSitterList();
		
		
		
		System.out.println("petSitterList = " + petSitterList);
		model.addAttribute("petSitterList", petSitterList);
		
		return "info";
	}
	
	@PostMapping("/wishList")
	@ResponseBody
	public int wishListCheck(@RequestBody Map<String,Integer> paramMap,
							@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		
		
		System.out.println("너 뭔데 : " + paramMap);
		
		return service.wishListCheck(paramMap);
		
	};
	
}
