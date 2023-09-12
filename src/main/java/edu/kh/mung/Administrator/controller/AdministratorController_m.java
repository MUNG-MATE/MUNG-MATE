package edu.kh.mung.Administrator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.mung.Administrator.model.service.AdministratorService;
import edu.kh.mung.member.model.dto.Member;

@RequestMapping("/Administrator")
@Controller
public class AdministratorController_m {

	@Autowired 
	private AdministratorService service;
	
	@RequestMapping("/Administrator/declaration")

	public String declaration() {


		return "Administrator/declaration";

	}
	@GetMapping("/reserve")
	public String reserve() {
		return "Administrator/reserve";

	}
	@GetMapping("/petManagement")
	public String petManagement() {
		return "Administrator/petManagement";

	}

}
