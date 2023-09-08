package edu.kh.mung.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/petsitter")
public class PetSitterContorller_o {

	@GetMapping("/toPetsitterApply")
	public String ToPetsitterApply() {
		return "petsitter/toPetsitterApply"; 
	}
	
}
