package edu.kh.mung.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String sample() {
		return "index";
		
	}
	
	@RequestMapping("/info")
	public String info() {
		return "info";
	}
	
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
	
}
