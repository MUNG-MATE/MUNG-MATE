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

}
