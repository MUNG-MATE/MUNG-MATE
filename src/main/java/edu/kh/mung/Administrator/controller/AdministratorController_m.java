package edu.kh.mung.Administrator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.mung.Administrator.model.service.AdministratorService;

@Controller
public class AdministratorController_m {
	
	@Autowired // MypageService 자식 MyPageServiceImpl 의존성 주입(DI)
	private AdministratorService service;
	
	@RequestMapping("/Administrator/faq")
	public String faq() {
		return "Administrator/faq";
		
	}
	@RequestMapping("/Administrator/declaration")
	public String declaration() {
		return "Administrator/declaration";
		
	}
	@RequestMapping("/Administrator/management")
	public String management() {
		return "Administrator/management";
		
	}
	@RequestMapping("/Administrator/reserve")
	public String reserve() {
		return "Administrator/reserve";
		
	}
	@RequestMapping("/Administrator/petManagement")
	public String petManagement() {
		return "Administrator/petManagement";
		
	}

}
