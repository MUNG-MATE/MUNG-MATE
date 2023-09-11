package edu.kh.mung.Administrator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import edu.kh.mung.Administrator.model.service.FAQService;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class FAQController_o {
	
	@Autowired
	private FAQService service;
	
	@PostMapping("/Administrator/faq")
	public String FAQ(@PathVariable("boardCode")int boardCode){
		
		return null;
		
	}
	
	
}
