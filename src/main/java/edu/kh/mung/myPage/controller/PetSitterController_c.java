package edu.kh.mung.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/petsitter")
public class PetSitterController_c {
	
	@GetMapping("/toGeneralApply")
	public String ToGeneralApply() {
		
		return "petsitter/toGeneralApply";
	}
}
