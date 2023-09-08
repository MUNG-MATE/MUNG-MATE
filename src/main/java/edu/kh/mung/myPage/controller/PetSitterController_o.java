package edu.kh.mung.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.myPage.model.service.ApplicationService_o;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/petsitter")
public class PetSitterController_o {
	
	@Autowired
	private ApplicationService_o service;

	@GetMapping("/toPetsitterApply")
	public String ToPetsitterApply() {
		return "petsitter/toPetsitterApply"; 
	}
	
}
